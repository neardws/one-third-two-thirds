module
public import OneThird.Structure

@[expose] public section
namespace OneThird.Structure

/-- The original +2 and intact +3 ladder generators, on integer labels. -/
def Generator (m : ℕ) (x y : ℤ) : Prop :=
  0 ≤ x ∧ y < 2*p m ∧ (y=x+2 ∨ (y=x+3 ∧ ¬ broken m x))

/-- The union of an even prefix of length i and an odd prefix of length j. -/
def Prefix (i j x : ℤ) : Prop :=
  ∃r : ℤ, 0 ≤ r ∧ ((x=2*r ∧ r < i) ∨ (x=2*r+1 ∧ r < j))

/-- Downward closure under the original generating relations. -/
def GeneratorIdeal (m : ℕ) (i j : ℤ) : Prop :=
  0 ≤ i ∧ i ≤ p m ∧ 0 ≤ j ∧ j ≤ p m ∧
  ∀x y, Generator m x y → Prefix i j y → Prefix i j x

/-- The explicit generator formulation is exactly the cross-chain criterion. -/
theorem generatorIdeal_iff_valid (m : ℕ) (i j : ℤ) :
    GeneratorIdeal m i j ↔ Valid m i j := by
  constructor
  · rintro ⟨hi0, hip, hj0, hjp, h⟩
    refine ⟨hi0, hip, hj0, hjp, ?_, ?_⟩
    · intro r hr hrp hn hrj
      have hx := h (2*r) (2*r+3) ⟨by omega, hrp, Or.inr ⟨rfl, hn⟩⟩
        ⟨r+1, by omega, Or.inr ⟨by ring, by omega⟩⟩
      obtain ⟨t, ht, he | ho⟩ := hx <;> omega
    · intro r hr hrp hn hri
      have hx := h (2*r+1) (2*r+4) ⟨by omega, hrp, Or.inr ⟨by ring, hn⟩⟩
        ⟨r+2, by omega, Or.inl ⟨by ring, by omega⟩⟩
      obtain ⟨t, ht, he | ho⟩ := hx <;> omega
  · rintro ⟨hi0, hip, hj0, hjp, he, ho⟩
    refine ⟨hi0, hip, hj0, hjp, ?_⟩
    rintro x y ⟨hx, hy, hstep⟩ ⟨r, hr, hpar⟩
    rcases hstep with h2 | ⟨h3, hn⟩
    · rcases hpar with ⟨heq, hri⟩ | ⟨heq, hrj⟩
      · exact ⟨r-1, by omega, Or.inl ⟨by omega, by omega⟩⟩
      · exact ⟨r-1, by omega, Or.inr ⟨by omega, by omega⟩⟩
    · rcases hpar with ⟨heq, hri⟩ | ⟨heq, hrj⟩
      · have hn' : ¬ broken m (2*(r-2)+1) := by
          have heq' : 2*(r-2)+1=x := by omega
          rwa [heq']
        have hj := ho (r-2) (by omega) (by omega) hn' (by omega)
        exact ⟨r-2, by omega, Or.inr ⟨by omega, by omega⟩⟩
      · have hn' : ¬ broken m (2*(r-1)) := by
          have heq' : 2*(r-1)=x := by omega
          rwa [heq']
        have hi := he (r-1) (by omega) (by omega) hn' (by omega)
        exact ⟨r-1, by omega, Or.inl ⟨by omega, by omega⟩⟩

/-- Downward closure for the reflexive transitive closure of the generators. -/
def OrderIdeal (m : ℕ) (i j : ℤ) : Prop :=
  0 ≤ i ∧ i ≤ p m ∧ 0 ≤ j ∧ j ≤ p m ∧
  ∀x y, Relation.ReflTransGen (Generator m) x y → Prefix i j y → Prefix i j x

theorem orderIdeal_iff_generatorIdeal (m : ℕ) (i j : ℤ) :
    OrderIdeal m i j ↔ GeneratorIdeal m i j := by
  constructor
  · rintro ⟨hi0, hip, hj0, hjp, h⟩
    exact ⟨hi0, hip, hj0, hjp, fun x y hxy => h x y (.single hxy)⟩
  · rintro ⟨hi0, hip, hj0, hjp, h⟩
    refine ⟨hi0, hip, hj0, hjp, ?_⟩
    intro x y hxy
    induction hxy with
    | refl => exact id
    | @tail y z hxy hyz ih => exact fun hz => ih (h y z hyz hz)

theorem orderIdeal_iff_valid (m : ℕ) (i j : ℤ) :
    OrderIdeal m i j ↔ Valid m i j :=
  (orderIdeal_iff_generatorIdeal m i j).trans (generatorIdeal_iff_valid m i j)

theorem orderIdeal_band {m : ℕ} {i j : ℤ} (h : OrderIdeal m i j) :
    -3 ≤ j-i ∧ j-i ≤ 2 :=
  band ((orderIdeal_iff_valid m i j).mp h)

/-- The masks used by the periodic word are masks of actual generator-order ideals. -/
theorem mem_rowMask_iff_orderIdeal (m i : ℕ) (t : Fin 6) :
    t ∈ rowMask m i ↔ OrderIdeal m (i : ℤ) ((i : ℤ)+(t : ℤ)-3) := by
  simp only [rowMask, Finset.mem_filter, Finset.mem_univ, true_and]
  exact (valid_iff_local m _ _).symm.trans (orderIdeal_iff_valid m _ _).symm

/-- The generated order is increasing in the original element labels. -/
theorem generated_le {m : ℕ} {x y : ℤ}
    (h : Relation.ReflTransGen (Generator m) x y) : x ≤ y := by
  induction h with
  | refl => exact le_refl _
  | @tail y z hxy hyz ih =>
    obtain ⟨_, _, hs⟩ := hyz
    rcases hs with hs | ⟨hs, _⟩ <;> omega

/-- The finite poset family on its original vertex labels. No additional order
relations are introduced beyond reflexive transitive closure of the generators. -/
abbrev familyOrder (m : ℕ) : PartialOrder (Fin (108+20*m)) where
  le x y := Relation.ReflTransGen (Generator m) (x : ℤ) (y : ℤ)
  lt x y := Relation.ReflTransGen (Generator m) (x : ℤ) (y : ℤ) ∧
    ¬ Relation.ReflTransGen (Generator m) (y : ℤ) (x : ℤ)
  lt_iff_le_not_ge _ _ := Iff.rfl
  le_refl _ := .refl
  le_trans _ _ _ hxy hyz := hxy.trans hyz
  le_antisymm x y hxy hyx := by
    have h := le_antisymm (generated_le hxy) (generated_le hyx)
    apply Fin.ext
    omega

/-- Every member of a bounded prefix is a vertex of the finite ladder. -/
theorem prefix_in_universe {m : ℕ} {i j x : ℤ}
    (hi : i ≤ p m) (hj : j ≤ p m) (hx : Prefix i j x) :
    0 ≤ x ∧ x < 2*p m := by
  obtain ⟨r, hr, he | ho⟩ := hx <;> omega

end OneThird.Structure
