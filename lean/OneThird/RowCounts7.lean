module
public import OneThird.GridCounts7
@[expose] public section
namespace OneThird.RowCounts7
open Structure LinearExtensions4 LatticePaths6 Counting6 WalkCounting7 GridCounts7
set_option maxHeartbeats 0

noncomputable def row (m r : ℕ) : Matrix (Fin 6) (Fin 1) ℤ :=
  fun d _ => value m r ((r : ℤ)+(d : ℤ)-3)

theorem value_invalid (m i : ℕ) (j : ℤ) (h : ¬LocalValid m (i : ℤ) j) : value m i j=0 := by
  have hh := value_step m i j
  simpa only [ite_eq_right h] using hh

theorem value_low (m i : ℕ) (j : ℤ) (h : j-(i : ℤ)< -3) : value m i j=0 := by
  apply value_invalid
  intro hv
  exact (not_lt_of_ge hv.2.2.2.2.1) h

theorem value_high (m i : ℕ) (j : ℤ) (h : 2<j-(i : ℤ)) : value m i j=0 := by
  apply value_invalid
  intro hv
  exact (not_lt_of_ge hv.2.2.2.2.2.1) h

theorem value_out_row (m i : ℕ) (j : ℤ) (h : pNat m < i) : value m i j=0 := by
  apply value_invalid
  intro hv
  have hb := hv.2.1
  dsimp [p,pNat,LatticePaths6.half] at *
  omega

theorem value_out_col (m i : ℕ) (j : ℤ) (h : (pNat m : ℤ) < j) : value m i j=0 := by
  apply value_invalid
  intro hv
  have hb := hv.2.2.2.1
  dsimp [p,pNat,LatticePaths6.half] at *
  omega

theorem value_nonterminal (m i : ℕ) (j : ℤ)
    (ht : ¬(i=pNat m ∧ j=(pNat m : ℤ))) :
    value m i j=if LocalValid m (i : ℤ) j then value m (i+1) j+value m i (j+1) else 0 := by
  have hh := value_step m i j
  simpa only [ite_eq_right ht] using hh

theorem scan_unique (S : Mask) (w z : Matrix (Fin 6) (Fin 1) ℤ)
    (h0 : z 0 0=if (0 : Fin 6)∈S then z 1 0 else 0)
    (hs : ∀d : Fin 5, z d.succ 0=if d.succ∈S then w d.castSucc 0+
      (if h : d.val+2<6 then z ⟨d.val+2,h⟩ 0 else 0) else 0) : z=scan S w := by
  have h1 := hs 0
  have h2 := hs 1
  have h3 := hs 2
  have h4 := hs 3
  have h5 := hs 4
  clear hs
  norm_num at h1 h2 h3 h4 h5
  ext d c
  fin_cases c
  fin_cases d <;> simp_all [scan]

