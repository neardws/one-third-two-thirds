module
public import OneThird.PathDP

@[expose] public section
namespace OneThird.Structure
open Matrix
set_option maxRecDepth 100000
set_option maxHeartbeats 0

/-- The zero eigenvalue is semisimple for this concrete block: the spectral
transient ends after one step, much earlier than the degree-six annihilator. -/
theorem A_short_annih : A^3 = (164 : ℤ) • A^2 - (27 : ℤ) • A := by decide

/-- All positive powers satisfy the two-root recurrence. -/
theorem A_power_rec (k : ℕ) :
    A^(k+3) = (164 : ℤ) • A^(k+2) - (27 : ℤ) • A^(k+1) := by
  have h := congrArg (fun X : Mat6 => A^k * X) A_short_annih
  simpa only [Matrix.mul_sub, Matrix.mul_smul, ← pow_add, ← pow_succ] using h

/-- The two-root formula, without introducing any square roots: if r+s=164,
rs=27, the scalar sequences r^k and s^k obey the active recurrence. -/
theorem root_power_rec (r s : ℝ) (hsum : r+s=164) (hprod : r*s=27) (k : ℕ) :
    r^(k+2) = 164*r^(k+1)-27*r^k := by
  have hr : r^2=164*r-27 := by nlinarith
  simp only [pow_add, pow_one]
  rw [hr]
  ring

/-- Solve the active two-root recurrence over the reals, uniformly in k. -/
theorem two_root_expansion (f : ℕ → ℝ) (r s : ℝ)
    (hsum : r+s=164) (hprod : r*s=27) (hne : r-s≠0)
    (hf : ∀k, f (k+2)=164*f (k+1)-27*f k) (k : ℕ) :
    f k = ((f 1-s*f 0)/(r-s))*r^k + ((r*f 0-f 1)/(r-s))*s^k := by
  induction k using Nat.strong_induction_on with
  | h k ih =>
    rcases k with _ | k
    · simp only [pow_zero, mul_one]
      field_simp
      ring
    rcases k with _ | k
    · change f 1 = ((f 1-s*f 0)/(r-s))*r^1 + ((r*f 0-f 1)/(r-s))*s^1
      simp only [pow_one]
      field_simp
      ring
    change f (k+2) = _
    rw [hf k, ih (k+1) (by omega), ih k (by omega)]
    rw [root_power_rec r s hsum hprod k,
      root_power_rec s r (by linarith) (by nlinarith) k]
    ring

/-- Exact two-root expansion of every entry of every positive block power.
The projector coefficients are (A²-sA)/(r-s) and (rA-A²)/(r-s). -/
theorem A_entry_spectral (r s : ℝ) (hsum : r+s=164) (hprod : r*s=27)
    (hne : r-s≠0) (i j : Fin 6) (k : ℕ) :
    ((A^(k+1)) i j : ℝ) =
      ((((A^2) i j : ℝ)-s*(A i j : ℝ))/(r-s))*r^k +
      ((r*(A i j : ℝ)-((A^2) i j : ℝ))/(r-s))*s^k := by
  have hf (k : ℕ) : ((A^(k+3)) i j : ℝ) =
      164*((A^(k+2)) i j : ℝ)-27*((A^(k+1)) i j : ℝ) := by
    have h := congrArg (fun B : Mat6 => B i j) (A_power_rec k)
    simp only [Matrix.sub_apply, Matrix.smul_apply, smul_eq_mul] at h
    exact_mod_cast h
  simpa using two_root_expansion (fun k => ((A^(k+1)) i j : ℝ)) r s hsum hprod hne hf k

/-- The actual quadratic-field roots have the required signs and relations. -/
theorem spectral_root_data :
    (82+Real.sqrt 6697)+(82-Real.sqrt 6697)=164 ∧
    (82+Real.sqrt 6697)*(82-Real.sqrt 6697)=27 ∧
    0<82-Real.sqrt 6697 ∧ 82-Real.sqrt 6697<82+Real.sqrt 6697 := by
  have hs : (Real.sqrt 6697)^2=(6697 : ℝ) := Real.sq_sqrt (by norm_num)
  have hp : 0<Real.sqrt 6697 := Real.sqrt_pos.2 (by norm_num)
  have hn : 0≤Real.sqrt 6697 := Real.sqrt_nonneg _
  constructor
  · ring
  constructor
  · nlinarith
  constructor <;> nlinarith

