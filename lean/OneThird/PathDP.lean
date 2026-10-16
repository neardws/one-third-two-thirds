module
public import OneThird.Transfer
public import OneThird.Ideals

@[expose] public section
namespace OneThird.Structure
open Matrix
set_option maxRecDepth 100000
set_option maxHeartbeats 0

/-- Descending-offset path-count recurrence for a row. Each valid cell receives
its horizontal predecessor's count plus the count immediately above it. -/
def scan (S : Mask) (w : Matrix (Fin 6) (Fin 1) ℤ) : Matrix (Fin 6) (Fin 1) ℤ :=
  let z5 := if (5 : Fin 6) ∈ S then w 4 0 else 0
  let z4 := if (4 : Fin 6) ∈ S then w 3 0 + z5 else 0
  let z3 := if (3 : Fin 6) ∈ S then w 2 0 + z4 else 0
  let z2 := if (2 : Fin 6) ∈ S then w 1 0 + z3 else 0
  let z1 := if (1 : Fin 6) ∈ S then w 0 0 + z2 else 0
  let z0 := if (0 : Fin 6) ∈ S then z1 else 0
  !![z0; z1; z2; z3; z4; z5]

/-- The closed interval formula is exactly the elementary path recurrence. -/
theorem rowMatrix_scan (S : Mask) (w : Matrix (Fin 6) (Fin 1) ℤ) :
    rowMatrix S * w = scan S w := by
  by_cases h0 : (0 : Fin 6) ∈ S <;>
  by_cases h1 : (1 : Fin 6) ∈ S <;>
  by_cases h2 : (2 : Fin 6) ∈ S <;>
  by_cases h3 : (3 : Fin 6) ∈ S <;>
  by_cases h4 : (4 : Fin 6) ∈ S <;>
  by_cases h5 : (5 : Fin 6) ∈ S <;>
  ext i j <;> fin_cases i <;> fin_cases j <;>
  simp [rowMatrix, scan, Matrix.mul_apply, Fin.sum_univ_succ,
    Fin.forall_fin_succ, h0, h1, h2, h3, h4, h5, add_assoc]

/-- Explicit elementary recurrence at offsets -2 through 2. -/
theorem scan_cell_rec (S : Mask) (w : Matrix (Fin 6) (Fin 1) ℤ) (d : Fin 5) :
    scan S w d.succ 0 =
      if d.succ ∈ S then w d.castSucc 0 +
        (if h : d.val+2 < 6 then scan S w ⟨d.val+2,h⟩ 0 else 0) else 0 := by
  fin_cases d <;> simp [scan]

/-- At the bottom band edge there is no horizontal predecessor inside the band. -/
theorem scan_bottom_rec (S : Mask) (w : Matrix (Fin 6) (Fin 1) ℤ) :
    scan S w 0 0 = if (0 : Fin 6) ∈ S then scan S w 1 0 else 0 := by
  simp [scan]

/-- Lattice-path dynamic programming by successive row scans. The seed represents
only the terminal vertex (p,p), encoded by a virtual exit at offset -1. -/
def pathDP : List Mask → Matrix (Fin 6) (Fin 1) ℤ
  | [] => basisCol 2
  | S::w => scan S (pathDP w)

theorem pathDP_eq_transfer (w : List Mask) : pathDP w = transfer w * basisCol 2 := by
  induction w with
  | nil => simp [pathDP, transfer]
  | cons S w ih =>
    rw [pathDP, ← rowMatrix_scan, ih]
    simp [transfer, Matrix.mul_assoc]

/-- For the masks of the actual ideals, the path DP at (0,0) is E_m. -/
theorem pathDP_eq_E (m : ℕ) : (pathDP (rows m 0 (55+10*m))) 3 0 = E m := by
  rw [pathDP_eq_transfer]
  have h := corridor_eq_E m
  simpa [basisRow, Matrix.mul_apply, Fin.sum_univ_succ] using h

/-- Removing the initial row leaves the same middle and periodic factors. -/
theorem transfer_tail_factorization (m : ℕ) :
    transfer (rows m 0 (55+10*m)).tail =
      transfer pre.tail * A^m * M * A^m * transfer suf := by
  rw [row_word]
  change transfer (pre.tail ++ (List.replicate m block).flatten ++ mid ++
    (List.replicate m block).flatten ++ suf) = _
  simp only [transfer_append, transfer_repeat, block_eq_A, mid_eq_M]

private theorem select_apply (t : Fin 6) (w : Matrix (Fin 6) (Fin 1) ℤ) :
    (basisRow t * w) 0 0 = w t 0 := by
  fin_cases t <;> simp [basisRow, Matrix.mul_apply]

/-- The total path DP minus the paths with an initial even step is N_m.
The second coordinate is (1,0), offset -1, in the remaining rows. -/
theorem pathDP_eq_N (m : ℕ) :
    (pathDP (rows m 0 (55+10*m))) 3 0 -
      (pathDP (rows m 0 (55+10*m)).tail) 2 0 = N m := by
  rw [pathDP_eq_transfer, pathDP_eq_transfer]
  rw [← select_apply 3 (transfer (rows m 0 (55+10*m)) * basisCol 2),
    ← select_apply 2 (transfer (rows m 0 (55+10*m)).tail * basisCol 2)]
  change ((basisRow 3 * (transfer (rows m 0 (55+10*m)) * basisCol 2) -
    basisRow 2 * (transfer (rows m 0 (55+10*m)).tail * basisCol 2)) 0 0) = N m
  rw [transfer_factorization, transfer_tail_factorization]
  have h :
      basisRow 3 * (transfer pre * A^m * M * A^m * transfer suf * basisCol 2) -
      basisRow 2 * (transfer pre.tail * A^m * M * A^m * transfer suf * basisCol 2) =
      (basisRow 3 * transfer pre - basisRow 2 * transfer pre.tail) *
        A^m * M * A^m * transfer suf * basisCol 2 := by
    simp only [Matrix.sub_mul, Matrix.mul_assoc]
  simp only [← Matrix.mul_assoc] at *
  rw [h, minority_boundary]
  simp only [Matrix.mul_assoc, suf_boundary, N]

/-- The minority functional is also the DP count after the initial odd step,
namely the cell (0,1). Thus subtraction does not obscure the bottom-pair event. -/
theorem pathDP_bFirst_eq_N (m : ℕ) :
    (pathDP (rows m 0 (55+10*m))) 4 0 = N m := by
  have hrow : rows m 0 (55+10*m) =
      ({3,4} : Mask) :: (rows m 0 (55+10*m)).tail := by
    rw [row_word]
    rfl
  have htotal : pathDP (rows m 0 (55+10*m)) =
      scan {3,4} (pathDP (rows m 0 (55+10*m)).tail) := by
    exact congrArg pathDP hrow
  have hrec : (pathDP (rows m 0 (55+10*m))) 3 0 =
      (pathDP (rows m 0 (55+10*m)).tail) 2 0 +
      (pathDP (rows m 0 (55+10*m))) 4 0 := by
    rw [htotal]
    simp [scan]
  have hn := pathDP_eq_N m
  omega

end OneThird.Structure