theorem row_bottom (m r : ℕ) (_hr : r≤pNat m) :
    row m r 0 0=if (0 : Fin 6)∈rowMask m r then row m r 1 0 else 0 := by
  have ht : ¬(r=pNat m ∧ (r : ℤ)+(0 : Fin 6)-3=(pNat m : ℤ)) := by
    simp only [Fin.val_zero,Nat.cast_zero]
    omega
  have hh := value_nonterminal m r ((r : ℤ)+(0 : Fin 6)-3) ht
  have hz := value_low m (r+1) ((r : ℤ)+(0 : Fin 6)-3) (by norm_num; omega)
  have hz' : value m (r+1) ((r : ℤ)-3)=0 := by simpa only [Fin.val_zero,Nat.cast_zero,add_zero] using hz
  have hh' := hh
  simp only [Fin.val_zero,Nat.cast_zero,add_zero,hz',zero_add] at hh'
  have he : (r : ℤ)-3+1=(r : ℤ)+1-3 := by ring
  rw [he] at hh'
  simpa only [row,rowMask,Finset.mem_filter,Finset.mem_univ,true_and,Fin.val_zero,
    Fin.val_one,Nat.cast_zero,Nat.cast_one,add_zero] using hh' 

/-- Each actual path-count row satisfies the elementary scan recurrence,
including the virtual terminal seed. -/
theorem row_cell (m r : ℕ) (_hr : r≤pNat m) (d : Fin 5) :
    row m r d.succ 0=if d.succ∈rowMask m r then
      (if r=pNat m then basisCol 2 else row m (r+1)) d.castSucc 0+
      (if h : d.val+2<6 then row m r ⟨d.val+2,h⟩ 0 else 0) else 0 := by
  let j : ℤ := (r : ℤ)+(d.succ : ℤ)-3
  have hv : value m r (j+1)=
      (if h : d.val+2<6 then row m r ⟨d.val+2,h⟩ 0 else 0) := by
    split_ifs with h
    · unfold row
      congr 1
      dsimp [j]
      ring
    · apply value_high
      dsimp [j]
      have hd := d.isLt
      omega
  have hj : ((r+1 : ℕ) : ℤ)+(d.castSucc : ℤ)-3=j := by
    dsimp [j]
    ring
  have hh : (if r=pNat m then basisCol 2 else row m (r+1)) d.castSucc 0=
      if r=pNat m ∧ j=(pNat m : ℤ) then 1 else value m (r+1) j := by
    by_cases ht : r=pNat m
    · rw [ite_eq_left ht]
      have hz := value_out_row m (r+1) j (by omega)
      rw [hz]
      simp only [basisCol]
      by_cases hd : d.castSucc=(2 : Fin 6)
      · rw [ite_eq_left hd]
        have he : r=pNat m ∧ j=(pNat m : ℤ) := by
          refine ⟨ht,?_⟩
          have hd' := congrArg Fin.val hd
          change d.val=2 at hd'
          change (r : ℤ)+((d.val+1 : ℕ) : ℤ)-3=(pNat m : ℤ)
          rw [hd',ht]
          norm_num
        rw [ite_eq_left he]
      · rw [ite_eq_right hd]
        have he : ¬(r=pNat m ∧ j=(pNat m : ℤ)) := by
          intro he
          apply hd
          apply Fin.ext
          change d.val=2
          change r=pNat m ∧ (r : ℤ)+((d.val+1 : ℕ) : ℤ)-3=(pNat m : ℤ) at he
          omega
        rw [ite_eq_right he]
    · rw [ite_eq_right ht,ite_eq_right (fun h => ht h.1)]
      exact congrArg (value m (r+1)) hj
  have htzero (h : r=pNat m ∧ j=(pNat m : ℤ)) : value m r (j+1)=0 :=
    value_out_col m r (j+1) (by omega)
  change value m r j=_
  rw [←hv,hh]
  simp only [rowMask,Finset.mem_filter,Finset.mem_univ,true_and]
  have hstep := value_step m r j
  by_cases ht : r=pNat m ∧ j=(pNat m : ℤ)
  · have hz := htzero ht
    simpa only [ite_eq_left ht,hz,add_zero] using hstep
  · simpa only [ite_eq_right ht] using hstep

theorem row_scan (m r : ℕ) (hr : r≤pNat m) :
    row m r=scan (rowMask m r) (if r=pNat m then basisCol 2 else row m (r+1)) :=
  scan_unique _ _ _ (row_bottom m r hr) (row_cell m r hr)

theorem rows_cons (m r n : ℕ) :
    rows m r (n+1)=rowMask m r :: rows m (r+1) n := by
  rw [show n+1=1+n by omega,rows_add]
  rfl

theorem row_pathDP (m r : ℕ) (hr : r≤pNat m) :
    row m r=pathDP (rows m r (pNat m+1-r)) := by
  have main : ∀n r, r+n=pNat m+1 → 0<n → row m r=pathDP (rows m r n) := by
    intro n
    induction n with
    | zero => intros; omega
    | succ n ih =>
      intro r hsum hn
      have hr' : r≤pNat m := by omega
      rw [row_scan m r hr',rows_cons,pathDP]
      by_cases hz : n=0
      · subst n
        have he : r=pNat m := by omega
        rw [ite_eq_left he]
        rfl
      · have he : r≠pNat m := by omega
        rw [ite_eq_right he,ih (r+1) (by omega) (by omega)]
  exact main _ _ (by omega) (by omega)

/-- Numerical counting bridge for all natural parameters: E is the actual
number of linear extensions of the generated finite poset. -/
theorem extension_card_eq_E (m : ℕ) : (Nat.card (FamilyExtension m) : ℤ)=E m := by
  rw [extension_card_eq_G]
  have hrow := row_pathDP m 0 (by omega)
  have hlen : pNat m+1-0=55+10*m := by dsimp [pNat,LatticePaths6.half]; omega
  rw [hlen] at hrow
  have hv := congrArg (fun w : Matrix (Fin 6) (Fin 1) ℤ => w 3 0) hrow
  simpa [row,value] using hv.trans (pathDP_eq_E m)

end OneThird.RowCounts7
