/-
  Algebraic certificate for the broken-rung ladder family (n = 108 + 20 m).
  The concrete matrices come from certificate.json. All declarations are proved.
  E and N are defined algebraically here. Their identification with the actual
  poset is proved elsewhere in this development: `RowCounts7.extension_card_eq_E`
  (number of linear extensions = E m), `BottomCounts7.bottom_card_eq_N` (bottom
  minority count = N m) and `Balance7.delta_eq_ratio` (delta m = N m / E m), all
  for every m; see lean/REPORT7.md. No open bijection remains.
-/
module
public import Mathlib.LinearAlgebra.Matrix.Notation
public import Mathlib.Data.Matrix.Mul
public import Mathlib.Analysis.Real.Sqrt
public import Mathlib.Tactic.NormNum
public import Mathlib.Tactic.Ring
public import Mathlib.Tactic.Linarith
public import Mathlib.Tactic.FieldSimp
public import Mathlib.Analysis.SpecificLimits.Basic
public import Lean.Elab.Tactic.Omega


@[expose] public section

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open Matrix

namespace OneThird

abbrev Mat6 := Matrix (Fin 6) (Fin 6) ℤ

def A : Mat6 := !![15, 42, 69, 69, 0, 0; 15, 42, 69, 69, 0, 0; 15, 42, 69, 69, 0, 0; 8, 23, 38, 38, 0, 0; 3, 9, 15, 15, 0, 0; 0, 0, 0, 0, 0, 0]
def M : Mat6 := !![6375, 17967, 29559, 29559, 0, 0; 6375, 17967, 29559, 29559, 0, 0; 6375, 17967, 29559, 29559, 0, 0; 3496, 9853, 16210, 16210, 0, 0; 1371, 3864, 6357, 6357, 0, 0; 0, 0, 0, 0, 0, 0]
def v : Matrix (Fin 6) (Fin 1) ℤ := !![3017731140; 3017731140; 3017731140; 1654784208; 648873828; 0]
def uE : Matrix (Fin 1) (Fin 6) ℤ := !![357036552, 1005910380, 1654784208, 1654784208, 0, 0]
def uN : Matrix (Fin 1) (Fin 6) ℤ := !![124549866, 350905257, 577260648, 577260648, 0, 0]

def E (m : ℕ) : ℤ := (uE * A ^ m * M * A ^ m * v) 0 0
def N (m : ℕ) : ℤ := (uN * A ^ m * M * A ^ m * v) 0 0

/-- Exact initial values; no native evaluation is used. -/
theorem E_0 : E 0 = 830465512946702116549200 := by decide
theorem N_0 : N 0 = 289702462609351891001772 := by decide
theorem E_1 : E 1 = 22291332717115991918960997408 := by decide
theorem N_1 : N 1 = 7776185623986738844704880008 := by decide
theorem E_2 : E 2 = 598343347382745056736743181512784 := by decide
theorem N_2 : N 2 = 208728163325704427484417627537132 := by decide

/-- Annihilating polynomial of the block matrix. -/
theorem A_annih : A ^ 4 * (A ^ 2 - 164 • A + 27 • (1 : Mat6)) = 0 := by
  decide

/-- The cubic annihilates M under the linear operator T(X) = A X A.
This stronger finite certificate avoids a 36 by 36 characteristic polynomial. -/
theorem M_annih :
    A ^ 3 * M * A ^ 3 =
      (26869 : ℤ) • (A ^ 2 * M * A ^ 2) - (725463 : ℤ) • (A ^ 1 * M * A ^ 1) + (19683 : ℤ) • M := by
  decide

/-- Propagate the annihilating polynomial by multiplying by A^m on both sides. -/
theorem sandwich_rec (m : ℕ) :
    A ^ (m + 3) * M * A ^ (m + 3) =
      (26869 : ℤ) • (A ^ (m + 2) * M * A ^ (m + 2)) -
      (725463 : ℤ) • (A ^ (m + 1) * M * A ^ (m + 1)) +
      (19683 : ℤ) • (A ^ m * M * A ^ m) := by
  have shift (k : ℕ) :
      A ^ m * (A ^ k * M * A ^ k) * A ^ m = A ^ (m + k) * M * A ^ (m + k) := by
    calc
      _ = (A ^ m * A ^ k) * M * (A ^ k * A ^ m) := by simp only [mul_assoc]
      _ = _ := by rw [← pow_add, ← pow_add, Nat.add_comm k m]
  have h := congrArg (fun X : Mat6 => A ^ m * X * A ^ m) M_annih
  simpa only [mul_add, mul_sub, add_mul, sub_mul, mul_smul_comm,
    smul_mul_assoc, shift] using h

