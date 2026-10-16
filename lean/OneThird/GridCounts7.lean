module
public import OneThird.WalkCounting7
public import OneThird.PathDP
@[expose] public section
namespace OneThird.GridCounts7
open Structure LinearExtensions4 LatticePaths6 Counting6 WalkCounting7
set_option maxHeartbeats 0
attribute [local instance] Classical.propDecidable
abbrev pNat := LatticePaths6.half

/-- Cardinality of a lifted proposition, checked entirely in the kernel. -/
theorem card_prop (P : Prop) [Decidable P] : Nat.card (PLift P)=if P then 1 else 0 := by
  classical
  by_cases h : P
  · let : Nonempty (PLift P) := ⟨⟨h⟩⟩
    simp [h]
  · let : IsEmpty (PLift P) := ⟨fun x => h x.down⟩
    simp [h]

theorem walk_card_zero (V : Grid → Prop) (x y : Grid) :
    Nat.card (Walk V y 0 x)=if x=y ∧ V x then 1 else 0 := by
  simpa only [Walk] using (card_prop (x=y ∧ V x))

theorem walk_card_succ (V : Grid → Prop) (x y : Grid) (n : ℕ) :
    Nat.card (Walk V y (n+1) x)=if V x then
      Nat.card (Walk V y n (right x))+Nat.card (Walk V y n (up x)) else 0 := by
  classical
  change Nat.card (PLift (V x) × (_ ⊕ _))=_
  rw [Nat.card_prod,Nat.card_sum,card_prop]
  split_ifs <;> simp

theorem walk_card_invalid (V : Grid → Prop) (x y : Grid) (n : ℕ) (h : ¬V x) :
    Nat.card (Walk V y n x)=0 := by
  cases n with
  | zero => rw [walk_card_zero]; simp [h]
  | succ n => rw [walk_card_succ]; simp [h]

/-- Actual suffix-path cardinality, with the necessary Manhattan length. -/
noncomputable def G (m i j : ℕ) : ℕ :=
  Nat.card (Walk (Allowed m) (pNat m,pNat m) (2*pNat m-i-j) (i,j))

theorem allowed_bounds {m i j : ℕ} (h : Allowed m (i,j)) :
    i≤pNat m ∧ j≤pNat m := by
  have h' := h
  dsimp [Allowed,LocalValid,p] at h'
  dsimp [pNat,LatticePaths6.half]
  omega

theorem allowed_top (m : ℕ) : Allowed m (pNat m,pNat m) := by
  dsimp [Allowed,LocalValid,p,pNat,LatticePaths6.half]
  omega

theorem G_invalid (m i j : ℕ) (h : ¬Allowed m (i,j)) : G m i j=0 :=
  walk_card_invalid _ _ _ _ h

theorem G_top (m : ℕ) : G m (pNat m) (pNat m)=1 := by
  have hn : 2*pNat m-pNat m-pNat m=0 := by omega
  rw [G,hn,walk_card_zero]
  simp [allowed_top]

theorem G_step (m i j : ℕ) :
    G m i j=if Allowed m (i,j) then
      if i=pNat m ∧ j=pNat m then 1 else G m (i+1) j+G m i (j+1) else 0 := by
  classical
  by_cases hv : Allowed m (i,j)
  · rw [ite_eq_left hv]
    by_cases ht : i=pNat m ∧ j=pNat m
    · rcases ht with ⟨rfl,rfl⟩
      rw [ite_eq_left ⟨rfl,rfl⟩,G_top]
    · rw [ite_eq_right ht]
      have hb := allowed_bounds hv
      let n := 2*pNat m-i-j-1
      have hn : 2*pNat m-i-j=n+1 := by dsimp [n]; omega
      have hi : 2*pNat m-(i+1)-j=n := by dsimp [n]; omega
      have hj : 2*pNat m-i-(j+1)=n := by dsimp [n]; omega
      unfold G
      rw [hn,walk_card_succ,ite_eq_left hv,hi,hj]
      rfl
  · rw [ite_eq_right hv,G_invalid m i j hv]

/-- Signed-height extension by zero avoids any truncation at the lower
six-column edge. This is still a genuine path cardinality. -/
noncomputable def value (m i : ℕ) (j : ℤ) : ℤ :=
  if 0≤j then (G m i j.toNat : ℤ) else 0

@[simp] theorem value_nat (m i j : ℕ) : value m i (j : ℤ)=(G m i j : ℤ) := by
  simp [value]

theorem value_step (m i : ℕ) (j : ℤ) :
    value m i j=if LocalValid m (i : ℤ) j then
      if i=pNat m ∧ j=(pNat m : ℤ) then 1
      else value m (i+1) j+value m i (j+1) else 0 := by
  classical
  by_cases hj : 0≤j
  · lift j to ℕ using hj
    have hh := G_step m i j
    have hcast := congrArg (fun n : ℕ => (n : ℤ)) hh
    rw [show (j : ℤ)+1=((j+1 : ℕ) : ℤ) by omega,value_nat]
    simp only [value_nat,Int.natCast_inj]
    split_ifs with hv ht
    · have hh' : G m i j=1 := by simpa only [Allowed,ite_eq_left hv,ite_eq_left ht] using hh
      exact_mod_cast hh'
    · have hh' : G m i j=G m (i+1) j+G m i (j+1) := by
        simpa only [Allowed,ite_eq_left hv,ite_eq_right ht] using hh
      exact_mod_cast hh'
    · exact_mod_cast G_invalid m i j hv
  · have hv : ¬LocalValid m (i : ℤ) j := by
      intro h
      exact hj h.2.2.1
    simp [value,hj,hv]

/-- Direct identification of the actual extension cardinality with the
suffix count at the origin, without a transfer interpretation assumption. -/
theorem extension_card_eq_G (m : ℕ) : Nat.card (FamilyExtension m)=G m 0 0 := by
  rw [extension_card_eq_walk]
  have hn : size m=2*pNat m-0-0 := by dsimp [size,pNat,LatticePaths6.half]; omega
  rw [hn]
  rfl

end OneThird.GridCounts7
