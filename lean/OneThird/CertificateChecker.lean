module
public import OneThird.MatrixBounds

@[expose] public section
namespace OneThird.CertificateChecker
open Matrix MatrixBounds
set_option maxHeartbeats 0
set_option maxRecDepth 100000

/-- Integer endpoint arithmetic circuits. Every multiplication checkpoint carries
kernel-checked equalities, so generated caches are witnesses, never oracles. -/
structure Circuit (tl th : ZMat) where
  lo : ZMat
  hi : ZMat
  nonneg : MatrixBounds.Nonneg lo
  value : (ℕ → RMat) → RMat
  sound : ∀env, (∀k, Encloses tl th (env k)) → Encloses lo hi (value env)

noncomputable def fixed (tl th a : ZMat) (hn : MatrixBounds.Nonneg a) : Circuit tl th where
  lo := a
  hi := a
  nonneg := hn
  value := fun _ => cast a
  sound := fun _ _ => cast_encloses a

noncomputable def input (tl th : ZMat) (hn : MatrixBounds.Nonneg tl) (k : ℕ) : Circuit tl th where
  lo := tl
  hi := th
  nonneg := hn
  value := fun env => env k
  sound := fun _ h => h k

noncomputable def checkpoint {tl th : ZMat} (a b : Circuit tl th) (lo hi : ZMat)
    (hl : lo=a.lo*b.lo) (hh : hi=a.hi*b.hi) : Circuit tl th where
  lo := lo
  hi := hi
  nonneg := by rw [hl]; exact nonneg_mul a.nonneg b.nonneg
  value := fun env => a.value env*b.value env
  sound := by
    intro env h
    rw [hl,hh]
    exact mul_sound a.nonneg b.nonneg (a.sound env h) (b.sound env h)

def cut (a : ZMat) (d : ℕ) : ZMat := fun i j => if j.val<d then a i j else 0

theorem cut_nonneg (a : ZMat) (hn : MatrixBounds.Nonneg a) (d : ℕ) : MatrixBounds.Nonneg (cut a d) := by
  intro i j
  simp only [cut]
  split <;> first | exact hn i j | exact le_rfl

/-- A cell case stores exact enclosure circuits, the actual rowMap row matrix,
and proofs of all seven cutoff inequalities, with explicit endpoint exclusions. -/
structure Cell (tl th : ZMat) where
  left : Circuit tl th
  right : Circuit tl th
  rowMap : ZMat
  nonneg : MatrixBounds.Nonneg rowMap
  excluded : Finset (Fin 7)
  checked : ∀d : Fin 7, d ∉ excluded →
    separates (((left.lo*cut rowMap d)*right.lo) 3 2)
      (((left.hi*cut rowMap d)*right.hi) 3 2)
      (((left.lo*rowMap)*right.lo) 3 2)
      (((left.hi*rowMap)*right.hi) 3 2)

noncomputable def eventValue {tl th : ZMat} (c : Cell tl th)
    (env : ℕ → RMat) (d : Fin 7) : ℝ :=
  ((c.left.value env * cast (cut c.rowMap d)) * c.right.value env) 3 2
noncomputable def totalValue {tl th : ZMat} (c : Cell tl th) (env : ℕ → RMat) : ℝ :=
  ((c.left.value env * cast c.rowMap) * c.right.value env) 3 2

theorem cell_sound {tl th : ZMat} (c : Cell tl th) (env : ℕ → RMat)
    (henv : ∀k, Encloses tl th (env k)) (d : Fin 7) (hd : d ∉ c.excluded) :
    0<totalValue c env ∧
    (eventValue c env d / totalValue c env < (3486 : ℝ)/10000 ∨
      1-eventValue c env d / totalValue c env < (3486 : ℝ)/10000) := by
  have hl := c.left.sound env henv
  have hr := c.right.sound env henv
  have hf := mul_sound (nonneg_mul c.left.nonneg c.nonneg) c.right.nonneg
    (mul_sound c.left.nonneg c.nonneg hl (cast_encloses c.rowMap)) hr
  have he := mul_sound (nonneg_mul c.left.nonneg (cut_nonneg c.rowMap c.nonneg d)) c.right.nonneg
    (mul_sound c.left.nonneg (cut_nonneg c.rowMap c.nonneg d) hl (cast_encloses (cut c.rowMap d))) hr
  exact separates_sound (c.checked d hd) (he 3 2) (hf 3 2)

end OneThird.CertificateChecker
