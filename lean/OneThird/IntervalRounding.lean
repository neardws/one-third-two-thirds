module
public import OneThird.Intervals

@[expose] public section
namespace OneThird.Intervals
open Matrix

/-- Exact outward rounding, including negative endpoints. -/
def roundOut (scale : ℕ) (I : Box) : Box :=
  ⟨(⌊I.lo*(scale : ℚ)⌋ : ℤ)/(scale : ℚ),
   (⌈I.hi*(scale : ℚ)⌉ : ℤ)/(scale : ℚ)⟩

theorem roundOut_widens (scale : ℕ) (hs : 0<scale) (I : Box) :
    widens I (roundOut scale I) := by
  have hp : (0 : ℚ)<scale := by exact_mod_cast hs
  constructor
  · exact (div_le_iff₀ hp).2 (Int.floor_le (I.lo*(scale : ℚ)))
  · exact (le_div_iff₀ hp).2 (Int.le_ceil (I.hi*(scale : ℚ)))

theorem roundOut_sound (scale : ℕ) (hs : 0<scale) {I : Box} {x : ℝ}
    (hx : Contains I x) : Contains (roundOut scale I) x :=
  widen_sound (roundOut_widens scale hs I) hx

def sumFin : (n : ℕ) → (Fin n → Box) → Box
  | 0, _ => point 0
  | n+1, f => add (f 0) (sumFin n (fun i => f i.succ))

theorem sumFin_sound (n : ℕ) (f : Fin n → Box) (g : Fin n → ℝ)
    (h : ∀i, Contains (f i) (g i)) : Contains (sumFin n f) (∑i, g i) := by
  induction n with
  | zero => simp [sumFin, point, Contains]
  | succ n ih =>
    simpa only [sumFin, Fin.sum_univ_succ] using
      add_sound (h 0) (ih (fun i => f i.succ) (fun i => g i.succ) (fun i => h i.succ))

def mulMatrix {l m n : ℕ} (a : Matrix (Fin l) (Fin m) Box)
    (b : Matrix (Fin m) (Fin n) Box) : Matrix (Fin l) (Fin n) Box :=
  fun i j => sumFin m (fun k => mul (a i k) (b k j))

theorem mulMatrix_sound {l m n : ℕ} (a : Matrix (Fin l) (Fin m) Box)
    (b : Matrix (Fin m) (Fin n) Box)
    (x : Matrix (Fin l) (Fin m) ℝ) (y : Matrix (Fin m) (Fin n) ℝ)
    (ha : ∀i j, Contains (a i j) (x i j)) (hb : ∀i j, Contains (b i j) (y i j)) :
    ∀i j, Contains (mulMatrix a b i j) ((x*y) i j) := by
  intro i j
  exact sumFin_sound m _ _ (fun k => mul_sound (ha i k) (hb k j))

end OneThird.Intervals
