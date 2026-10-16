module
public import OneThird.HitRows7
public import OneThird.FiniteLinks4
@[expose] public section
namespace OneThird.FiniteTransfer7
open Matrix Structure GridCounts7 RowCounts7 HitRows7 FiniteGrid4
set_option maxHeartbeats 0

/-- Additional, kernel-checked matrix bindings for the existing result4
finite DP tables. The event field binds to those same checked tables. -/
structure Checked (m : Fin 8) where
  pref : Fin (55+10*m.val) → Matrix (Fin 1) (Fin 6) ℤ
  suff : Fin (56+10*m.val) → Matrix (Fin 6) (Fin 1) ℤ
  initial : pref 0=basisRow 3
  terminal : suff ⟨55+10*m.val,by omega⟩=basisCol 2
  forward : ∀r : Fin (54+10*m.val),
    pref ⟨r.val+1,by omega⟩=pref ⟨r.val,by omega⟩*rowMatrix (rowMask m.val r.val)
  backward : ∀r : Fin (55+10*m.val),
    suff ⟨r.val,by omega⟩=rowMatrix (rowMask m.val r.val)*suff ⟨r.val+1,by omega⟩
  event : ∀r : Fin (54+10*m.val), ∀d : Fin 7,
    (pref ⟨r.val,by omega⟩*eventRow (rowMask m.val r.val) ((d.val : ℤ)-3)*suff ⟨r.val+1,by omega⟩) 0 0=
      (eventCount (verified m).f (verified m).g (r.val+1) d : ℤ)

theorem prefix_transfer {m : Fin 8} (c : Checked m) (r : Fin (55+10*m.val)) :
    c.pref r=basisRow 3*transfer (rows m.val 0 r.val) := by
  have main : ∀r : ℕ, ∀hr : r<55+10*m.val,
      c.pref ⟨r,hr⟩=basisRow 3*transfer (rows m.val 0 r) := by
    intro r
    induction r with
    | zero => intro hr; simpa [rows,transfer] using c.initial
    | succ r ih =>
      intro hr
      have h := c.forward ⟨r,by omega⟩
      change c.pref ⟨r+1,hr⟩=c.pref ⟨r,by omega⟩*rowMatrix (rowMask m.val r) at h
      rw [h,ih (by omega),rows_add,transfer_append]
      simp [rows,transfer,Matrix.mul_assoc]
  exact main r.val r.isLt

theorem suffix_transfer {m : Fin 8} (c : Checked m) (r : Fin (56+10*m.val)) :
    c.suff r=transfer (rows m.val r.val (55+10*m.val-r.val))*basisCol 2 := by
  have main : ∀n r, r+n=55+10*m.val → ∀hr : r<56+10*m.val,
      c.suff ⟨r,hr⟩=transfer (rows m.val r n)*basisCol 2 := by
    intro n
    induction n with
    | zero =>
      intro r he hr
      have he' : r=55+10*m.val := by omega
      subst r
      simpa [rows,transfer] using c.terminal
    | succ n ih =>
      intro r he hr
      have h := c.backward ⟨r,by omega⟩
      change c.suff ⟨r,hr⟩=rowMatrix (rowMask m.val r)*c.suff ⟨r+1,by omega⟩ at h
      rw [h,ih (r+1) (by omega) (by omega),rows_cons]
      simp [transfer,Matrix.mul_assoc]
  exact main _ r.val (by omega) r.isLt

theorem crossing_eq_event {m : Fin 8} (c : Checked m) (r : Fin (54+10*m.val)) (d : Fin 7) :
    InfiniteDominance5.crossing m.val r.val d=
      (eventCount (verified m).f (verified m).g (r.val+1) d : ℤ) := by
  rw [←c.event r d,prefix_transfer,suffix_transfer]
  simp only [InfiniteDominance5.crossing,full_take m.val r.val (by omega),
    full_drop m.val (r.val+1) (by omega)]
  rw [←Matrix.mul_assoc]
  simp [TransferCache5.select3,TransferCache5.select2,basisRow,basisCol,Matrix.mul_apply]

end OneThird.FiniteTransfer7