/-- Apply any boundary row and column to the matrix recurrence. -/
theorem boundary_rec (u : Matrix (Fin 1) (Fin 6) ℤ) (m : ℕ) :
    (u * A ^ (m + 3) * M * A ^ (m + 3) * v) 0 0 =
      26869 * (u * A ^ (m + 2) * M * A ^ (m + 2) * v) 0 0 -
      725463 * (u * A ^ (m + 1) * M * A ^ (m + 1) * v) 0 0 +
      19683 * (u * A ^ m * M * A ^ m * v) 0 0 := by
  have h := congrArg (fun X : Mat6 => (u * X * v) 0 0) (sandwich_rec m)
  simpa only [Matrix.mul_add, Matrix.mul_sub, Matrix.add_mul, Matrix.sub_mul,
    Matrix.mul_smul, Matrix.smul_mul, Matrix.add_apply, Matrix.sub_apply,
    Matrix.smul_apply, Pi.smul_apply, smul_eq_mul, Matrix.mul_assoc] using h

theorem E_rec (m : ℕ) :
    E (m + 3) = 26869 * E (m + 2) - 725463 * E (m + 1) + 19683 * E m :=
  boundary_rec uE m

theorem N_rec (m : ℕ) :
    N (m + 3) = 26869 * N (m + 2) - 725463 * N (m + 1) + 19683 * N m :=
  boundary_rec uN m

/- The cubic recurrence determines a sequence from its first three values.
   Its roots are R, 27, S; divide the closed form by R^m and use 0 <= 27/R,S/R < 1. -/
noncomputable section
private def R : ℝ := 13421 + 164 * Real.sqrt 6697
private def S : ℝ := 13421 - 164 * Real.sqrt 6697
private def sol (a b c : ℝ) (m : ℕ) : ℝ :=
  (a + b * Real.sqrt 6697) * R ^ m + c * 27 ^ m +
    (a - b * Real.sqrt 6697) * S ^ m

private theorem sqrt_sq : (Real.sqrt 6697)^2 = (6697 : ℝ) :=
  Real.sq_sqrt (by norm_num)
private theorem sqrt_cube : (Real.sqrt 6697)^3 = 6697 * Real.sqrt 6697 := by
  calc
    _ = (Real.sqrt 6697)^2 * Real.sqrt 6697 := by ring
    _ = _ := by rw [sqrt_sq]

private theorem root_R : R^3 = 26869*R^2 - 725463*R + 19683 := by
  dsimp [R]
  nlinarith [sqrt_sq, sqrt_cube]
private theorem root_S : S^3 = 26869*S^2 - 725463*S + 19683 := by
  dsimp [S]
  nlinarith [sqrt_sq, sqrt_cube]

private theorem power_rec (x : ℝ) (h : x^3 = 26869*x^2 - 725463*x + 19683) (m : ℕ) :
    x^(m+3) = 26869*x^(m+2) - 725463*x^(m+1) + 19683*x^m := by
  simp only [pow_add, pow_one]
  rw [h]
  ring

private theorem sol_rec (a b c : ℝ) (m : ℕ) :
    sol a b c (m+3) = 26869*sol a b c (m+2) - 725463*sol a b c (m+1) +
      19683*sol a b c m := by
  unfold sol
  rw [power_rec R root_R m, power_rec S root_S m,
    power_rec 27 (by norm_num) m]
  ring

private theorem rec_unique (f g : ℕ → ℝ)
    (hf : ∀m, f (m+3) = 26869*f (m+2)-725463*f (m+1)+19683*f m)
    (hg : ∀m, g (m+3) = 26869*g (m+2)-725463*g (m+1)+19683*g m)
    (h0 : f 0 = g 0) (h1 : f 1 = g 1) (h2 : f 2 = g 2) : ∀m, f m = g m := by
  intro m
  induction m using Nat.strong_induction_on with
  | h m ih =>
    rcases m with _ | m
    · exact h0
    rcases m with _ | m
    · exact h1
    rcases m with _ | m
    · exact h2
    rw [hf, hg, ih (m+2) (by omega), ih (m+1) (by omega), ih m (by omega)]

private def aE : ℝ := 75157128831153492728264844 / 181
private def bE : ℝ := 918396100960424690015736 / 181
private def cE : ℝ := 181046097638875512 / 181
private def aN : ℝ := 26218072834567971808555593 / 181
private def bN : ℝ := 11853929506037275963358550 / 6697
private def cN : ℝ := 63156748654209546 / 181