/-- Specialization of the entrywise spectral identity to Q(sqrt(6697)). -/
theorem A_entry_sqrt (i j : Fin 6) (k : ℕ) :
    ((A^(k+1)) i j : ℝ) =
      ((((A^2) i j : ℝ)-(82-Real.sqrt 6697)*(A i j : ℝ))/(2*Real.sqrt 6697))*
        (82+Real.sqrt 6697)^k +
      (((82+Real.sqrt 6697)*(A i j : ℝ)-((A^2) i j : ℝ))/(2*Real.sqrt 6697))*
        (82-Real.sqrt 6697)^k := by
  obtain ⟨hsum, hprod, hpos, hlt⟩ := spectral_root_data
  have hne : (82+Real.sqrt 6697)-(82-Real.sqrt 6697)≠0 := by linarith
  have h := A_entry_spectral (82+Real.sqrt 6697) (82-Real.sqrt 6697)
    hsum hprod hne i j k
  have heq : (82+Real.sqrt 6697)-(82-Real.sqrt 6697)=2*Real.sqrt 6697 := by ring
  rwa [heq] at h

/-- In a repeated block, k earlier and l later complete blocks partition the
remaining m-1 blocks. If m>=8, at least one distance is in the spectral tail. -/
theorem block_regime_coverage (m k l : ℕ) (hm : 8 ≤ m) (hpartition : k+l+1=m) :
    (k<4 ∧ 4≤l) ∨ (4≤k ∧ l<4) ∨ (4≤k ∧ 4≤l) := by omega

/-- Every row carrying a horizontal element-placement edge lies in one of
five finite/periodic regions; the terminal seed row is deliberately excluded. -/
theorem row_region_coverage (m r : ℕ) (hr : r<54+10*m) :
    r<22 ∨
    (∃k t : ℕ, k<m ∧ t<5 ∧ r=22+5*k+t) ∨
    (∃t : ℕ, t<11 ∧ r=22+5*m+t) ∨
    (∃k t : ℕ, k<m ∧ t<5 ∧ r=33+5*m+5*k+t) ∨
    (∃t : ℕ, t<21 ∧ r=33+10*m+t) := by
  by_cases hpre : r<22
  · exact Or.inl hpre
  right
  by_cases hleft : r<22+5*m
  · left
    refine ⟨(r-22)/5, (r-22)%5, ?_⟩
    omega
  right
  by_cases hmid : r<33+5*m
  · left
    exact ⟨r-(22+5*m), by omega, by omega⟩
  right
  by_cases hright : r<33+10*m
  · left
    refine ⟨(r-(33+5*m))/5, (r-(33+5*m))%5, ?_⟩
    omega
  right
  exact ⟨r-(33+10*m), by omega, by omega⟩

/-- The broken-rung reflection is an exact involution. -/
theorem mirror_involution (m : ℕ) (x : ℤ) : mirror m (mirror m x) = x := by
  simp [mirror]

theorem broken_reflection (m : ℕ) (x : ℤ) : broken m (mirror m x) ↔ broken m x := by
  change (cap (mirror m x) ∨ interior m (mirror m x) ∨
      cap (mirror m (mirror m x)) ∨ interior m (mirror m (mirror m x))) ↔ _
  rw [mirror_involution]
  constructor
  · rintro (h | h | h | h)
    · exact Or.inr (Or.inr (Or.inl h))
    · exact Or.inr (Or.inr (Or.inr h))
    · exact Or.inl h
    · exact Or.inr (Or.inl h)
  · rintro (h | h | h | h)
    · exact Or.inr (Or.inr (Or.inl h))
    · exact Or.inr (Or.inr (Or.inr h))
    · exact Or.inl h
    · exact Or.inr (Or.inl h)

/-- Reflection on the original element labels; this reverses the order and
exchanges the chains. It does not imply uniqueness of the most balanced pair. -/
def flipLabel (m : ℕ) (x : ℤ) : ℤ := 2*p m-1-x

theorem flipLabel_involution (m : ℕ) (x : ℤ) : flipLabel m (flipLabel m x) = x := by
  simp [flipLabel]

