module
public import OneThird.PathEvents7
@[expose] public section
namespace OneThird.HitCounts7
open Structure LinearExtensions4 LatticePaths6 Counting6 WalkCounting7 GridCounts7 PathEvents7
set_option maxHeartbeats 0
attribute [local instance] Classical.propDecidable

def prodSumSubtypeEquiv (A B C : Type) (p : B → Prop) (q : C → Prop) :
    {w : A × (B ⊕ C) // match w.2 with | .inl b => p b | .inr c => q c} ≃
    A × ({b : B // p b} ⊕ {c : C // q c}) where
  toFun := by
    rintro ⟨⟨a,b | c⟩,h⟩
    · exact ⟨a,.inl ⟨b,h⟩⟩
    · exact ⟨a,.inr ⟨c,h⟩⟩
  invFun := by
    rintro ⟨a,⟨b,h⟩ | ⟨c,h⟩⟩
    · exact ⟨⟨a,.inl b⟩,h⟩
    · exact ⟨⟨a,.inr c⟩,h⟩
  left_inv := by rintro ⟨⟨a,b | c⟩,h⟩ <;> rfl
  right_inv := by rintro ⟨a,⟨b,h⟩ | ⟨c,h⟩⟩ <;> rfl

noncomputable def HitCount (V : Grid → Prop) (y : Grid) (a b n : ℕ) (x : Grid) : ℕ :=
  Nat.card {w : Walk V y n x // Hit V y a b n x w}

theorem hit_count_zero (V : Grid → Prop) (x y : Grid) (a b : ℕ) :
    HitCount V y a b 0 x=0 := by
  unfold HitCount
  simp only [Hit]
  simp

theorem hit_count_succ (V : Grid → Prop) (x y : Grid) (a b n : ℕ) :
    HitCount V y a b (n+1) x=if V x then
      (if x.1=a ∧ x.2≤b then Nat.card (Walk V y n (right x))
        else HitCount V y a b n (right x))+HitCount V y a b n (up x) else 0 := by
  classical
  unfold HitCount
  have hnorm (w : Walk V y (n+1) x) : Hit V y a b (n+1) x w ↔
      (match w.2 with
      | .inl p => if x.1=a ∧ x.2≤b then True else Hit V y a b n (right x) p
      | .inr p => Hit V y a b n (up x) p) := by
    rcases w with ⟨hx,w | w⟩ <;> rfl
  rw [Nat.card_congr (Equiv.subtypeEquivRight hnorm)]
  change Nat.card {w : PLift (V x) × (Walk V y n (right x) ⊕ Walk V y n (up x)) //
    match w.2 with
    | .inl p => if x.1=a ∧ x.2≤b then True else Hit V y a b n (right x) p
    | .inr p => Hit V y a b n (up x) p}=_
  trans Nat.card (PLift (V x) ×
    ({p : Walk V y n (right x) // if x.1=a ∧ x.2≤b then True else Hit V y a b n (right x) p} ⊕
      {p : Walk V y n (up x) // Hit V y a b n (up x) p}))
  · apply Nat.card_congr
    exact {
      toFun := by
        rintro ⟨⟨hx,p | p⟩,h⟩
        · exact ⟨hx,.inl ⟨p,h⟩⟩
        · exact ⟨hx,.inr ⟨p,h⟩⟩
      invFun := by
        rintro ⟨hx,⟨p,h⟩ | ⟨p,h⟩⟩
        · exact ⟨⟨hx,.inl p⟩,h⟩
        · exact ⟨⟨hx,.inr p⟩,h⟩
      left_inv := by rintro ⟨⟨hx,p | p⟩,h⟩ <;> rfl
      right_inv := by rintro ⟨hx,⟨p,h⟩ | ⟨p,h⟩⟩ <;> rfl }
  rw [Nat.card_prod,Nat.card_sum,card_prop]
  have hh : Nat.card {p : Walk V y n (right x) //
      if x.1=a ∧ x.2≤b then True else Hit V y a b n (right x) p}=
      if x.1=a ∧ x.2≤b then Nat.card (Walk V y n (right x))
      else Nat.card {p : Walk V y n (right x) // Hit V y a b n (right x) p} := by
    by_cases h : x.1=a ∧ x.2≤b
    · rw [ite_eq_left h]
      apply Nat.card_congr
      exact {
        toFun := Subtype.val
        invFun := fun p => ⟨p,by rw [ite_eq_left h]; trivial⟩
        left_inv := fun _ => rfl
        right_inv := fun _ => rfl }
    · simp only [ite_eq_right h]
  rw [hh]
  split_ifs <;> simp

theorem hit_impossible (V : Grid → Prop) (y : Grid) (a b : ℕ) :
    ∀n x (w : Walk V y n x), a<x.1 → ¬Hit V y a b n x w := by
  intro n
  induction n with
  | zero => intro x w _; exact id
  | succ n ih =>
    rintro x ⟨hx,w | w⟩ h
    · have hh : ¬(x.1=a ∧ x.2≤b) := by omega
      simpa only [Hit,ite_eq_right hh] using ih (right x) w (by dsimp [right]; omega)
    · exact ih (up x) w h

theorem hit_count_after (V : Grid → Prop) (x y : Grid) (a b n : ℕ) (h : a<x.1) :
    HitCount V y a b n x=0 := by
  let : IsEmpty {w : Walk V y n x // Hit V y a b n x w} :=
    ⟨fun w => hit_impossible V y a b n x w.val h w.property⟩
  exact Nat.card_of_isEmpty

theorem hit_count_invalid (V : Grid → Prop) (x y : Grid) (a b n : ℕ) (h : ¬V x) :
    HitCount V y a b n x=0 := by
  have hc : HitCount V y a b n x≤Nat.card (Walk V y n x) :=
    Nat.card_le_card_of_injective Subtype.val Subtype.val_injective
  rw [walk_card_invalid V x y n h] at hc
  omega

noncomputable def Q (m a b i j : ℕ) : ℕ :=
  HitCount (Allowed m) (pNat m,pNat m) a b (2*pNat m-i-j) (i,j)

theorem Q_after (m a b i j : ℕ) (h : a < i) : Q m a b i j=0 :=
  hit_count_after _ _ _ _ _ _ h

theorem Q_invalid (m a b i j : ℕ) (h : ¬Allowed m (i,j)) : Q m a b i j=0 :=
  hit_count_invalid _ _ _ _ _ _ h

theorem Q_step (m a b i j : ℕ) (hi : i≤a) (ha : a<pNat m) :
    Q m a b i j=if Allowed m (i,j) then
      (if i=a ∧ j≤b then G m (i+1) j else Q m a b (i+1) j)+Q m a b i (j+1) else 0 := by
  classical
  by_cases hv : Allowed m (i,j)
  · rw [ite_eq_left hv]
    have hb := allowed_bounds hv
    let n := 2*pNat m-i-j-1
    have hn : 2*pNat m-i-j=n+1 := by dsimp [n]; omega
    have hr : 2*pNat m-(i+1)-j=n := by dsimp [n]; omega
    have hu : 2*pNat m-i-(j+1)=n := by dsimp [n]; omega
    unfold Q G
    rw [hn,hit_count_succ,ite_eq_left hv,hr,hu]
    rfl
  · rw [ite_eq_right hv,Q_invalid m a b i j hv]

theorem H_eq_Q (m : ℕ) (i j : Fin (pNat m)) : H m i j=Q m i.val j.val 0 0 := by
  rw [H_eq_hit_card]
  have hn : size m=2*pNat m-0-0 := by dsimp [size,pNat,LatticePaths6.half]; omega
  rw [hn]
  rfl

end OneThird.HitCounts7
