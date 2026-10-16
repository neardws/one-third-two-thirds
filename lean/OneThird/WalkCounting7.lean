module
public import OneThird.Counting6
public import Mathlib.Basic.Finite.Sum
public import Mathlib.Basic.Finite.Prod
@[expose] public section
namespace OneThird.WalkCounting7
open Structure LinearExtensions4 LatticePaths6 Counting6
set_option maxHeartbeats 0
abbrev Grid := ℕ × ℕ
def right (x : Grid) : Grid := (x.1+1,x.2)
def up (x : Grid) : Grid := (x.1,x.2+1)

/-- A finite recursive path type with a prescribed number of steps. -/
def Walk (V : Grid → Prop) (y : Grid) : ℕ → Grid → Type
  | 0,x => PLift (x=y ∧ V x)
  | n+1,x => PLift (V x) × (Walk V y n (right x) ⊕ Walk V y n (up x))

instance walk_finite (V : Grid → Prop) (y : Grid) (n : ℕ) (x : Grid) :
    Finite (Walk V y n x) := by
  induction n generalizing x with
  | zero => exact inferInstanceAs (Finite (PLift _))
  | succ n ih =>
    let := ih (right x)
    let := ih (up x)
    exact inferInstanceAs (Finite (PLift _ × (_ ⊕ _)))

structure VertexPath (V : Grid → Prop) (n : ℕ) (x y : Grid) where
  vertex : Fin (n+1) → Grid
  start : vertex 0=x
  finish : vertex (Fin.last n)=y
  valid : ∀k,V (vertex k)
  step : ∀k : Fin n, vertex k.succ=right (vertex k.castSucc) ∨
    vertex k.succ=up (vertex k.castSucc)

namespace VertexPath
variable {V : Grid → Prop} {n : ℕ} {x y : Grid}
@[ext] theorem ext {v w : VertexPath V n x y} (h : v.vertex=w.vertex) : v=w := by
  cases v
  cases w
  cases h
  rfl

def tail (w : VertexPath V (n+1) x y) (z : Grid) (h : w.vertex 1=z) :
    VertexPath V n z y where
  vertex k := w.vertex k.succ
  start := h
  finish := w.finish
  valid k := w.valid k.succ
  step k := by simpa only [Fin.castSucc_succ] using w.step k.succ

def prependRight (hx : V x) (w : VertexPath V n (right x) y) :
    VertexPath V (n+1) x y where
  vertex := Fin.cases x w.vertex
  start := rfl
  finish := by
    change Fin.cases x w.vertex (Fin.last n).succ=y
    rw [Fin.cases_succ]
    exact w.finish
  valid := Fin.cases hx w.valid
  step := by
    intro k
    refine Fin.cases ?_ (fun l => ?_) k
    · left
      change Fin.cases x w.vertex (Fin.succ 0)=right x
      rw [Fin.cases_succ]
      exact w.start
    · simpa only [Fin.castSucc_succ,Fin.cases_succ] using w.step l

def prependUp (hx : V x) (w : VertexPath V n (up x) y) :
    VertexPath V (n+1) x y where
  vertex := Fin.cases x w.vertex
  start := rfl
  finish := by
    change Fin.cases x w.vertex (Fin.last n).succ=y
    rw [Fin.cases_succ]
    exact w.finish
  valid := Fin.cases hx w.valid
  step := by
    intro k
    refine Fin.cases ?_ (fun l => ?_) k
    · right
      change Fin.cases x w.vertex (Fin.succ 0)=up x
      rw [Fin.cases_succ]
      exact w.start
    · simpa only [Fin.castSucc_succ,Fin.cases_succ] using w.step l

noncomputable def branches (w : VertexPath V (n+1) x y) :
    PLift (V x) × (VertexPath V n (right x) y ⊕ VertexPath V n (up x) y) := by
  classical
  refine ⟨⟨by simpa only [w.start] using w.valid 0⟩,?_⟩
  by_cases h : w.vertex 1=right x
  · exact .inl (w.tail (right x) h)
  · have hs := w.step 0
    simp only [Fin.succ_zero_eq_one,Fin.castSucc_zero,w.start] at hs
    exact .inr (w.tail (up x) (hs.resolve_left h))

def fromBranches (w : PLift (V x) ×
    (VertexPath V n (right x) y ⊕ VertexPath V n (up x) y)) : VertexPath V (n+1) x y :=
  match w.2 with
  | .inl p => prependRight w.1.down p
  | .inr p => prependUp w.1.down p

