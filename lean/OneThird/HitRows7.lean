module
public import OneThird.HitCounts7
public import OneThird.RowCounts7
public import OneThird.InfiniteDominance5
public import OneThird.FiniteGrid4
@[expose] public section
namespace OneThird.HitRows7
open Matrix Structure WalkCounting7 GridCounts7 RowCounts7 HitCounts7
set_option maxHeartbeats 0
attribute [local instance] Classical.propDecidable

noncomputable def qvalue (m a b i : ℕ) (j : ℤ) : ℤ :=
  if 0≤j then (Q m a b i j.toNat : ℤ) else 0
@[simp] theorem qvalue_nat (m a b i j : ℕ) : qvalue m a b i (j : ℤ)=(Q m a b i j : ℤ) := by
  simp [qvalue]
theorem qvalue_invalid (m a b i : ℕ) (j : ℤ) (h : ¬LocalValid m (i : ℤ) j) :
    qvalue m a b i j=0 := by
  by_cases hj : 0≤j
  · lift j to ℕ using hj
    rw [qvalue_nat,Q_invalid m a b i j h]
    rfl
  · simp [qvalue,hj]
theorem qvalue_low (m a b i : ℕ) (j : ℤ) (h : j-(i : ℤ)< -3) : qvalue m a b i j=0 := by
  apply qvalue_invalid
  intro hv
  exact (not_lt_of_ge hv.2.2.2.2.1) h
theorem qvalue_high (m a b i : ℕ) (j : ℤ) (h : 2<j-(i : ℤ)) : qvalue m a b i j=0 := by
  apply qvalue_invalid
  intro hv
  exact (not_lt_of_ge hv.2.2.2.2.2.1) h
theorem qvalue_after (m a b i : ℕ) (j : ℤ) (h : a < i) : qvalue m a b i j=0 := by
  unfold qvalue
  split_ifs
  · rw [Q_after m a b i j.toNat h]; rfl
  · rfl

theorem qvalue_step (m a b i : ℕ) (j : ℤ) (hi : i≤a) (ha : a<pNat m) :
    qvalue m a b i j=if LocalValid m (i : ℤ) j then
      (if i=a ∧ j≤(b : ℤ) then value m (i+1) j else qvalue m a b (i+1) j)+
        qvalue m a b i (j+1) else 0 := by
  by_cases hj : 0≤j
  · lift j to ℕ using hj
    have hh := Q_step m a b i j hi ha
    rw [show (j : ℤ)+1=((j+1 : ℕ) : ℤ) by omega,qvalue_nat]
    simp only [qvalue_nat,value_nat]
    split_ifs with hv hc
    · have he : i=a ∧ j≤b := by exact_mod_cast hc
      have hh' : Q m a b i j=G m (i+1) j+Q m a b i (j+1) := by
        simpa only [Allowed,ite_eq_left hv,ite_eq_left he] using hh
      exact_mod_cast hh'
    · have he : ¬(i=a ∧ j≤b) := by exact_mod_cast hc
      have hh' : Q m a b i j=Q m a b (i+1) j+Q m a b i (j+1) := by
        simpa only [Allowed,ite_eq_left hv,ite_eq_right he] using hh
      exact_mod_cast hh'
    · exact_mod_cast Q_invalid m a b i j hv
  · have hv : ¬LocalValid m (i : ℤ) j := fun h => hj h.2.2.1
    simp [qvalue,hj,hv]

noncomputable def qrow (m a b r : ℕ) : Matrix (Fin 6) (Fin 1) ℤ :=
  fun d _ => qvalue m a b r ((r : ℤ)+(d : ℤ)-3)
noncomputable def exit (m a b : ℕ) : Matrix (Fin 6) (Fin 1) ℤ :=
  fun d _ => if ((a+1 : ℕ) : ℤ)+(d : ℤ)-3≤(b : ℤ) then row m (a+1) d 0 else 0