private theorem E_sol : ∀m, (E m : ℝ) = sol aE bE cE m := by
  have hf (m : ℕ) : (E (m+3) : ℝ) =
      26869*(E (m+2) : ℝ)-725463*(E (m+1) : ℝ)+19683*(E m : ℝ) := by
    exact_mod_cast E_rec m
  apply rec_unique _ _ hf (sol_rec aE bE cE)
  · norm_num [E_0, sol, aE, bE, cE, R, S]
    ring
  · norm_num [E_1, sol, aE, bE, cE, R, S]
    nlinarith [sqrt_sq]
  · norm_num [E_2, sol, aE, bE, cE, R, S]
    nlinarith [sqrt_sq, sqrt_cube]

private theorem N_sol : ∀m, (N m : ℝ) = sol aN bN cN m := by
  have hf (m : ℕ) : (N (m+3) : ℝ) =
      26869*(N (m+2) : ℝ)-725463*(N (m+1) : ℝ)+19683*(N m : ℝ) := by
    exact_mod_cast N_rec m
  apply rec_unique _ _ hf (sol_rec aN bN cN)
  · norm_num [N_0, sol, aN, bN, cN, R, S]
    ring
  · norm_num [N_1, sol, aN, bN, cN, R, S]
    nlinarith [sqrt_sq]
  · norm_num [N_2, sol, aN, bN, cN, R, S]
    nlinarith [sqrt_sq, sqrt_cube]

private theorem R_pos : 0 < R := by
  dsimp [R]
  nlinarith [Real.sqrt_nonneg (6697 : ℝ)]

private theorem sol_limit (a b c : ℝ) :
    Filter.Tendsto (fun m : ℕ => sol a b c m / R^m) Filter.atTop
      (nhds (a + b * Real.sqrt 6697)) := by
  have ht0 := Real.sqrt_nonneg (6697 : ℝ)
  have htpos : 0 < Real.sqrt (6697 : ℝ) := Real.sqrt_pos.2 (by norm_num)
  have h27 : (27 : ℝ) < R := by dsimp [R]; nlinarith
  have hs0 : 0 ≤ S := by
    dsimp [S]
    nlinarith [sqrt_sq]
  have hs : S < R := by dsimp [S, R]; nlinarith
  have h1 := tendsto_pow_atTop_nhds_zero_of_lt_one
    (div_nonneg (by norm_num : (0:ℝ) ≤ 27) R_pos.le) ((div_lt_one R_pos).2 h27)
  have h2 := tendsto_pow_atTop_nhds_zero_of_lt_one
    (div_nonneg hs0 R_pos.le) ((div_lt_one R_pos).2 hs)
  have hn (m : ℕ) : sol a b c m / R^m =
      (a+b*Real.sqrt 6697) + c*(27/R)^m + (a-b*Real.sqrt 6697)*(S/R)^m := by
    unfold sol
    rw [div_pow, div_pow]
    field_simp [ne_of_gt R_pos]
  have hc : Filter.Tendsto (fun _ : ℕ => a+b*Real.sqrt 6697) Filter.atTop
      (nhds (a+b*Real.sqrt 6697)) := tendsto_const_nhds
  have h := (hc.add (h1.const_mul c)).add
    (h2.const_mul (a-b*Real.sqrt 6697))
  simpa only [hn, mul_zero, add_zero] using h

/-- The bottom-pair ratio converges to the stated exact quadratic irrational. -/
theorem ratio_tendsto :
    Filter.Tendsto (fun m : ℕ => (N m : ℝ) / E m) Filter.atTop
      (nhds ((115713181619 - 36 * Real.sqrt 6697) / 331705168868)) := by
  have hpos : 0 < aE + bE * Real.sqrt 6697 := by
    dsimp [aE, bE]
    nlinarith [Real.sqrt_nonneg (6697 : ℝ)]
  have hl := (sol_limit aN bN cN).div (sol_limit aE bE cE) (ne_of_gt hpos)
  have heq : (aN+bN*Real.sqrt 6697)/(aE+bE*Real.sqrt 6697) =
      (115713181619 - 36 * Real.sqrt 6697) / 331705168868 := by
    apply (div_eq_iff (ne_of_gt hpos)).2
    dsimp [aN, bN, aE, bE]
    nlinarith [sqrt_sq]
  rw [heq] at hl
  convert hl using 1
  funext m
  rw [E_sol, N_sol]
  exact (div_div_div_cancel_right₀ (ne_of_gt (pow_pos R_pos m)) _ _).symm

end
end OneThird