theorem generator_reflection {m : ℕ} {x y : ℤ} (h : Generator m x y) :
    Generator m (flipLabel m y) (flipLabel m x) := by
  obtain ⟨hx, hy, hs⟩ := h
  refine ⟨by simp only [flipLabel]; omega, by simp only [flipLabel]; omega, ?_⟩
  rcases hs with h2 | ⟨h3, hn⟩
  · left
    simp only [flipLabel]
    omega
  · right
    refine ⟨by simp only [flipLabel]; omega, ?_⟩
    have heq : flipLabel m y = mirror m x := by simp only [flipLabel, mirror, p]; omega
    rw [heq, broken_reflection]
    exact hn

theorem generated_reflection {m : ℕ} {x y : ℤ}
    (h : Relation.ReflTransGen (Generator m) x y) :
    Relation.ReflTransGen (Generator m) (flipLabel m y) (flipLabel m x) := by
  induction h with
  | refl => exact .refl
  | tail hxy hyz ih => exact (Relation.ReflTransGen.single (generator_reflection hyz)).trans ih

/-- The seven cutoffs -3,...,3 exhaust every integer threshold, with saturation. -/
theorem cutoff_coverage (d : ℤ) : d ≤ -3 ∨ (-3<d ∧ d<3) ∨ 3≤d := by omega

/-- Keep exactly the horizontal placements before b_j, where d=j-i.
Column e corresponds to crossing height i+e-3. -/
def eventRow (S : Mask) (d : ℤ) : Mat6 := fun i e =>
  if (e.val : ℤ)<d+3 then rowMatrix S i e else 0

def complementRow (S : Mask) (d : ℤ) : Mat6 := fun i e =>
  if d+3≤(e.val : ℤ) then rowMatrix S i e else 0

theorem event_partition (S : Mask) (d : ℤ) :
    eventRow S d + complementRow S d = rowMatrix S := by
  ext i e
  simp only [eventRow, complementRow, Matrix.add_apply]
  split_ifs <;> omega

theorem event_low (S : Mask) (d : ℤ) (hd : d ≤ -3) : eventRow S d = 0 := by
  ext i e
  simp only [eventRow, Matrix.zero_apply]
  have he : ¬ (e.val : ℤ)<d+3 := by omega
  simp [he]

theorem event_high (S : Mask) (d : ℤ) (hd : 3 ≤ d) : eventRow S d = rowMatrix S := by
  ext i e
  simp only [eventRow]
  have he : (e.val : ℤ)<d+3 := by have := e.isLt; omega
  simp [he]

/-- The count split at a specified horizontal crossing is algebraically exact.
Its interpretation as a pair event is the edge-decomposition lemma on paper. -/
theorem crossing_partition (u : Matrix (Fin 1) (Fin 6) ℤ)
    (w : Matrix (Fin 6) (Fin 1) ℤ) (S : Mask) (d : ℤ) :
    u * eventRow S d * w + u * complementRow S d * w = u * rowMatrix S * w := by
  rw [← Matrix.add_mul, ← Matrix.mul_add, event_partition]

/-- The common rational separator used by the external certificate has strict
slack: non-endpoints are below 0.3486, endpoints above 0.34884. -/
theorem separator_gap :
    (3486 : ℚ)/10000 + 3/12500 = 34884/100000 ∧
    (34884 : ℚ)/100000 < 1/2 := by norm_num

/-- Once certified normalized bounds are supplied, dominance follows by clearing
the positive denominator. This lemma does not assume or assert those bounds. -/
theorem dominance_of_separator (E N H : ℝ) (hE : 0<E)
    (hN : (34884 : ℝ)/100000 < N/E)
    (hH : H/E < (3486 : ℝ)/10000 ∨ 1-H/E < (3486 : ℝ)/10000) :
    min H (E-H) + (3/12500)*E < N := by
  have hn : (34884 : ℝ)/100000*E < N := (lt_div_iff₀ hE).mp hN
  rcases hH with h | h
  · have hh := (div_lt_iff₀ hE).mp h
    have hm := min_le_left H (E-H)
    nlinarith
  · have hh : (E-H)/E < (3486 : ℝ)/10000 := by
      simpa only [sub_div, div_self (ne_of_gt hE)] using h
    have hh' := (div_lt_iff₀ hE).mp hh
    have hm := min_le_right H (E-H)
    nlinarith

end OneThird.Structure
