module
public import OneThird.Ideals

@[expose] public section
namespace OneThird.LinearExtensions4
open Structure

/-- A rank permutation is a linear extension when every poset comparison is
respected by its ranks. The convention is rank(element), starting at zero. -/
def Respects {n : ℕ} (r : Fin n → Fin n → Prop) (rank : Equiv.Perm (Fin n)) : Prop :=
  ∀x y, r x y → rank x ≤ rank y

def InitialIdeal {n : ℕ} (r : Fin n → Fin n → Prop)
    (rank : Equiv.Perm (Fin n)) (k : ℕ) : Prop :=
  ∀x y, r x y → (rank y).val<k → (rank x).val<k

/-- The standard prefix-ideal characterization, with no enumeration assumption. -/
theorem respects_iff_initialIdeals {n : ℕ} (r : Fin n → Fin n → Prop)
    (rank : Equiv.Perm (Fin n)) :
    Respects r rank ↔ ∀k, InitialIdeal r rank k := by
  constructor
  · intro h k x y hxy hy
    exact lt_of_le_of_lt (h x y hxy) hy
  · intro h x y hxy
    exact Nat.le_of_lt_succ (h ((rank y).val+1) x y hxy (Nat.lt_succ_self _))

abbrev FamilyRelation (m : ℕ) : Fin (108+20*m) → Fin (108+20*m) → Prop :=
  (familyOrder m).le

/-- Actual finite-poset linear extensions, represented by rank permutations. -/
def FamilyExtension (m : ℕ) :=
  {rank : Equiv.Perm (Fin (108+20*m)) // Respects (FamilyRelation m) rank}

theorem family_prefix_ideal (m : ℕ) (e : FamilyExtension m) (k : ℕ) :
    InitialIdeal (FamilyRelation m) e.val k :=
  (respects_iff_initialIdeals _ _).mp e.property k

/-- Comparisons can equivalently be checked on the original +2/+3 generators. -/
theorem respects_family_iff_generators (m : ℕ)
    (rank : Equiv.Perm (Fin (108+20*m))) :
    Respects (FamilyRelation m) rank ↔
      ∀x y : Fin (108+20*m), Generator m (x : ℤ) (y : ℤ) → rank x ≤ rank y := by
  constructor
  · intro h x y hxy
    exact h x y (.single hxy)
  · intro h x y hxy
    have main : ∀a b : ℤ, Relation.ReflTransGen (Generator m) a b →
        ∀ha : 0≤a ∧ a<108+20*m, ∀hb : 0≤b ∧ b<108+20*m,
        rank ⟨a.toNat,by omega⟩ ≤ rank ⟨b.toNat,by omega⟩ := by
      intro a b hab
      induction hab with
      | refl => intros; exact le_rfl
      | @tail b c hab hbc ih =>
        intro ha hc
        have hb : 0≤b ∧ b<108+20*m := by
          have hab' := generated_le hab
          have hbc' := generated_le (Relation.ReflTransGen.single hbc)
          omega
        exact (ih ha hb).trans (h ⟨b.toNat,by omega⟩ ⟨c.toNat,by omega⟩ (by simpa [max_eq_left hb.1, max_eq_left hc.1] using hbc))
    simpa using main x y hxy ⟨by omega,by omega⟩ ⟨by omega,by omega⟩

/-- Every nonidentity generated comparison jumps by at least two labels. -/
theorem generated_eq_or_gap {m : ℕ} {x y : ℤ}
    (h : Relation.ReflTransGen (Generator m) x y) : x=y ∨ x+2≤y := by
  induction h with
  | refl => exact Or.inl rfl
  | @tail y z hxy hyz _ =>
    have hle := generated_le hxy
    obtain ⟨_,_,hs⟩ := hyz
    right
    rcases hs with hs | ⟨hs,_⟩ <;> omega

/-- In particular the two actual endpoint pairs are incomparable: this lemma
applies to every pair of adjacent original labels. -/
theorem adjacent_incomparable (m : ℕ) (x y : Fin (108+20*m))
    (h : y.val=x.val+1) :
    ¬ FamilyRelation m x y ∧ ¬ FamilyRelation m y x := by
  constructor
  · intro hxy
    have hg := generated_eq_or_gap hxy
    clear hxy
    rcases hg with he | hg <;> omega
  · intro hyx
    have hle : (y : ℤ) ≤ (x : ℤ) := generated_le hyx
    clear hyx
    omega

end OneThird.LinearExtensions4
