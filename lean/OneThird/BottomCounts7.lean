module
public import OneThird.RowCounts7
public import OneThird.FirstStep6
@[expose] public section
namespace OneThird.BottomCounts7
open Structure LinearExtensions4 ChainPrefixes5 LatticePaths6 Counting6 FirstStep6
open WalkCounting7 GridCounts7 RowCounts7
set_option maxHeartbeats 0

/-- Delete a prescribed first vertical edge, or prepend it. -/
def upEventEquiv {V : Grid → Prop} {n : ℕ} {x y : Grid} (hx : V x) :
    {w : VertexPath V (n+1) x y // w.vertex 1=up x} ≃ VertexPath V n (up x) y where
  toFun w := w.val.tail (up x) w.property
  invFun w := ⟨VertexPath.prependUp hx w,w.start⟩
  left_inv w := by
    apply Subtype.ext
    apply VertexPath.ext
    funext k
    refine Fin.cases ?_ (fun l => ?_) k
    · exact w.val.start.symm
    · rfl
  right_inv := VertexPath.tail_prependUp hx

def firstOddVertexEquiv (m : ℕ) :
    {w : LatticePath m // FirstOdd w} ≃
    {w : VertexPath (Allowed m) (size m) (0,0) (pNat m,pNat m) // w.vertex 1=(0,1)} :=
  (latticeVertexEquiv m).subtypeEquiv (fun w => by
    change w.vertex ⟨1,by dsimp [size]; omega⟩=(0,1) ↔ w.vertex 1=(0,1)
    have hi : (1 : Fin (size m+1))=⟨1,by dsimp [size]; omega⟩ := by
      apply Fin.ext
      change 1 % (size m+1)=1
      exact Nat.mod_eq_of_lt (by dsimp [size]; omega)
    rw [hi])

theorem allowed_origin (m : ℕ) : Allowed m (0,0) := by
  dsimp [Allowed,LocalValid,p]
  omega

theorem firstOdd_card_eq_G (m : ℕ) :
    Nat.card {w : LatticePath m // FirstOdd w}=G m 0 1 := by
  rw [Nat.card_congr (firstOddVertexEquiv m)]
  have hs : size m=(size m-1)+1 := by dsimp [size]; omega
  have he : Nat.card {w : VertexPath (Allowed m) (size m) (0,0) (pNat m,pNat m) //
      w.vertex 1=(0,1)} =
      Nat.card (VertexPath (Allowed m) (size m-1) (0,1) (pNat m,pNat m)) := by
    conv_lhs => rw [hs]
    exact Nat.card_congr (upEventEquiv (allowed_origin m))
  rw [he,←Nat.card_congr (walkVertexEquiv (Allowed m) (pNat m,pNat m) (size m-1) (0,1))]
  have hn : size m-1=2*pNat m-0-1 := by dsimp [size,pNat,LatticePaths6.half]; omega
  rw [hn]
  rfl

/-- The actual bottom event equals the genuine suffix count after its
forced first odd step. -/
theorem bottom_card_eq_G (m : ℕ) :
    Nat.card {e : FamilyExtension m // e.val (chainLabel m 1 0)<e.val (chainLabel m 0 0)}=G m 0 1 := by
  rw [bottom_card_eq_first_odd,firstOdd_card_eq_G]

theorem G_odd_eq_N (m : ℕ) : (G m 0 1 : ℤ)=N m := by
  have hrow := row_pathDP m 0 (by omega)
  have hlen : pNat m+1-0=55+10*m := by dsimp [pNat,LatticePaths6.half]; omega
  rw [hlen] at hrow
  have hv := congrArg (fun w : Matrix (Fin 6) (Fin 1) ℤ => w 4 0) hrow
  simpa [row,value] using hv.trans (pathDP_bFirst_eq_N m)

/-- Numerical bottom-event cardinality bridge, for every natural parameter. -/
theorem bottom_card_eq_N (m : ℕ) :
    (Nat.card {e : FamilyExtension m // e.val (chainLabel m 1 0)<e.val (chainLabel m 0 0)} : ℤ)=N m := by
  rw [bottom_card_eq_G,G_odd_eq_N]

end OneThird.BottomCounts7
