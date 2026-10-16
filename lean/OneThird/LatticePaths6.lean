module
public import OneThird.ChainPrefixes5
@[expose] public section
namespace OneThird.LatticePaths6
open Structure LinearExtensions4 ChainPrefixes5
set_option maxHeartbeats 0

abbrev size (m : ℕ) := 108+20*m
abbrev half (m : ℕ) := 54+10*m

/-- A path is given only by its grid vertices, not by an extension or a
permutation. Every edge is a positive unit step through genuine order ideals. -/
structure LatticePath (m : ℕ) where
  vertex : Fin (size m+1) → ℕ × ℕ
  start : vertex 0 = (0,0)
  finish : vertex ⟨size m,by omega⟩ = (half m,half m)
  ideal : ∀k, OrderIdeal m (vertex k).1 (vertex k).2
  step : ∀k : Fin (size m),
    vertex ⟨k.val+1,by omega⟩ = ((vertex ⟨k.val,by omega⟩).1+1,
      (vertex ⟨k.val,by omega⟩).2) ∨
    vertex ⟨k.val+1,by omega⟩ = ((vertex ⟨k.val,by omega⟩).1,
      (vertex ⟨k.val,by omega⟩).2+1)

namespace LatticePath
variable {m : ℕ} (w : LatticePath m)

theorem bounds (k : Fin (size m+1)) :
    (w.vertex k).1 ≤ half m ∧ (w.vertex k).2 ≤ half m := by
  have h := w.ideal k
  obtain ⟨_,hi,_,hj,_⟩ := h
  simp only [p] at hi hj
  dsimp [half]
  omega

theorem monotone_vertex {k l : Fin (size m+1)} (h : k≤l) :
    (w.vertex k).1≤(w.vertex l).1 ∧ (w.vertex k).2≤(w.vertex l).2 := by
  have main : ∀b : ℕ, ∀hb : b<size m+1, ∀a : ℕ, ∀ha : a≤b,
      (w.vertex ⟨a,by omega⟩).1≤(w.vertex ⟨b,hb⟩).1 ∧
      (w.vertex ⟨a,by omega⟩).2≤(w.vertex ⟨b,hb⟩).2 := by
    intro b
    induction b with
    | zero =>
      intro hb a ha
      have he : a=0 := by omega
      subst a
      exact ⟨le_rfl,le_rfl⟩
    | succ b ih =>
      intro hb a ha
      by_cases he : a=b+1
      · subst a; exact ⟨le_rfl,le_rfl⟩
      · have hh := ih (by omega) a (by omega)
        have hs := w.step ⟨b,by omega⟩
        rcases hs with hs | hs <;> rw [hs] <;> dsimp at * <;> omega
  exact main l.val l.isLt k.val h

/-- The label placed on a horizontal (even) or vertical (odd) step. -/
def label (k : Fin (size m)) : Fin (size m) :=
  if h : (w.vertex ⟨k.val+1,by omega⟩).1 =
      (w.vertex ⟨k.val,by omega⟩).1+1 then
    ⟨2*(w.vertex ⟨k.val,by omega⟩).1,by
      have hb := (w.bounds ⟨k.val+1,by omega⟩).1
      simp only [half] at hb
      simp only [size]
      omega⟩
  else
    ⟨2*(w.vertex ⟨k.val,by omega⟩).2+1,by
      have hs := w.step k
      have hb := (w.bounds ⟨k.val+1,by omega⟩).2
      simp only [half] at hb
      simp only [size]
      rcases hs with hs | hs
      · have hh := congrArg (fun v : ℕ×ℕ => v.1) hs
        exact False.elim (h hh)
      · have hh := congrArg (fun v : ℕ×ℕ => v.2) hs
        omega⟩

