module
public import OneThird.Reflection6
public import Mathlib.Data.Finset.Lattice.Fold
@[expose] public section
namespace OneThird.Balance6
open Structure LinearExtensions4 ChainPrefixes5 LatticePaths6 Counting6 Reflection6
set_option maxHeartbeats 0
noncomputable section

/-- Cardinality of an actual linear-extension event. -/
def eventCard (m : ℕ) (x y : Fin (size m)) : ℕ :=
  Nat.card {e : FamilyExtension m // e.val x<e.val y}

/-- Probability under the uniform distribution on all actual extensions. -/
def probability (m : ℕ) (x y : Fin (size m)) : ℝ :=
  (eventCard m x y : ℝ)/Nat.card (FamilyExtension m)

theorem probability_nonneg (m : ℕ) (x y : Fin (size m)) : 0≤probability m x y := by
  unfold probability
  positivity

theorem eventCard_le_total (m : ℕ) (x y : Fin (size m)) :
    eventCard m x y≤Nat.card (FamilyExtension m) :=
  Nat.card_le_card_of_injective Subtype.val Subtype.val_injective

theorem probability_le_one (m : ℕ) (x y : Fin (size m)) : probability m x y≤1 := by
  have hp : (0 : ℝ)<Nat.card (FamilyExtension m) := by exact_mod_cast extension_card_pos m
  unfold probability
  apply (div_le_one hp).mpr
  exact_mod_cast eventCard_le_total m x y

theorem eventCard_partition (m : ℕ) (x y : Fin (size m)) (hne : x≠y) :
    eventCard m x y+eventCard m y x=Nat.card (FamilyExtension m) := by
  classical
  have hh (e : FamilyExtension m) : ¬e.val x<e.val y ↔ e.val y<e.val x := by
    exact ⟨fun h => lt_of_le_of_ne (le_of_not_gt h) (e.val.injective.ne hne.symm),
      fun h => not_lt_of_ge (le_of_lt h)⟩
  let c : {e : FamilyExtension m // ¬e.val x<e.val y} ≃
      {e : FamilyExtension m // e.val y<e.val x} := Equiv.subtypeEquivRight hh
  have hc := Nat.card_congr c
  have ht := Nat.card_congr (Equiv.sumCompl (fun e : FamilyExtension m => e.val x<e.val y))
  rw [Nat.card_sum,hc] at ht
  exact ht

theorem probability_complement (m : ℕ) (x y : Fin (size m)) (hne : x≠y) :
    probability m y x=1-probability m x y := by
  have hp : (Nat.card (FamilyExtension m) : ℝ)≠0 :=
    ne_of_gt (by exact_mod_cast extension_card_pos m)
  have hh : (eventCard m x y : ℝ)+(eventCard m y x : ℝ)=Nat.card (FamilyExtension m) :=
    by exact_mod_cast eventCard_partition m x y hne
  unfold probability
  apply (eq_sub_iff_add_eq).mpr
  rw [←add_div,add_comm]
  rw [hh,div_self hp]

def balance (m : ℕ) (x y : Fin (size m)) : ℝ :=
  min (probability m x y) (probability m y x)

theorem balance_eq_min (m : ℕ) (x y : Fin (size m)) (hne : x≠y) :
    balance m x y=min (probability m x y) (1-probability m x y) := by
  rw [balance,probability_complement m x y hne]

theorem balance_nonneg (m : ℕ) (x y : Fin (size m)) : 0≤balance m x y :=
  le_min (probability_nonneg m x y) (probability_nonneg m y x)

theorem balance_symm (m : ℕ) (x y : Fin (size m)) : balance m x y=balance m y x :=
  min_comm _ _

theorem probability_reflection (m : ℕ) (x y : Fin (size m)) :
    probability m x y=probability m y.rev x.rev := by
  unfold probability eventCard
  rw [reflection_event_card]

theorem balance_reflection (m : ℕ) (x y : Fin (size m)) :
    balance m x y=balance m y.rev x.rev := by
  unfold balance
  rw [probability_reflection m x y,probability_reflection m y x]

theorem endpoint_balance_tie (m : ℕ) :
    balance m 0 1=balance m (1 : Fin (size m)).rev (0 : Fin (size m)).rev :=
  balance_reflection m 0 1

def Incomparable (m : ℕ) (x y : Fin (size m)) : Prop :=
  ¬FamilyRelation m x y ∧ ¬FamilyRelation m y x

theorem incomparable_ne {m : ℕ} {x y : Fin (size m)} (h : Incomparable m x y) : x≠y := by
  intro he
  subst y
  exact h.1 (.refl)

/-- Coverage of actual incomparable pairs by the two parity chains, rather
than just coverage of abstract transfer-cell positions. -/
theorem incomparable_cross {m : ℕ} {x y : Fin (size m)} (h : Incomparable m x y) :
    ∃i j : Fin (half m),
      (x=chainLabel m 0 i ∧ y=chainLabel m 1 j) ∨
      (y=chainLabel m 0 i ∧ x=chainLabel m 1 j) := by
  obtain ⟨a,i,rfl⟩ := label_surjective m x
  obtain ⟨b,j,rfl⟩ := label_surjective m y
  fin_cases a <;> fin_cases b
  · rcases le_total i j with hij | hji
    · exact False.elim (h.1 (chain_comparison m 0 i j hij))
    · exact False.elim (h.2 (chain_comparison m 0 j i hji))
  · exact ⟨i,j,Or.inl ⟨rfl,rfl⟩⟩
  · exact ⟨j,i,Or.inr ⟨rfl,rfl⟩⟩
  · rcases le_total i j with hij | hji
    · exact False.elim (h.1 (chain_comparison m 1 i j hij))
    · exact False.elim (h.2 (chain_comparison m 1 j i hji))

/-- Actual finite-poset balance constant: maximum of the uniform pair
balances over incomparable pairs. Comparable slots contribute only zero. -/
def delta (m : ℕ) : ℝ := by
  classical
  exact (Finset.univ : Finset (Fin (size m) × Fin (size m))).sup'
    Finset.univ_nonempty (fun xy => if Incomparable m xy.1 xy.2 then balance m xy.1 xy.2 else 0)

theorem balance_le_delta (m : ℕ) (x y : Fin (size m)) (h : Incomparable m x y) :
    balance m x y≤delta m := by
  classical
  unfold delta
  have hh := Finset.le_sup' (fun xy : Fin (size m) × Fin (size m) =>
    if Incomparable m xy.1 xy.2 then balance m xy.1 xy.2 else 0)
    (Finset.mem_univ (x,y))
  simpa only [ite_eq_left h] using hh

theorem delta_nonneg (m : ℕ) : 0≤delta m := by
  have hh := balance_le_delta m 0 1 (adjacent_incomparable m 0 1 (by
    change (1 : Fin (size m)).val=(0 : Fin (size m)).val+1
    change 1 % (108+20*m)=1
    exact Nat.mod_eq_of_lt (by omega)))
  exact (balance_nonneg m 0 1).trans hh

/-- An upper bound on cross-chain incomparable pairs suffices for the
actual balance constant. No counting or dominance hypothesis is inserted
into its definition. -/
theorem delta_le_of_cross_bound (m : ℕ) (B : ℝ) (hB : 0≤B)
    (h : ∀i j : Fin (half m), Incomparable m (chainLabel m 0 i) (chainLabel m 1 j) →
      balance m (chainLabel m 0 i) (chainLabel m 1 j)≤B) : delta m≤B := by
  classical
  unfold delta
  apply Finset.sup'_le
  intro xy _
  split_ifs with hi
  · obtain ⟨i,j,hxy | hyx⟩ := incomparable_cross hi
    · obtain ⟨hx,hy⟩ := hxy
      rw [hx,hy]
      exact h i j (by simpa only [hx,hy] using hi)
    · obtain ⟨hy,hx⟩ := hyx
      rw [balance_symm,hy,hx]
      exact h i j ⟨by simpa [hy,hx] using hi.2,by simpa [hy,hx] using hi.1⟩
  · exact hB

/-- The padded finite maximum is attained by a genuine incomparable pair,
so delta is exactly a maximum over such pairs, even if its value is zero. -/
theorem delta_attained (m : ℕ) :
    ∃x y : Fin (size m), Incomparable m x y ∧ delta m=balance m x y := by
  classical
  let f := fun xy : Fin (size m) × Fin (size m) =>
    if Incomparable m xy.1 xy.2 then balance m xy.1 xy.2 else 0
  obtain ⟨xy,_,he⟩ := (Finset.univ : Finset (Fin (size m) × Fin (size m))).exists_mem_eq_sup'
    Finset.univ_nonempty f
  change delta m=f xy at he
  by_cases hi : Incomparable m xy.1 xy.2
  · exact ⟨xy.1,xy.2,hi,by simpa only [f,ite_eq_left hi] using he⟩
  · have hz : delta m=0 := by simpa only [f,ite_eq_right hi] using he
    have hb : Incomparable m (0 : Fin (size m)) 1 :=
      adjacent_incomparable m 0 1 (by
        change 1 % (108+20*m)=1
        exact Nat.mod_eq_of_lt (by omega))
    refine ⟨0,1,hb,?_⟩
    exact le_antisymm (by rw [hz]; exact balance_nonneg m 0 1) (balance_le_delta m 0 1 hb)

end
end OneThird.Balance6
