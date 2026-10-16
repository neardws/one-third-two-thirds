module
public import OneThird.CertificateCoverage4

@[expose] public section
namespace OneThird.CircuitSemantics5
open Matrix Structure MatrixBounds CertificateChecker CertificateData4 SpectralBridge4
set_option maxHeartbeats 0
set_option maxRecDepth 100000

noncomputable def factor (n : ℕ) : ℝ := (scale : ℝ)/(82+Real.sqrt 6697)^n
noncomputable def weight (uses : List ℕ) (exponents : ℕ → ℕ) : ℝ :=
  ((uses.map fun k => factor (exponents k))).prod

theorem factor_pos (n : ℕ) : 0<factor n := by
  have h : (0 : ℝ)<scale := by exact_mod_cast scale_pos
  exact div_pos h (pow_pos (by positivity) _)

theorem weight_pos (uses : List ℕ) (exponents : ℕ → ℕ) : 0<weight uses exponents := by
  induction uses with
  | nil => norm_num [weight]
  | cons k ks ih => simpa [weight] using mul_pos (factor_pos (exponents k)) ih

theorem weight_append (u v : List ℕ) (n : ℕ → ℕ) :
    weight (u++v) n=weight u n*weight v n := by
  simp [weight,List.map_append,List.prod_append]

theorem cast_mul (a b : ZMat) : MatrixBounds.cast (a*b)=MatrixBounds.cast a*MatrixBounds.cast b := by
  ext i j
  simp [MatrixBounds.cast, Matrix.mul_apply]

theorem scaledPower_eq (n : ℕ) : scaledPower n=factor n • MatrixBounds.cast (A^n) := by
  ext i j
  simp [scaledPower,factor,MatrixBounds.cast,Matrix.smul_apply,div_eq_mul_inv]
  ring

/-- The integer expression and the exact list of normalization factors carried
by a numerical circuit. This assertion identifies values, not just enclosures. -/
def Realizes {tl th : ZMat} (c : Circuit tl th)
    (expression : (ℕ → ℕ) → ZMat) (uses : List ℕ) : Prop :=
  ∀n, c.value (fun k => scaledPower (n k))=weight uses n • MatrixBounds.cast (expression n)

theorem fixed_realizes {tl th a b : ZMat} (hn : MatrixBounds.Nonneg a) (h : a=b) :
    Realizes (fixed tl th a hn) (fun _ => b) [] := by
  intro n
  simp [fixed,weight,h]

theorem input_realizes {tl th : ZMat} (hn : MatrixBounds.Nonneg tl) (k : ℕ) :
    Realizes (input tl th hn k) (fun n => A^(n k)) [k] := by
  intro n
  simpa [input,weight] using scaledPower_eq (n k)

theorem mul_realizes {tl th : ZMat} {a b : Circuit tl th}
    {f g : (ℕ → ℕ) → ZMat} {u v : List ℕ}
    (ha : Realizes a f u) (hb : Realizes b g v)
    (lo hi : ZMat) (hl : lo=a.lo*b.lo) (hh : hi=a.hi*b.hi) :
    Realizes (checkpoint a b lo hi hl hh) (fun n => f n*g n) (u++v) := by
  intro n
  change a.value _*b.value _= _
  rw [ha n,hb n,weight_append,cast_mul]
  simp only [Matrix.smul_mul,Matrix.mul_smul,smul_smul,mul_comm]

/-- Exact scalar interpretation of a pair of identified left/right circuits. -/
theorem cell_values {c : Cell tailLo tailHi} {f g : (ℕ → ℕ) → ZMat}
    {u v : List ℕ} (hl : Realizes c.left f u) (hr : Realizes c.right g v)
    (n : ℕ → ℕ) (d : Fin 7) :
    totalValue c (fun k => scaledPower (n k))=
      weight (u++v) n*((f n*c.rowMap*g n) 3 2 : ℝ) ∧
    eventValue c (fun k => scaledPower (n k)) d=
      weight (u++v) n*((f n*cut c.rowMap d.val*g n) 3 2 : ℝ) := by
  constructor <;> simp only [totalValue,eventValue,hl n,hr n,weight_append]
  all_goals
    rw [Matrix.smul_mul,Matrix.mul_smul,Matrix.smul_mul,smul_smul,←cast_mul,←cast_mul]
    simp [Matrix.smul_apply,MatrixBounds.cast,mul_comm]

end OneThird.CircuitSemantics5