/-- Prefix membership is exactly the time of placement, for arbitrary paths. -/
theorem prefix_label (k : Fin (size m+1)) (l : Fin (size m)) :
    Prefix ((w.vertex k).1 : ℤ) ((w.vertex k).2 : ℤ) (w.label l : ℤ) ↔ l.val<k.val := by
  have hs := w.step l
  by_cases ht : l.val<k.val
  · have hm := w.monotone_vertex (k:=⟨l.val+1,by omega⟩) (l:=k) (by change l.val+1≤k.val; omega)
    rcases hs with hs | hs
    · have hx : (w.vertex ⟨l.val+1,by omega⟩).1 =
          (w.vertex ⟨l.val,by omega⟩).1+1 := congrArg (fun v : ℕ×ℕ => v.1) hs
      simp only [label,hx,dite_eq_left,Nat.cast_mul,Nat.cast_ofNat]
      rw [prefix_even_iff]
      exact iff_of_true (by omega) ht
    · have hx := congrArg (fun v : ℕ×ℕ => v.1) hs
      change (w.vertex ⟨l.val+1,by omega⟩).1 =
          (w.vertex ⟨l.val,by omega⟩).1 at hx
      have hy := congrArg (fun v : ℕ×ℕ => v.2) hs
      have hn : ¬(w.vertex ⟨l.val+1,by omega⟩).1 =
          (w.vertex ⟨l.val,by omega⟩).1+1 := by omega
      simp only [label,hn,↓reduceDIte,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one]
      rw [prefix_odd_iff]
      exact iff_of_true (by omega) ht
  · have hm := w.monotone_vertex (k:=k) (l:=⟨l.val,by omega⟩) (by change k.val≤l.val; omega)
    rcases hs with hs | hs
    · have hx := congrArg (fun v : ℕ×ℕ => v.1) hs
      have hx' : (w.vertex ⟨l.val+1,by omega⟩).1 =
          (w.vertex ⟨l.val,by omega⟩).1+1 := hx
      simp only [label,hx',dite_eq_left,Nat.cast_mul,Nat.cast_ofNat]
      rw [prefix_even_iff]
      exact iff_of_false (by omega) ht
    · have hx := congrArg (fun v : ℕ×ℕ => v.1) hs
      have hn : ¬(w.vertex ⟨l.val+1,by omega⟩).1 =
          (w.vertex ⟨l.val,by omega⟩).1+1 := by dsimp at hx; omega
      simp only [label,hn,↓reduceDIte,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one]
      rw [prefix_odd_iff]
      exact iff_of_false (by omega) ht

theorem label_injective : Function.Injective w.label := by
  intro k l he
  by_contra hne
  have hn : k.val≠l.val := fun h => hne (Fin.ext h)
  rcases lt_or_gt_of_ne hn with hlt | hlt
  · have hk := (w.prefix_label ⟨k.val+1,by omega⟩ k).mpr (by change k.val<k.val+1; omega)
    rw [he] at hk
    have hh := (w.prefix_label ⟨k.val+1,by omega⟩ l).mp hk
    change l.val<k.val+1 at hh
    omega
  · have hl := (w.prefix_label ⟨l.val+1,by omega⟩ l).mpr (by change l.val<l.val+1; omega)
    rw [←he] at hl
    have hh := (w.prefix_label ⟨l.val+1,by omega⟩ k).mp hl
    change k.val<l.val+1 at hh
    omega

noncomputable def enumeration : Equiv.Perm (Fin (size m)) :=
  Equiv.ofBijective w.label ⟨w.label_injective,
    (Finite.injective_iff_surjective).mp w.label_injective⟩

noncomputable def toExtension : FamilyExtension m :=
  ⟨w.enumeration.symm,by
    apply (respects_iff_initialIdeals _ _).mpr
    intro k x y hxy hy
    by_cases hk : k≤size m
    · let v : Fin (size m+1) := ⟨k,by omega⟩
      have pref (z : Fin (size m)) :
          Prefix ((w.vertex v).1 : ℤ) ((w.vertex v).2 : ℤ) (z : ℤ) ↔
          (w.enumeration.symm z).val<k := by
        have hh := w.prefix_label v (w.enumeration.symm z)
        have he : w.label (w.enumeration.symm z)=z := w.enumeration.apply_symm_apply z
        simpa only [he] using hh
      have hi := (w.ideal v).2.2.2.2 (x : ℤ) (y : ℤ) hxy ((pref y).mpr hy)
      exact (pref x).mp hi
    · have hb := (w.enumeration.symm x).isLt
      omega⟩

end LatticePath
end OneThird.LatticePaths6

namespace OneThird.LatticePaths6
open Structure LinearExtensions4 ChainPrefixes5
set_option maxHeartbeats 0

theorem chainLabel_injective {m : ℕ} {a b : Fin 2} {r s : Fin (half m)}
    (h : chainLabel m a r = chainLabel m b s) : a=b ∧ r=s := by
  have he := congrArg Fin.val h
  have ha := a.isLt
  have hb := b.isLt
  dsimp [chainLabel] at he
  constructor <;> apply Fin.ext <;> omega

theorem prefixChain_step (m : ℕ) (e : FamilyExtension m) (k : Fin (size m))
    (a : Fin 2) (r : Fin (half m)) (he : e.val (chainLabel m a r)=k) (b : Fin 2) :
    prefixChain m e (k.val+1) b =
      if a=b then insert r (prefixChain m e k.val b) else prefixChain m e k.val b := by
  classical
  ext s
  simp only [prefixChain,Finset.mem_filter,Finset.mem_univ,true_and]
  by_cases hab : a=b
  · subst b
    rw [ite_eq_left rfl,Finset.mem_insert]
    simp only [Finset.mem_filter,Finset.mem_univ,true_and]
    constructor
    · intro h
      by_cases hlt : (e.val (chainLabel m a s)).val<k.val
      · exact Or.inr hlt
      · left
        have heq : e.val (chainLabel m a s)=e.val (chainLabel m a r) := by
          apply Fin.ext
          rw [he]
          omega
        exact (chainLabel_injective (e.val.injective heq)).2
    · rintro (rfl | h)
      · rw [he]; omega
      · omega
  · rw [ite_eq_right hab]
    simp only [Finset.mem_filter,Finset.mem_univ,true_and]
    constructor
    · intro h
      by_contra hn
      have heq : e.val (chainLabel m b s)=e.val (chainLabel m a r) := by
        apply Fin.ext
        rw [he]
        omega
      exact hab ((chainLabel_injective (e.val.injective heq)).1.symm)
    · omega

theorem prefixChain_step_card (m : ℕ) (e : FamilyExtension m) (k : Fin (size m))
    (a : Fin 2) (r : Fin (half m)) (he : e.val (chainLabel m a r)=k) (b : Fin 2) :
    (prefixChain m e (k.val+1) b).card =
      (prefixChain m e k.val b).card + if a=b then 1 else 0 := by
  classical
  rw [prefixChain_step m e k a r he b]
  by_cases hab : a=b
  · subst b
    have hn : r∉prefixChain m e k.val a := by simp [prefixChain,he]
    simp [hn]
  · simp [hab]

/-- The forward construction uses precisely the two parity-prefix counts
from result5. -/
def ofExtension (m : ℕ) (e : FamilyExtension m) : LatticePath m where
  vertex k := ((prefixChain m e k.val 0).card,(prefixChain m e k.val 1).card)
  start := by simp [prefixChain]
  finish := by
    have h (a : Fin 2) : prefixChain m e (size m) a = Finset.univ := by
      ext r
      simp only [prefixChain,Finset.mem_filter,Finset.mem_univ,true_and,iff_true]
      exact (e.val (chainLabel m a r)).isLt
    simp [h,half]
  ideal k := rank_prefix_orderIdeal m e k.val
  step k := by
    obtain ⟨a,r,hr⟩ := label_surjective m (e.val.symm k)
    have he : e.val (chainLabel m a r)=k := by rw [hr]; exact e.val.apply_symm_apply k
    have h0 := prefixChain_step_card m e k a r he 0
    have h1 := prefixChain_step_card m e k a r he 1
    fin_cases a
    · left
      exact Prod.ext (by simpa using h0) (by simpa using h1)
    · right
      exact Prod.ext (by simpa using h0) (by simpa using h1)

end OneThird.LatticePaths6

namespace OneThird.LatticePaths6
open Structure LinearExtensions4 ChainPrefixes5
set_option maxHeartbeats 0

namespace LatticePath
variable {m : ℕ}

@[ext] theorem ext {v w : LatticePath m} (h : v.vertex=w.vertex) : v=w := by
  cases v
  cases w
  cases h
  rfl

theorem toExtension_prefix (w : LatticePath m) (k : Fin (size m+1))
    (x : Fin (size m)) :
    Prefix ((w.vertex k).1 : ℤ) ((w.vertex k).2 : ℤ) (x : ℤ) ↔
      ((w.toExtension).val x).val<k.val := by
  have hh := w.prefix_label k (w.enumeration.symm x)
  have he : w.label (w.enumeration.symm x)=x := w.enumeration.apply_symm_apply x
  simpa only [he,toExtension] using hh

theorem prefixChain_toExtension (w : LatticePath m) (k : Fin (size m+1)) :
    (prefixChain m w.toExtension k.val 0).card=(w.vertex k).1 ∧
    (prefixChain m w.toExtension k.val 1).card=(w.vertex k).2 := by
  classical
  have he : prefixChain m w.toExtension k.val 0 =
      Finset.univ.filter (fun r : Fin (half m) => r.val<(w.vertex k).1) := by
    ext r
    simp only [prefixChain,Finset.mem_filter,Finset.mem_univ,true_and]
    rw [←w.toExtension_prefix k]
    simpa [chainLabel] using prefix_even_iff (w.vertex k).1 (w.vertex k).2 r.val
  have ho : prefixChain m w.toExtension k.val 1 =
      Finset.univ.filter (fun r : Fin (half m) => r.val<(w.vertex k).2) := by
    ext r
    simp only [prefixChain,Finset.mem_filter,Finset.mem_univ,true_and]
    rw [←w.toExtension_prefix k]
    simpa [chainLabel] using prefix_odd_iff (w.vertex k).1 (w.vertex k).2 r.val
  rw [he,ho,Fin.card_filter_val_lt,Fin.card_filter_val_lt,
    min_eq_right (w.bounds k).1,min_eq_right (w.bounds k).2]
  exact ⟨rfl,rfl⟩

theorem ofExtension_toExtension (w : LatticePath m) :
    ofExtension m w.toExtension=w := by
  apply LatticePath.ext
  funext k
  exact Prod.ext (w.prefixChain_toExtension k).1 (w.prefixChain_toExtension k).2

end LatticePath

theorem toExtension_ofExtension (m : ℕ) (e : FamilyExtension m) :
    (ofExtension m e).toExtension=e := by
  apply Subtype.ext
  apply Equiv.ext
  intro x
  apply Fin.ext
  have hh (k : Fin (size m+1)) :
      (((ofExtension m e).toExtension).val x).val<k.val ↔ (e.val x).val<k.val := by
    rw [←(ofExtension m e).toExtension_prefix k]
    exact (rank_prefix_rectangle m e k.val x).symm
  have ha := (hh ⟨(e.val x).val+1,by have hh := (e.val x).isLt; change (e.val x).val+1 < 108+20*m+1; omega⟩).mpr (by simp)
  have hb := (hh ⟨(((ofExtension m e).toExtension).val x).val+1,
    by have := (((ofExtension m e).toExtension).val x).isLt; omega⟩).mp (by simp)
  change (((ofExtension m e).toExtension).val x).val < (e.val x).val+1 at ha
  change (e.val x).val < (((ofExtension m e).toExtension).val x).val+1 at hb
  omega

/-- The actual family-order linear extensions are in bijection with unit-step
lattice paths through its order-ideal grid, for every natural parameter. -/
noncomputable def extensionPathEquiv (m : ℕ) : FamilyExtension m ≃ LatticePath m where
  toFun := ofExtension m
  invFun := LatticePath.toExtension
  left_inv := toExtension_ofExtension m
  right_inv := LatticePath.ofExtension_toExtension

end OneThird.LatticePaths6