theorem tail_prependRight (hx : V x) (w : VertexPath V n (right x) y) :
    (prependRight hx w).tail (right x) (by exact w.start)=w := by
  apply VertexPath.ext
  funext k
  rfl

theorem tail_prependUp (hx : V x) (w : VertexPath V n (up x) y) :
    (prependUp hx w).tail (up x) (by exact w.start)=w := by
  apply VertexPath.ext
  funext k
  rfl

theorem from_branches (w : VertexPath V (n+1) x y) : fromBranches w.branches=w := by
  classical
  unfold branches
  split_ifs with h
  all_goals
    apply VertexPath.ext
    funext k
    refine Fin.cases ?_ (fun l => ?_) k
    · exact w.start.symm
    · rfl

theorem branches_from (w : PLift (V x) ×
    (VertexPath V n (right x) y ⊕ VertexPath V n (up x) y)) :
    (fromBranches w).branches=w := by
  classical
  rcases w with ⟨⟨hx⟩,w | w⟩
  · have hh : (prependRight hx w).vertex 1=right x := w.start
    simp only [fromBranches,branches,hh,↓reduceDIte,tail_prependRight]
  · have hh : ¬(prependUp hx w).vertex 1=right x := by
      change ¬w.vertex 0=right x
      rw [w.start]
      simp [right,up]
    simp only [fromBranches,branches,hh,↓reduceDIte,tail_prependUp]

noncomputable def branchEquiv : VertexPath V (n+1) x y ≃
    PLift (V x) × (VertexPath V n (right x) y ⊕ VertexPath V n (up x) y) where
  toFun := branches
  invFun := fromBranches
  left_inv := from_branches
  right_inv := branches_from

end VertexPath

noncomputable def zeroEquiv (V : Grid → Prop) (x y : Grid) :
    Walk V y 0 x ≃ VertexPath V 0 x y where
  toFun h := ⟨fun _ => x,rfl,h.down.1,fun _ => h.down.2,fun k => Fin.elim0 k⟩
  invFun w := ⟨⟨w.start.symm.trans w.finish,by simpa only [w.start] using w.valid 0⟩⟩
  left_inv _ := rfl
  right_inv w := by
    apply VertexPath.ext
    funext k
    have hk : k=0 := Fin.ext (by have := k.isLt; omega)
    subst k
    exact w.start.symm

noncomputable def walkVertexEquiv (V : Grid → Prop) (y : Grid) :
    ∀n x, Walk V y n x ≃ VertexPath V n x y
  | 0,x => zeroEquiv V x y
  | n+1,x =>
      (Equiv.prodCongr (Equiv.refl (PLift (V x)))
        (Equiv.sumCongr (walkVertexEquiv V y n (right x))
          (walkVertexEquiv V y n (up x)))).trans VertexPath.branchEquiv.symm

def Allowed (m : ℕ) (x : Grid) : Prop := LocalValid m (x.1 : ℤ) (x.2 : ℤ)

theorem allowed_iff_ideal (m : ℕ) (x : Grid) :
    Allowed m x ↔ OrderIdeal m (x.1 : ℤ) (x.2 : ℤ) :=
  ((valid_iff_local m _ _).symm.trans (orderIdeal_iff_valid m _ _).symm)

def latticeVertexEquiv (m : ℕ) : LatticePath m ≃
    VertexPath (Allowed m) (size m) (0,0) (half m,half m) where
  toFun w := ⟨w.vertex,w.start,w.finish,fun k => (allowed_iff_ideal m _).mpr (w.ideal k),w.step⟩
  invFun w := ⟨w.vertex,w.start,w.finish,fun k => (allowed_iff_ideal m _).mp (w.valid k),w.step⟩
  left_inv _ := rfl
  right_inv _ := rfl

/-- A proved cardinality bridge to a genuinely recursive path type. -/
theorem extension_card_eq_walk (m : ℕ) : Nat.card (FamilyExtension m)=
    Nat.card (Walk (Allowed m) (half m,half m) (size m) (0,0)) := by
  rw [extension_card_eq_path_card]
  exact Nat.card_congr ((latticeVertexEquiv m).trans (walkVertexEquiv _ _ _ _).symm)

end OneThird.WalkCounting7