theorem qrow_bottom (m a b r : ℕ) (hr : r≤a) (ha : a<pNat m) :
    qrow m a b r 0 0=if (0 : Fin 6)∈rowMask m r then qrow m a b r 1 0 else 0 := by
  have hh := qvalue_step m a b r ((r : ℤ)-3) hr ha
  have hq := qvalue_low m a b (r+1) ((r : ℤ)-3) (by omega)
  have hg := value_low m (r+1) ((r : ℤ)-3) (by omega)
  simp only [hq,hg,ite_self,zero_add] at hh
  have he : (r : ℤ)-3+1=(r : ℤ)+1-3 := by ring
  rw [he] at hh
  simpa only [qrow,rowMask,Finset.mem_filter,Finset.mem_univ,true_and,
    Fin.val_zero,Fin.val_one,Nat.cast_zero,Nat.cast_one,add_zero] using hh

theorem qrow_cell (m a b r : ℕ) (hr : r≤a) (ha : a<pNat m) (d : Fin 5) :
    qrow m a b r d.succ 0=if d.succ∈rowMask m r then
      (if r=a then exit m a b else qrow m a b (r+1)) d.castSucc 0+
      (if h : d.val+2<6 then qrow m a b r ⟨d.val+2,h⟩ 0 else 0) else 0 := by
  let j : ℤ := (r : ℤ)+(d.succ : ℤ)-3
  have hv : qvalue m a b r (j+1)=
      (if h : d.val+2<6 then qrow m a b r ⟨d.val+2,h⟩ 0 else 0) := by
    split_ifs with h
    · unfold qrow
      congr 1
      dsimp [j]
      ring
    · apply qvalue_high
      dsimp [j]
      have hd := d.isLt
      omega
  have hj : ((r+1 : ℕ) : ℤ)+(d.castSucc : ℤ)-3=j := by dsimp [j]; ring
  have hh : (if r=a then exit m a b else qrow m a b (r+1)) d.castSucc 0=
      if r=a ∧ j≤(b : ℤ) then value m (r+1) j else qvalue m a b (r+1) j := by
    by_cases he : r=a
    · subst r
      rw [ite_eq_left rfl,qvalue_after m a b (a+1) j (by omega)]
      simp only [exit,RowCounts7.row,hj,true_and]
    · rw [ite_eq_right he,ite_eq_right (fun h => he h.1)]
      exact congrArg (qvalue m a b (r+1)) hj
  change qvalue m a b r j=_
  rw [←hv,hh]
  simpa only [rowMask,Finset.mem_filter,Finset.mem_univ,true_and] using qvalue_step m a b r j hr ha

theorem qrow_scan (m a b r : ℕ) (hr : r≤a) (ha : a<pNat m) :
    qrow m a b r=scan (rowMask m r) (if r=a then exit m a b else qrow m a b (r+1)) :=
  scan_unique _ _ _ (qrow_bottom m a b r hr ha) (qrow_cell m a b r hr ha)

theorem qrow_transfer (m a b r : ℕ) (hr : r≤a) (ha : a<pNat m) :
    qrow m a b r=transfer (rows m r (a+1-r))*exit m a b := by
  have main : ∀n r, r+n=a+1 → 0<n → qrow m a b r=transfer (rows m r n)*exit m a b := by
    intro n
    induction n with
    | zero => intros; omega
    | succ n ih =>
      intro r hsum hn
      rw [qrow_scan m a b r (by omega) ha,rows_cons]
      have ht : transfer (rowMask m r :: rows m (r+1) n)=
          rowMatrix (rowMask m r)*transfer (rows m (r+1) n) := by simp [transfer]
      rw [ht,Matrix.mul_assoc,rowMatrix_scan]
      by_cases hz : n=0
      · subst n
        have he : r=a := by omega
        rw [ite_eq_left he]
        simp [rows,transfer]
      · rw [ite_eq_right (by omega : r≠a),ih (r+1) (by omega) (by omega)]
  exact main _ _ (by omega) (by omega)

