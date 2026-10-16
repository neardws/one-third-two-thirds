module
public import OneThird.LinearExtensions4
public import Mathlib.Order.Interval.Finset.Fin
@[expose] public section
namespace OneThird.ChainPrefixes5
open Structure LinearExtensions4
set_option maxHeartbeats 0

/-- A finite lower subset of a chain is exactly the prefix of its cardinality. -/
theorem lower_set_card {p : ℕ} (S : Finset (Fin p))
    (hl : ∀r s : Fin p, r≤s → s∈S → r∈S) (r : Fin p) :
    r∈S ↔ r.val<S.card := by
  constructor
  · intro hr
    have hsub : Finset.Iic r⊆S := by
      intro s hs
      exact hl s r (Finset.mem_Iic.mp hs) hr
    have hc := Finset.card_le_card hsub
    rw [Fin.card_Iic] at hc
    omega
  · intro hc
    by_contra hr
    have hsub : S⊆Finset.Iio r := by
      intro s hs
      apply Finset.mem_Iio.mpr
      by_contra hge
      exact hr (hl r s (le_of_not_gt hge) hs)
    have hh := Finset.card_le_card hsub
    rw [Fin.card_Iio] at hh
    omega

def chainLabel (m : ℕ) (a : Fin 2) (r : Fin (54+10*m)) : Fin (108+20*m) :=
  ⟨2*r.val+a.val,by have := r.isLt; have := a.isLt; omega⟩

theorem natural_chain_comparison (m : ℕ) (a : Fin 2) (r : ℕ) :
    ∀s, r≤s → s<54+10*m →
      Relation.ReflTransGen (Generator m) (2*(r : ℤ)+(a.val : ℤ)) (2*(s : ℤ)+(a.val : ℤ)) := by
  intro s
  induction s using Nat.strong_induction_on with
  | h s ih =>
    intro hrs hs
    by_cases he : r=s
    · subst r
      exact .refl
    · have hlt : r<s := by omega
      have hprev := ih (s-1) (by omega) (by omega) (by omega)
      apply hprev.tail
      refine ⟨by omega, ?_,Or.inl ?_⟩
      · have ha := a.isLt
        simp only [p]
        omega
      · omega

theorem chain_comparison (m : ℕ) (a : Fin 2) (r s : Fin (54+10*m)) (h : r≤s) :
    FamilyRelation m (chainLabel m a r) (chainLabel m a s) := by
  change Relation.ReflTransGen (Generator m) (chainLabel m a r : ℤ) (chainLabel m a s : ℤ)
  convert natural_chain_comparison m a r.val s.val h s.isLt using 1 <;>
    simp [chainLabel]

/-- The chain indices present in a rank prefix of an actual linear extension. -/
def prefixChain (m : ℕ) (e : FamilyExtension m) (k : ℕ) (a : Fin 2) : Finset (Fin (54+10*m)) :=
  Finset.univ.filter (fun r => (e.val (chainLabel m a r)).val<k)

theorem prefixChain_lower (m : ℕ) (e : FamilyExtension m) (k : ℕ) (a : Fin 2)
    (r s : Fin (54+10*m)) (h : r≤s) (hs : s∈prefixChain m e k a) :
    r∈prefixChain m e k a := by
  have hrank := e.property _ _ (chain_comparison m a r s h)
  simp only [prefixChain,Finset.mem_filter,Finset.mem_univ,true_and] at hs ⊢
  exact lt_of_le_of_lt hrank hs

/-- Every actual extension prefix is an initial segment on each parity chain;
the coordinate is the cardinality of that chain's prefix. -/
theorem chain_rank_iff (m : ℕ) (e : FamilyExtension m) (k : ℕ) (a : Fin 2)
    (r : Fin (54+10*m)) :
    (e.val (chainLabel m a r)).val<k ↔ r.val<(prefixChain m e k a).card := by
  simpa [prefixChain] using
    lower_set_card (prefixChain m e k a) (prefixChain_lower m e k a) r

