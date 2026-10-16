module
public import OneThird.Dominance

@[expose] public section
namespace OneThird.Intervals
set_option maxHeartbeats 0

/-- Rational closed endpoints. Soundness does not require a separate well-formed
field: an inverted interval simply contains no real number. -/
structure Box where
  lo : ℚ
  hi : ℚ
  deriving DecidableEq

def Contains (I : Box) (x : ℝ) : Prop := (I.lo : ℝ) ≤ x ∧ x ≤ (I.hi : ℝ)
def point (q : ℚ) : Box := ⟨q,q⟩
def add (I J : Box) : Box := ⟨I.lo+J.lo,I.hi+J.hi⟩
def neg (I : Box) : Box := ⟨-I.hi,-I.lo⟩
def sub (I J : Box) : Box := add I (neg J)
def mul (I J : Box) : Box :=
  ⟨min (min (I.lo*J.lo) (I.lo*J.hi)) (min (I.hi*J.lo) (I.hi*J.hi)),
   max (max (I.lo*J.lo) (I.lo*J.hi)) (max (I.hi*J.lo) (I.hi*J.hi))⟩
def inv (I : Box) : Box := ⟨I.hi⁻¹,I.lo⁻¹⟩
def div (I J : Box) : Box := mul I (inv J)

@[simp] theorem point_sound (q : ℚ) : Contains (point q) (q : ℝ) := by
  exact ⟨le_rfl,le_rfl⟩

theorem add_sound {I J : Box} {x y : ℝ} (hx : Contains I x) (hy : Contains J y) :
    Contains (add I J) (x+y) := by
  simpa [Contains, add] using And.intro (add_le_add hx.1 hy.1) (add_le_add hx.2 hy.2)

theorem neg_sound {I : Box} {x : ℝ} (hx : Contains I x) : Contains (neg I) (-x) := by
  simpa [Contains, neg] using And.intro (neg_le_neg hx.2) (neg_le_neg hx.1)

theorem sub_sound {I J : Box} {x y : ℝ} (hx : Contains I x) (hy : Contains J y) :
    Contains (sub I J) (x-y) := by
  simpa [sub, sub_eq_add_neg] using add_sound hx (neg_sound hy)

private theorem linear_bound (a b x y : ℝ) (ha : a≤x) (hb : x≤b) :
    min (a*y) (b*y) ≤ x*y ∧ x*y ≤ max (a*y) (b*y) := by
  by_cases hy : 0≤y
  · exact ⟨(min_le_left _ _).trans (mul_le_mul_of_nonneg_right ha hy),
      (mul_le_mul_of_nonneg_right hb hy).trans (le_max_right _ _)⟩
  · exact ⟨(min_le_right _ _).trans (mul_le_mul_of_nonpos_right hb (le_of_not_ge hy)),
      (mul_le_mul_of_nonpos_right ha (le_of_not_ge hy)).trans (le_max_left _ _)⟩

private theorem corner_bound (a b c d x y : ℝ)
    (hax : a≤x) (hxb : x≤b) (hcy : c≤y) (hyd : y≤d) :
    min (min (a*c) (a*d)) (min (b*c) (b*d)) ≤ x*y ∧
    x*y ≤ max (max (a*c) (a*d)) (max (b*c) (b*d)) := by
  have h := linear_bound a b x y hax hxb
  have ha := linear_bound c d y a hcy hyd
  have hb := linear_bound c d y b hcy hyd
  simp only [mul_comm _ a] at ha
  simp only [mul_comm _ b] at hb
  exact ⟨(min_le_min ha.1 hb.1).trans h.1, h.2.trans (max_le_max ha.2 hb.2)⟩

theorem mul_sound {I J : Box} {x y : ℝ} (hx : Contains I x) (hy : Contains J y) :
    Contains (mul I J) (x*y) := by
  simpa [Contains, mul] using corner_bound I.lo I.hi J.lo J.hi x y hx.1 hx.2 hy.1 hy.2

theorem inv_sound {I : Box} {x : ℝ} (hpos : 0<I.lo) (hx : Contains I x) :
    Contains (inv I) x⁻¹ := by
  have hl : (0 : ℝ)<I.lo := by exact_mod_cast hpos
  have hp : 0<x := lt_of_lt_of_le hl hx.1
  constructor
  · simpa [inv] using inv_anti₀ hp hx.2
  · simpa [inv] using inv_anti₀ hl hx.1

theorem div_sound {I J : Box} {x y : ℝ} (hpos : 0<J.lo)
    (hx : Contains I x) (hy : Contains J y) : Contains (div I J) (x/y) := by
  simpa [div, div_eq_mul_inv] using mul_sound hx (inv_sound hpos hy)

/-- A rational widening checker; permits exact externally supplied rounded
endpoints without trusting their method of generation. -/
def widens (I J : Box) : Prop := J.lo≤I.lo ∧ I.hi≤J.hi
instance (I J : Box) : Decidable (widens I J) := inferInstanceAs (Decidable (_ ∧ _))

theorem widen_sound {I J : Box} (h : widens I J) {x : ℝ} (hx : Contains I x) : Contains J x := by
  have hl : (J.lo : ℝ)≤I.lo := by exact_mod_cast h.1
  have hh : (I.hi : ℝ)≤J.hi := by exact_mod_cast h.2
  exact ⟨hl.trans hx.1,hx.2.trans hh⟩

end OneThird.Intervals
