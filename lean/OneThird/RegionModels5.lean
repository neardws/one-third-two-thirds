module
public import OneThird.CircuitBindings5
public import Mathlib.Tactic.IntervalCases
@[expose] public section
namespace OneThird.RegionModels5
open Structure TransferCache5 CircuitBindings5 MatrixBounds CircuitSemantics5
set_option maxHeartbeats 0
set_option maxRecDepth 100000
set_option linter.unusedSimpArgs false

def assignments (m k l : ℕ) : ℕ → ℕ := fun t => if t=0 then m else if t=1 then max 4 k else max 4 l

def regime (k l : ℕ) : ℕ := if k<4 then k else if l<4 then 4+l else 8

theorem regime_lt (k l : ℕ) : regime k l<9 := by unfold regime; split_ifs <;> omega

def leftIndex (k l : ℕ) (t : Fin 5) : Fin 144 :=
  ⟨54+10*regime k l+2*t.val,by have := regime_lt k l; have := t.isLt; omega⟩
def rightIndex (k l : ℕ) (t : Fin 5) : Fin 144 :=
  ⟨55+10*regime k l+2*t.val,by have := regime_lt k l; have := t.isLt; omega⟩

theorem pre_specs (m : ℕ) (t : Fin 22) :
    leftSpec ⟨t.val,by omega⟩ (assignments m 0 0)=select3*transfer (pre.take t.val) ∧
    rightSpec ⟨t.val,by omega⟩ (assignments m 0 0)=
      transfer (pre.drop (t.val+1))*A^m*transfer mid*A^m*(transfer suf*select2) := by
  fin_cases t <;> constructor <;> simp [leftSpec,rightSpec,assignments,Matrix.mul_assoc]

theorem mid_specs (m : ℕ) (t : Fin 11) :
    leftSpec ⟨22+t.val,by omega⟩ (assignments m 0 0)=
      select3*transfer pre*A^m*transfer (mid.take t.val) ∧
    rightSpec ⟨22+t.val,by omega⟩ (assignments m 0 0)=
      transfer (mid.drop (t.val+1))*A^m*(transfer suf*select2) := by
  fin_cases t <;> constructor <;> simp [leftSpec,rightSpec,assignments,Matrix.mul_assoc]

theorem suf_specs (m : ℕ) (t : Fin 21) :
    leftSpec ⟨33+t.val,by omega⟩ (assignments m 0 0)=
      select3*transfer pre*A^m*transfer mid*A^m*transfer (suf.take t.val) ∧
    rightSpec ⟨33+t.val,by omega⟩ (assignments m 0 0)=
      transfer (suf.drop (t.val+1))*select2 := by
  fin_cases t <;> constructor <;> simp [leftSpec,rightSpec,assignments,Matrix.mul_assoc]

theorem left_specs (m k l : ℕ) (h : 4≤k ∨ 4≤l) (t : Fin 5) :
    leftSpec (leftIndex k l t) (assignments m k l)=
      select3*transfer pre*A^k*transfer (block.take t.val) ∧
    rightSpec (leftIndex k l t) (assignments m k l)=
      transfer (block.drop (t.val+1))*A^l*transfer mid*A^m*(transfer suf*select2) := by
  by_cases hk : k<4
  · have hmaxl : max 4 l=l := max_eq_right (by omega)
    interval_cases k <;> fin_cases t <;> constructor <;>
      simp [leftIndex,regime,hmaxl,leftSpec,rightSpec,assignments,Matrix.mul_assoc]
  · have hmaxk : max 4 k=k := max_eq_right (by omega)
    by_cases hl : l<4
    · interval_cases l <;> fin_cases t <;> constructor <;>
        simp [leftIndex,regime,hk,hmaxk,leftSpec,rightSpec,assignments,Matrix.mul_assoc]
    · have hmaxl : max 4 l=l := max_eq_right (by omega)
      fin_cases t <;> constructor <;>
        simp [leftIndex,regime,hk,hl,hmaxk,hmaxl,leftSpec,rightSpec,assignments,Matrix.mul_assoc]

theorem right_specs (m k l : ℕ) (h : 4≤k ∨ 4≤l) (t : Fin 5) :
    leftSpec (rightIndex k l t) (assignments m k l)=
      select3*transfer pre*A^m*transfer mid*A^k*transfer (block.take t.val) ∧
    rightSpec (rightIndex k l t) (assignments m k l)=
      transfer (block.drop (t.val+1))*A^l*(transfer suf*select2) := by
  by_cases hk : k<4
  · have hmaxl : max 4 l=l := max_eq_right (by omega)
    interval_cases k <;> fin_cases t <;> constructor <;>
      simp [rightIndex,regime,hmaxl,leftSpec,rightSpec,assignments,Matrix.mul_assoc]
  · have hmaxk : max 4 k=k := max_eq_right (by omega)
    by_cases hl : l<4
    · interval_cases l <;> fin_cases t <;> constructor <;>
        simp [rightIndex,regime,hk,hmaxk,leftSpec,rightSpec,assignments,Matrix.mul_assoc]
    · have hmaxl : max 4 l=l := max_eq_right (by omega)
      fin_cases t <;> constructor <;>
        simp [rightIndex,regime,hk,hl,hmaxk,hmaxl,leftSpec,rightSpec,assignments,Matrix.mul_assoc]
theorem assignments_tail (m k l : ℕ) (hm : 4≤m) (t : ℕ) : 4≤assignments m k l t := by
  unfold assignments
  split_ifs <;> first | exact hm | exact le_max_left _ _

/-- All 144 certificate types now bound formal transfer-subword expressions,
with the normalization scale cancelled. -/
theorem transfer_cell_bounds (i : Fin 144) (n : ℕ → ℕ) (hn : ∀k, 4≤n k)
    (d : Fin 7) (hd : d ∉ (CertificateData4.cells i).excluded) :
    let T : ℝ := ((leftSpec i n*(CertificateData4.cells i).rowMap*rightSpec i n) 3 2 : ℤ)
    let H : ℝ := ((leftSpec i n*CertificateChecker.cut (CertificateData4.cells i).rowMap d.val*rightSpec i n) 3 2 : ℤ)
    0<T ∧ (H/T<(3486 : ℝ)/10000 ∨ 1-H/T<(3486 : ℝ)/10000) := by
  dsimp
  have h := SpectralBridge4.spectral_cells n hn i d hd
  have hv := all_cell_values i n d
  rw [hv.1,hv.2] at h
  have hw := weight_pos (leftUses i++rightUses i) n
  constructor
  · exact (mul_pos_iff_of_pos_left hw).mp h.1
  · simpa only [mul_div_mul_left _ _ (ne_of_gt hw)] using h.2

end OneThird.RegionModels5
