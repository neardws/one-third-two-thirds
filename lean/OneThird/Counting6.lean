module
public import OneThird.LatticePaths6
public import Mathlib.SetTheory.Cardinal.Finite
@[expose] public section
namespace OneThird.Counting6
open Structure LinearExtensions4 ChainPrefixes5 LatticePaths6
set_option maxHeartbeats 0

instance extension_finite (m : ℕ) : Finite (FamilyExtension m) :=
  inferInstanceAs (Finite {e : Equiv.Perm (Fin (size m)) // Respects (FamilyRelation m) e})

instance path_finite (m : ℕ) : Finite (LatticePath m) :=
  Finite.of_equiv (FamilyExtension m) (extensionPathEquiv m)

/-- Natural label order itself is a linear extension of the generated order. -/
def naturalExtension (m : ℕ) : FamilyExtension m :=
  ⟨Equiv.refl _,by
    intro x y hxy
    have hh := generated_le hxy
    change x.val≤y.val
    exact_mod_cast hh⟩

instance extension_nonempty (m : ℕ) : Nonempty (FamilyExtension m) := ⟨naturalExtension m⟩
instance path_nonempty (m : ℕ) : Nonempty (LatticePath m) :=
  ⟨ofExtension m (naturalExtension m)⟩

theorem extension_card_pos (m : ℕ) : 0<Nat.card (FamilyExtension m) := Nat.card_pos

theorem extension_card_eq_path_card (m : ℕ) :
    Nat.card (FamilyExtension m)=Nat.card (LatticePath m) :=
  Nat.card_congr (extensionPathEquiv m)

/-- Geometric pair event: on the step placing y, x is already in the
preceding grid vertex. This definition makes no reference to extensions. -/
def PathBefore {m : ℕ} (w : LatticePath m) (x y : Fin (size m)) : Prop :=
  ∃k : Fin (size m), w.label k=y ∧
    Prefix ((w.vertex ⟨k.val,by omega⟩).1 : ℤ)
      ((w.vertex ⟨k.val,by omega⟩).2 : ℤ) (x : ℤ)

theorem pathBefore_iff {m : ℕ} (w : LatticePath m) (x y : Fin (size m)) :
    PathBefore w x y ↔ w.toExtension.val x < w.toExtension.val y := by
  constructor
  · rintro ⟨k,hk,hx⟩
    have hr := (w.toExtension_prefix ⟨k.val,by omega⟩ x).mp hx
    have he : w.enumeration k=y := hk
    have hy : w.enumeration.symm y=k := (Equiv.symm_apply_eq w.enumeration).mpr he.symm
    change (w.enumeration.symm x).val<(w.enumeration.symm y).val
    rw [hy]
    exact hr
  · intro h
    let k := w.enumeration.symm y
    refine ⟨k,w.enumeration.apply_symm_apply y,?_⟩
    apply (w.toExtension_prefix ⟨k.val,by omega⟩ x).mpr
    exact h

/-- All actual pair-event spaces are equivalent to independently defined
geometric path-event spaces, including comparable pairs and endpoints. -/
noncomputable def eventEquiv (m : ℕ) (x y : Fin (size m)) :
    {e : FamilyExtension m // e.val x<e.val y} ≃
    {w : LatticePath m // PathBefore w x y} :=
  (extensionPathEquiv m).subtypeEquiv (fun e => by
    change e.val x<e.val y ↔ PathBefore (ofExtension m e) x y
    rw [pathBefore_iff,toExtension_ofExtension])

theorem event_card_eq (m : ℕ) (x y : Fin (size m)) :
    Nat.card {e : FamilyExtension m // e.val x<e.val y} =
    Nat.card {w : LatticePath m // PathBefore w x y} :=
  Nat.card_congr (eventEquiv m x y)

/-- The crossing of the horizontal edge placing a_(i+1) occurs below height
j+1 exactly when a_(i+1) precedes b_(j+1). Indices here are zero based. -/
def Below {m : ℕ} (w : LatticePath m) (i j : Fin (half m)) : Prop :=
  ∃k : Fin (size m), w.label k=chainLabel m 0 i ∧
    (w.vertex ⟨k.val,by omega⟩).2≤j.val

theorem below_iff {m : ℕ} (w : LatticePath m) (i j : Fin (half m)) :
    Below w i j ↔
      w.toExtension.val (chainLabel m 0 i)<w.toExtension.val (chainLabel m 1 j) := by
  have hne : chainLabel m 0 i ≠ chainLabel m 1 j := by
    intro h
    have ha := (chainLabel_injective h).1
    exact (by decide : (0 : Fin 2)≠1) ha
  have hlt : w.toExtension.val (chainLabel m 0 i)<w.toExtension.val (chainLabel m 1 j) ↔
      ¬w.toExtension.val (chainLabel m 1 j)<w.toExtension.val (chainLabel m 0 i) := by
    have hi := w.toExtension.val.injective.ne hne
    exact ⟨fun h => not_lt_of_ge (le_of_lt h),fun h => lt_of_le_of_ne (le_of_not_gt h) hi⟩
  rw [hlt,←pathBefore_iff]
  constructor
  · rintro ⟨k,hk,hj⟩ ⟨l,hl,hp⟩
    have hkl : k=l := w.label_injective (hk.trans hl.symm)
    subst l
    have hp' : j.val<(w.vertex ⟨k.val,by omega⟩).2 := by
      simpa [chainLabel,prefix_odd_iff] using hp
    omega
  · intro hn
    let k := w.enumeration.symm (chainLabel m 0 i)
    have hk : w.label k=chainLabel m 0 i := w.enumeration.apply_symm_apply _
    refine ⟨k,hk,?_⟩
    by_contra h
    apply hn
    refine ⟨k,hk,?_⟩
    have hj : j.val<(w.vertex ⟨k.val,by omega⟩).2 := by omega
    simpa [chainLabel,prefix_odd_iff] using hj

/-- Genuine geometric H-count. Its equality with the six-column DP/transfer
edge sums requires the separate path-counting recurrence theorem. -/
noncomputable def H (m : ℕ) (i j : Fin (half m)) : ℕ :=
  Nat.card {w : LatticePath m // Below w i j}

noncomputable def crossingEventEquiv (m : ℕ) (i j : Fin (half m)) :
    {e : FamilyExtension m // e.val (chainLabel m 0 i)<e.val (chainLabel m 1 j)} ≃
    {w : LatticePath m // Below w i j} :=
  (extensionPathEquiv m).subtypeEquiv (fun e => by
    change e.val (chainLabel m 0 i)<e.val (chainLabel m 1 j) ↔ Below (ofExtension m e) i j
    rw [below_iff,toExtension_ofExtension])

theorem H_eq_event_card (m : ℕ) (i j : Fin (half m)) :
    H m i j = Nat.card {e : FamilyExtension m //
      e.val (chainLabel m 0 i)<e.val (chainLabel m 1 j)} :=
  (Nat.card_congr (crossingEventEquiv m i j)).symm

/-- In particular the bottom minority event has a genuine lattice-path
cardinality interpretation. No identification with N_m is assumed here. -/
theorem bottom_event_card_eq (m : ℕ) :
    Nat.card {e : FamilyExtension m // e.val 1<e.val 0} =
    Nat.card {w : LatticePath m // PathBefore w 1 0} :=
  event_card_eq m _ _

end OneThird.Counting6
