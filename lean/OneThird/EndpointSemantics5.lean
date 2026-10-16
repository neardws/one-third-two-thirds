module
public import OneThird.CircuitSemantics5
@[expose] public section
namespace OneThird.EndpointSemantics5
open Matrix Structure MatrixBounds CertificateChecker CertificateData4 CircuitSemantics5 SpectralBridge4
set_option maxHeartbeats 0
set_option maxRecDepth 100000

def embedRow (u : Matrix (Fin 1) (Fin 6) ℤ) : ZMat := fun i j => if i=3 then u 0 j else 0
def embedCol (v : Matrix (Fin 6) (Fin 1) ℤ) : ZMat := fun i j => if j=2 then v i 0 else 0

theorem embedRow_mul (u : Matrix (Fin 1) (Fin 6) ℤ) (a : ZMat) :
    embedRow u*a=embedRow (u*a) := by
  ext i j
  by_cases hi : i=3 <;> simp [embedRow,Matrix.mul_apply,hi]

theorem embed_scalar (u : Matrix (Fin 1) (Fin 6) ℤ) (a b c : ZMat)
    (v : Matrix (Fin 6) (Fin 1) ℤ) :
    (embedRow u*a*b*c*embedCol v) 3 2=(u*a*b*c*v) 0 0 := by
  rw [embedRow_mul,embedRow_mul,embedRow_mul]
  simp [Matrix.mul_apply,embedRow,embedCol]

/-- Enclosure arithmetic for the stronger lower/upper endpoint separator. -/
theorem endpoint_bounds {elo ehi nlo nhi : ℤ} {ET NT : ℝ}
    (checks : 0<elo ∧ 100000*nlo>34884*ehi ∧ 2*nhi<elo)
    (he : (elo : ℝ)≤ET ∧ ET≤(ehi : ℝ))
    (hn : (nlo : ℝ)≤NT ∧ NT≤(nhi : ℝ)) :
    0<ET ∧ (34884 : ℝ)/100000<NT/ET ∧ NT/ET<1/2 := by
  have hp : (0 : ℝ)<elo := by exact_mod_cast checks.1
  have hlo : (100000 : ℝ)*nlo>34884*ehi := by exact_mod_cast checks.2.1
  have hhi : (2 : ℝ)*nhi<elo := by exact_mod_cast checks.2.2
  have hET : 0<ET := hp.trans_le he.1
  refine ⟨hET, (lt_div_iff₀ hET).2 ?_,(div_lt_iff₀ hET).2 ?_⟩ <;> linarith

end OneThird.EndpointSemantics5
