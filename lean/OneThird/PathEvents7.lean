module
public import OneThird.BottomCounts7
@[expose] public section
namespace OneThird.PathEvents7
open Structure LinearExtensions4 ChainPrefixes5 LatticePaths6 Counting6 WalkCounting7 GridCounts7
set_option maxHeartbeats 0

/-- A recursive path crosses the specified horizontal row at a permitted
height. At a successful crossing all choices of its remaining suffix count. -/
def Hit (V : Grid → Prop) (y : Grid) (a b : ℕ) :
    ∀n x, Walk V y n x → Prop
  | 0,_,_ => False
  | n+1,x,(_,Sum.inl w) => if x.1=a ∧ x.2≤b then True else Hit V y a b n (right x) w
  | n+1,x,(_,Sum.inr w) => Hit V y a b n (up x) w

def Cross {V : Grid → Prop} {n : ℕ} {x y : Grid} (w : VertexPath V n x y) (a b : ℕ) : Prop :=
  ∃k : Fin n, (w.vertex k.castSucc).1=a ∧ (w.vertex k.castSucc).2≤b ∧
    w.vertex k.succ=right (w.vertex k.castSucc)

theorem up_ne_right (x : Grid) : up x≠right x := by
  intro h
  have hh := congrArg Prod.fst h
  dsimp [up,right] at hh
  omega

theorem cross_prependRight {V : Grid → Prop} {n : ℕ} {x y : Grid}
    (hx : V x) (w : VertexPath V n (right x) y) (a b : ℕ) :
    Cross (VertexPath.prependRight hx w) a b ↔ (x.1=a ∧ x.2≤b) ∨ Cross w a b := by
  simp only [Cross,Fin.exists_fin_succ,VertexPath.prependRight,Fin.castSucc_zero,
    Fin.castSucc_succ,Fin.cases_zero,Fin.cases_succ,w.start,and_true]

theorem cross_prependUp {V : Grid → Prop} {n : ℕ} {x y : Grid}
    (hx : V x) (w : VertexPath V n (up x) y) (a b : ℕ) :
    Cross (VertexPath.prependUp hx w) a b ↔ Cross w a b := by
  simp only [Cross,Fin.exists_fin_succ,VertexPath.prependUp,Fin.castSucc_zero,
    Fin.castSucc_succ,Fin.cases_zero,Fin.cases_succ,w.start,up_ne_right,and_false,false_or]

theorem hit_iff_cross (V : Grid → Prop) (y : Grid) (a b : ℕ) :
    ∀n x (w : Walk V y n x), Hit V y a b n x w ↔ Cross ((walkVertexEquiv V y n x) w) a b := by
  intro n
  induction n with
  | zero => intro x w; simp [Hit,Cross]
  | succ n ih =>
    intro x w
    rcases w with ⟨⟨hx⟩,w | w⟩
    · change (if x.1=a ∧ x.2≤b then True else Hit V y a b n (right x) w) ↔
        Cross (VertexPath.prependRight hx ((walkVertexEquiv V y n (right x)) w)) a b
      rw [cross_prependRight,←ih]
      split_ifs <;> simp_all
    · change Hit V y a b n (up x) w ↔
        Cross (VertexPath.prependUp hx ((walkVertexEquiv V y n (up x)) w)) a b
      rw [cross_prependUp,ih]

/-- The placement of an even label is exactly the corresponding horizontal
unit step, including the row coordinate. -/
theorem label_even_iff {m : ℕ} (w : LatticePath m) (k : Fin (size m)) (i : Fin (pNat m)) :
    w.label k=chainLabel m 0 i ↔
      (w.vertex ⟨k.val,by omega⟩).1=i.val ∧
      w.vertex ⟨k.val+1,by omega⟩=right (w.vertex ⟨k.val,by omega⟩) := by
  have hs := w.step k
  rcases hs with hs | hs
  · have hx := congrArg Prod.fst hs
    change (w.vertex ⟨k.val+1,by omega⟩).1=(w.vertex ⟨k.val,by omega⟩).1+1 at hx
    constructor
    · intro he
      have hh := congrArg Fin.val he
      simp only [LatticePath.label,hx,↓reduceDIte,chainLabel,Fin.val_mk,
        Fin.val_zero,add_zero] at hh
      exact ⟨by omega,hs⟩
    · rintro ⟨he,_⟩
      apply Fin.ext
      simp only [LatticePath.label,hx,↓reduceDIte,chainLabel,Fin.val_mk,
        Fin.val_zero,add_zero]
      omega
  · have hx := congrArg Prod.fst hs
    change (w.vertex ⟨k.val+1,by omega⟩).1=(w.vertex ⟨k.val,by omega⟩).1 at hx
    have hn : ¬(w.vertex ⟨k.val+1,by omega⟩).1=(w.vertex ⟨k.val,by omega⟩).1+1 := by omega
    constructor
    · intro he
      have hh := congrArg Fin.val he
      simp only [LatticePath.label,hn,↓reduceDIte,chainLabel,Fin.val_mk,
        Fin.val_zero,add_zero] at hh
      omega
    · rintro ⟨_,he⟩
      have hh := congrArg Prod.fst he
      dsimp [right] at hh
      omega

theorem below_iff_cross (m : ℕ) (w : LatticePath m) (i j : Fin (pNat m)) :
    Below w i j ↔ Cross ((latticeVertexEquiv m) w) i.val j.val := by
  simp only [Below]
  simp_rw [label_even_iff]
  constructor
  · rintro ⟨k,⟨hi,hs⟩,hj⟩
    exact ⟨k,hi,hj,hs⟩
  · rintro ⟨k,hi,hj,hs⟩
    exact ⟨k,⟨hi,hs⟩,hj⟩

/-- The geometric pair count is identified with a recursive first-crossing
event on the actual recursive paths. -/
theorem H_eq_hit_card (m : ℕ) (i j : Fin (pNat m)) :
    H m i j=Nat.card {w : Walk (Allowed m) (pNat m,pNat m) (size m) (0,0) //
      Hit (Allowed m) (pNat m,pNat m) i.val j.val (size m) (0,0) w} := by
  unfold H
  have e1 := (latticeVertexEquiv m).subtypeEquiv
    (p:=fun w => Below w i j) (q:=fun w => Cross w i.val j.val)
    (fun w => below_iff_cross m w i j)
  have e2 := (walkVertexEquiv (Allowed m) (pNat m,pNat m) (size m) (0,0)).subtypeEquiv
    (p:=fun w => Hit (Allowed m) (pNat m,pNat m) i.val j.val (size m) (0,0) w)
    (q:=fun w => Cross w i.val j.val)
    (fun w => hit_iff_cross (Allowed m) (pNat m,pNat m) i.val j.val (size m) (0,0) w)
  exact Nat.card_congr (e1.trans e2.symm)

end OneThird.PathEvents7
