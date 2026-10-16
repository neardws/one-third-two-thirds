module
public import OneThird.SpectralTail4

@[expose] public section
namespace OneThird.SpectralBridge4
open Matrix Structure SpectralTail4 CertificateData4 Intervals MatrixBounds
set_option maxHeartbeats 0
set_option maxRecDepth 100000

def A2 : Mat6 := !![2442, 6879, 11316, 11316, 0, 0; 2442, 6879, 11316, 11316, 0, 0; 2442, 6879, 11316, 11316, 0, 0; 1339, 3772, 6205, 6205, 0, 0; 525, 1479, 2433, 2433, 0, 0; 0, 0, 0, 0, 0, 0]
theorem A2_eq : A^2=A2 := by decide

private theorem sqrt_sq : (Real.sqrt 6697)^2=(6697 : ℝ) := Real.sq_sqrt (by norm_num)
private theorem sqrt_cube : (Real.sqrt 6697)^3=6697*Real.sqrt 6697 := by
  calc
    _ = (Real.sqrt 6697)^2*Real.sqrt 6697 := by ring
    _ = _ := by rw [sqrt_sq]

theorem p_coefficient (i j : Fin 6) :
    evalPair (pData i j)*(2*Real.sqrt 6697*(82+Real.sqrt 6697)) =
    ((A^2) i j : ℝ)-(82-Real.sqrt 6697)*(A i j : ℝ) := by
  rw [A2_eq]
  fin_cases i <;> fin_cases j <;>
    norm_num [evalPair, pData, A2, A] <;> nlinarith [sqrt_sq, sqrt_cube]

theorem q_coefficient (i j : Fin 6) :
    evalPair (qData i j)*(2*Real.sqrt 6697*(82+Real.sqrt 6697)) =
    (82+Real.sqrt 6697)*(A i j : ℝ)-((A^2) i j : ℝ) := by
  rw [A2_eq]
  fin_cases i <;> fin_cases j <;>
    norm_num [evalPair, qData, A2, A] <;> nlinarith [sqrt_sq, sqrt_cube]

private theorem normalize (x y r s d : ℝ) (hr : r≠0) (hd : d≠0) (k : ℕ) :
    ((x/d)*r^k+(y/d)*s^k)/r^(k+1) =
      x/(d*r)+(s/r)^k*(y/(d*r)) := by
  rw [div_pow, pow_succ]
  field_simp

/-- The embedded quadratic-field coefficients are connected to the previously
proved spectral expansion of the actual integer block matrix. -/
theorem normalized_entry (k : ℕ) (i j : Fin 6) :
    ((A^(k+1)) i j : ℝ)/(82+Real.sqrt 6697)^(k+1) =
      evalPair (pData i j)+((82-Real.sqrt 6697)/(82+Real.sqrt 6697))^k*evalPair (qData i j) := by
  have hz : 0<Real.sqrt 6697 := Real.sqrt_pos.2 (by norm_num)
  have hr : 0<82+Real.sqrt 6697 := by linarith
  have hd : 2*Real.sqrt 6697≠0 := by positivity
  have hdr : 2*Real.sqrt 6697*(82+Real.sqrt 6697)≠0 := mul_ne_zero hd (ne_of_gt hr)
  have hp := (eq_div_iff hdr).2 (p_coefficient i j)
  have hq := (eq_div_iff hdr).2 (q_coefficient i j)
  rw [A_entry_sqrt]
  rw [normalize _ _ _ _ _ (ne_of_gt hr) hd k, ← hp, ← hq]

/-- The actual normalized block powers satisfy the certified rational enclosure,
for every exponent >=4. -/
theorem actual_tail (n : ℕ) (hn : 4≤n) (i j : Fin 6) :
    Contains (tailBox i j) (((A^n) i j : ℝ)/(82+Real.sqrt 6697)^n) := by
  obtain ⟨k, rfl⟩ : ∃k, n=k+1 := ⟨n-1,by omega⟩
  rw [normalized_entry]
  exact tail_formula_bound k (by omega) i j

noncomputable def scaledPower (n : ℕ) : RMat := fun i j =>
  (scale : ℝ)*(((A^n) i j : ℝ)/(82+Real.sqrt 6697)^n)

/-- Interface to the integer-matrix circuit checker. -/
theorem scaledPower_enclosed (n : ℕ) (hn : 4≤n) :
    Encloses tailLo tailHi (scaledPower n) := by
  have hs : (0 : ℝ)<scale := by exact_mod_cast scale_pos
  intro i j
  have h := actual_tail n hn i j
  simp only [Contains, tailBox, Rat.cast_div, Rat.cast_intCast] at h
  constructor
  · simpa [scaledPower, mul_comm] using (div_le_iff₀ hs).1 h.1
  · simpa [scaledPower, mul_comm] using (le_div_iff₀ hs).1 h.2

/-- Every embedded cell certificate applies to actual normalized block powers.
Exponents may be chosen independently, subject only to the tail threshold. -/
theorem spectral_cells (exponents : ℕ → ℕ) (hn : ∀k, 4≤exponents k)
    (i : Fin 144) (d : Fin 7) (hd : d ∉ (cells i).excluded) :
    0<CertificateChecker.totalValue (cells i) (fun k => scaledPower (exponents k)) ∧
    (CertificateChecker.eventValue (cells i) (fun k => scaledPower (exponents k)) d /
      CertificateChecker.totalValue (cells i) (fun k => scaledPower (exponents k)) < (3486 : ℝ)/10000 ∨
    1-CertificateChecker.eventValue (cells i) (fun k => scaledPower (exponents k)) d /
      CertificateChecker.totalValue (cells i) (fun k => scaledPower (exponents k)) < (3486 : ℝ)/10000) :=
  all_cells_sound _ (fun k => scaledPower_enclosed _ (hn k)) i d hd

end OneThird.SpectralBridge4