theorem label_surjective (m : ℕ) (x : Fin (108+20*m)) :
    ∃a r, chainLabel m a r=x := by
  refine ⟨⟨x.val%2,by omega⟩,⟨x.val/2,by have := x.isLt; omega⟩,?_⟩
  apply Fin.ext
  dsimp [chainLabel]
  omega

theorem prefix_even_iff (i j r : ℕ) :
    Prefix (i : ℤ) (j : ℤ) (2*(r : ℤ)) ↔ r < i := by
  constructor
  · rintro ⟨q,hq,h | h⟩ <;> omega
  · intro h
    exact ⟨r,by omega,Or.inl ⟨rfl,by omega⟩⟩

theorem prefix_odd_iff (i j r : ℕ) :
    Prefix (i : ℤ) (j : ℤ) (2*(r : ℤ)+1) ↔ r < j := by
  constructor
  · rintro ⟨q,hq,h | h⟩ <;> omega
  · intro h
    exact ⟨r,by omega,Or.inr ⟨rfl,by omega⟩⟩

/-- The actual set of elements preceding rank k is exactly the union of the
even and odd prefixes whose lengths are their finite cardinalities. -/
theorem rank_prefix_rectangle (m : ℕ) (e : FamilyExtension m) (k : ℕ)
    (x : Fin (108+20*m)) :
    (e.val x).val<k ↔
      Prefix ((prefixChain m e k 0).card : ℤ) ((prefixChain m e k 1).card : ℤ) (x : ℤ) := by
  obtain ⟨a,r,rfl⟩ := label_surjective m x
  fin_cases a
  · have h := chain_rank_iff m e k 0 r
    simpa [chainLabel,prefix_even_iff] using h
  · have h := chain_rank_iff m e k 1 r
    simpa [chainLabel,prefix_odd_iff] using h

theorem generated_start_nonneg {m : ℕ} {x y : ℤ}
    (h : Relation.ReflTransGen (Generator m) x y) : 0≤y → 0≤x := by
  induction h with
  | refl => exact id
  | tail hxy hyz ih => intro _; exact ih hyz.1

/-- Every rank prefix of an actual linear extension gives a valid lattice
vertex, with coordinates defined independently by finite cardinalities. -/
theorem rank_prefix_orderIdeal (m : ℕ) (e : FamilyExtension m) (k : ℕ) :
    OrderIdeal m ((prefixChain m e k 0).card : ℤ) ((prefixChain m e k 1).card : ℤ) := by
  have hi := Finset.card_le_univ (prefixChain m e k 0)
  have hj := Finset.card_le_univ (prefixChain m e k 1)
  simp only [Fintype.card_fin] at hi hj
  refine ⟨by positivity,by simp only [p]; omega,by positivity,by simp only [p]; omega,?_⟩
  intro x y hxy hy
  have hyb := prefix_in_universe (m:=m) (by simp only [p]; omega) (by simp only [p]; omega) hy
  have hle := generated_le hxy
  have hx0 : 0≤x := generated_start_nonneg hxy hyb.1
  let xf : Fin (108+20*m) := ⟨x.toNat,by simp only [p] at hyb; omega⟩
  let yf : Fin (108+20*m) := ⟨y.toNat,by simp only [p] at hyb; omega⟩
  have hyRank : (e.val yf).val<k :=
    (rank_prefix_rectangle m e k yf).mpr (by simpa [yf,max_eq_left hyb.1] using hy)
  have hfin : FamilyRelation m xf yf := by
    change Relation.ReflTransGen (Generator m) (xf : ℤ) (yf : ℤ)
    simpa [xf,yf,max_eq_left hx0,max_eq_left hyb.1] using hxy
  have hxRank := family_prefix_ideal m e k xf yf hfin hyRank
  have hx := (rank_prefix_rectangle m e k xf).mp hxRank
  simpa [xf,max_eq_left hx0] using hx

end OneThird.ChainPrefixes5
