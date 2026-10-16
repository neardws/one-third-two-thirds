module
public import OneThird.Intervals

@[expose] public section
namespace OneThird.MatrixBounds
open Matrix
set_option maxHeartbeats 0

abbrev ZMat := Matrix (Fin 6) (Fin 6) ℤ
abbrev RMat := Matrix (Fin 6) (Fin 6) ℝ

def cast (a : ZMat) : RMat := a.map (Int.castRingHom ℝ)
def Nonneg (a : ZMat) : Prop := ∀i j, 0≤a i j
instance (a : ZMat) : Decidable (Nonneg a) := by
  unfold Nonneg
  exact @Fintype.decidableForallFintype _ _
    (fun i => @Fintype.decidableForallFintype _ _ (fun j => inferInstance) inferInstance) inferInstance
def Encloses (lo hi : ZMat) (a : RMat) : Prop :=
  ∀i j, (lo i j : ℝ)≤a i j ∧ a i j≤(hi i j : ℝ)

theorem cast_encloses (a : ZMat) : Encloses a a (cast a) := by
  intro i j
  exact ⟨le_rfl,le_rfl⟩

theorem mul_sound {lo hi lo' hi' : ZMat} {a b : RMat}
    (hl : Nonneg lo) (hl' : Nonneg lo')
    (ha : Encloses lo hi a) (hb : Encloses lo' hi' b) :
    Encloses (lo*lo') (hi*hi') (a*b) := by
  intro i j
  have h1 (k : Fin 6) : (0 : ℝ)≤lo' k j := by exact_mod_cast hl' k j
  have h2 (k : Fin 6) : (0 : ℝ)≤a i k := le_trans (by exact_mod_cast hl i k) (ha i k).1
  have h3 (k : Fin 6) : (0 : ℝ)≤b k j := le_trans (h1 k) (hb k j).1
  have h4 (k : Fin 6) : (0 : ℝ)≤hi i k := (h2 k).trans (ha i k).2
  constructor
  · simp only [Matrix.mul_apply, Int.cast_sum, Int.cast_mul]
    exact Finset.sum_le_sum (fun k _ => mul_le_mul (ha i k).1 (hb k j).1 (h1 k) (h2 k))
  · simp only [Matrix.mul_apply, Int.cast_sum, Int.cast_mul]
    exact Finset.sum_le_sum (fun k _ => mul_le_mul (ha i k).2 (hb k j).2 (h3 k) (h4 k))

theorem nonneg_mul {a b : ZMat} (ha : Nonneg a) (hb : Nonneg b) : Nonneg (a*b) := by
  intro i j
  simp only [Matrix.mul_apply]
  exact Finset.sum_nonneg (fun k _ => mul_nonneg (ha i k) (hb k j))

/-- A proof-carrying bound for a matrix expression. Numerical certificates prove
lower/upper products by reduction; this constructor supplies real soundness. -/
structure Bound where
  lo : ZMat
  hi : ZMat
  lower_nonneg : Nonneg lo

def exact (a : ZMat) (h : Nonneg a) : Bound := ⟨a,a,h⟩
def mul (a b : Bound) : Bound :=
  ⟨a.lo*b.lo,a.hi*b.hi,nonneg_mul a.lower_nonneg b.lower_nonneg⟩

theorem bound_mul_sound {a b : Bound} {x y : RMat}
    (hx : Encloses a.lo a.hi x) (hy : Encloses b.lo b.hi y) :
    Encloses (mul a b).lo (mul a b).hi (x*y) :=
  mul_sound a.lower_nonneg b.lower_nonneg hx hy

/-- Integer checks for a separated event/total ratio. The common rational scale
cancels, so no denominator normalization is needed in the numerical kernel. -/
def separates (hlo hhi elo ehi : ℤ) : Prop :=
  0<elo ∧ (5000*hhi<1743*elo ∨ 3257*ehi<5000*hlo)
instance (a b c d : ℤ) : Decidable (separates a b c d) :=
  inferInstanceAs (Decidable (_ ∧ (_ ∨ _)))

theorem separates_sound {hlo hhi elo ehi : ℤ} {H E : ℝ}
    (hc : separates hlo hhi elo ehi)
    (hh : (hlo : ℝ)≤H ∧ H≤(hhi : ℝ))
    (he : (elo : ℝ)≤E ∧ E≤(ehi : ℝ)) :
    0<E ∧ (H/E<(3486 : ℝ)/10000 ∨ 1-H/E<(3486 : ℝ)/10000) := by
  have hep : (0 : ℝ)<elo := by exact_mod_cast hc.1
  have hE : 0<E := hep.trans_le he.1
  refine ⟨hE, ?_⟩
  rcases hc.2 with hc | hc
  · left
    have h : (5000 : ℝ)*hhi<1743*elo := by exact_mod_cast hc
    apply (div_lt_iff₀ hE).2
    linarith
  · right
    have h : (3257 : ℝ)*ehi<5000*hlo := by exact_mod_cast hc
    have hh' : (3257 : ℝ)/5000 < H/E := (lt_div_iff₀ hE).2 (by linarith)
    linarith

end OneThird.MatrixBounds