theorem clip_event (S : Mask) (d : Fin 7) (w : Matrix (Fin 6) (Fin 1) ℤ) :
    eventRow S ((d.val : ℤ)-3)*w=
      rowMatrix S*(show Matrix (Fin 6) (Fin 1) ℤ from fun e c => if e.val<d.val then w e c else 0) := by
  ext i c
  change (∑ e, eventRow S ((d.val : ℤ)-3) i e*w e c)=
    ∑ e, rowMatrix S i e*(if e.val<d.val then w e c else 0)
  apply Finset.sum_congr rfl
  intro e _
  have he : ((e.val : ℤ)<(d.val : ℤ)-3+3) ↔ e.val<d.val := by omega
  simp only [eventRow,he]
  split_ifs <;> simp

theorem exit_clip (m a b : ℕ) : exit m a b=
    fun e c => if e.val<(FiniteGrid4.cutoff (a+1) (b+1)).val then
      RowCounts7.row m (a+1) e c else 0 := by
  ext e c
  have hc : c=0 := Subsingleton.elim _ _
  subst c
  have he : (((a+1 : ℕ) : ℤ)+(e : ℤ)-3≤(b : ℤ)) ↔
      e.val<(FiniteGrid4.cutoff (a+1) (b+1)).val := by
    have hb := e.isLt
    simp only [FiniteGrid4.cutoff]
    omega
  simp only [exit,he]

theorem qrow_zero_transfer (m a b : ℕ) (ha : a<pNat m) :
    qrow m a b 0=transfer (rows m 0 a)*
      eventRow (rowMask m a) (((FiniteGrid4.cutoff (a+1) (b+1)).val : ℤ)-3)*
      RowCounts7.row m (a+1) := by
  rw [qrow_transfer m a b 0 (by omega) ha]
  simp only [Nat.sub_zero]
  rw [rows_add,transfer_append]
  have ht : transfer (rows m (0+a) 1)=rowMatrix (rowMask m a) := by simp [rows,transfer]
  rw [ht,Matrix.mul_assoc,exit_clip,←clip_event,Matrix.mul_assoc]

theorem full_take (m a : ℕ) (ha : a≤55+10*m) :
    (rows m 0 (55+10*m)).take a=rows m 0 a := by
  have hh : 55+10*m=a+(55+10*m-a) := by omega
  conv_lhs => rw [hh,rows_add]
  have hl : (rows m 0 a).length=a := by simp [rows]
  simpa only [hl] using (List.take_left (l₁ := rows m 0 a) (l₂ := rows m (0+a) (55+10*m-a)))

theorem full_drop (m a : ℕ) (ha : a≤55+10*m) :
    (rows m 0 (55+10*m)).drop a=rows m a (55+10*m-a) := by
  have hh : 55+10*m=a+(55+10*m-a) := by omega
  conv_lhs => rw [hh,rows_add]
  have hl : (rows m 0 a).length=a := by simp [rows]
  simpa only [hl,Nat.zero_add] using (List.drop_left (l₁ := rows m 0 a) (l₂ := rows m (0+a) (55+10*m-a)))

/-- The full numerical event bridge: actual extension-event cardinalities
are the very transfer crossings bounded by the spectral certificates. -/
theorem H_eq_crossing (m : ℕ) (i j : Fin (pNat m)) :
    (Counting6.H m i j : ℤ)=InfiniteDominance5.crossing m i.val
      (FiniteGrid4.cutoff (i.val+1) (j.val+1)) := by
  have ha : i.val<pNat m := i.isLt
  have hp : pNat m+1=55+10*m := by dsimp [pNat,LatticePaths6.half]; omega
  have hq := qrow_zero_transfer m i.val j.val ha
  rw [row_pathDP m (i.val+1) (by omega),pathDP_eq_transfer,hp] at hq
  have he := congrArg (fun w : Matrix (Fin 6) (Fin 1) ℤ => w 3 0) hq
  rw [HitCounts7.H_eq_Q]
  change qrow m i.val j.val 0 3 0=_
  rw [he]
  simp only [InfiniteDominance5.crossing,full_take m i.val (by omega),
    full_drop m (i.val+1) (by omega)]
  rw [←Matrix.mul_assoc]
  simp [TransferCache5.select3,TransferCache5.select2,basisCol,Matrix.mul_apply]

end OneThird.HitRows7
