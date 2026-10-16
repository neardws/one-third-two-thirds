module
public import OneThird.BottomCounts7
public import OneThird.HitRows7
public import OneThird.Balance6
public import OneThird.FiniteTransferVerified7
@[expose] public section
namespace OneThird.Balance7
open Structure LinearExtensions4 ChainPrefixes5 LatticePaths6 Counting6 Balance6
open GridCounts7 RowCounts7 BottomCounts7 HitRows7
set_option maxHeartbeats 0
noncomputable section

theorem total_eq_E (m : ℕ) : (Nat.card (FamilyExtension m) : ℝ)=E m := by
  exact_mod_cast extension_card_eq_E m

theorem bottom_even (m : ℕ) : chainLabel m 0 0=(0 : Fin (size m)) := by
  apply Fin.ext
  simp [chainLabel]
theorem bottom_odd (m : ℕ) : chainLabel m 1 0=(1 : Fin (size m)) := by
  apply Fin.ext
  have h : (1 : Fin (size m)).val=1 := by
    change 1%(108+20*m)=1
    exact Nat.mod_eq_of_lt (by omega)
  change 2*(0 : Fin (54+10*m)).val+(1 : Fin 2).val=(1 : Fin (size m)).val
  rw [h]
  rfl

theorem bottom_probability (m : ℕ) : probability m 1 0=(N m : ℝ)/E m := by
  have hn : (eventCard m 1 0 : ℝ)=N m := by
    have hh := bottom_card_eq_N m
    rw [bottom_even,bottom_odd] at hh
    exact_mod_cast hh
  rw [probability,hn,total_eq_E]

theorem bottom_balance (m : ℕ) : balance m 0 1=(N m : ℝ)/E m := by
  have hne : (1 : Fin (size m))≠0 := by
    have h : (1 : Fin (size m)).val=1 := by
      change 1%(108+20*m)=1
      exact Nat.mod_eq_of_lt (by omega)
    intro he
    have := congrArg Fin.val he
    simp only [h,Fin.val_zero] at this
    omega
  rw [balance_symm,balance_eq_min m 1 0 hne,bottom_probability]
  apply min_eq_left
  have hh := (AllEndpoints5.endpoint_ratio_all m).2.2
  linarith

theorem cross_ne (m : ℕ) (i j : Fin (pNat m)) : chainLabel m 0 i≠chainLabel m 1 j := by
  intro h
  have hh := congrArg Fin.val h
  simp only [chainLabel,Fin.val_zero,Fin.val_one] at hh
  omega

theorem cross_balance (m : ℕ) (i j : Fin (pNat m)) :
    balance m (chainLabel m 0 i) (chainLabel m 1 j)=
      min (H m i j : ℝ) ((E m : ℝ)-H m i j)/(E m : ℝ) := by
  rw [balance_eq_min m _ _ (cross_ne m i j)]
  have hh : probability m (chainLabel m 0 i) (chainLabel m 1 j)=
      (H m i j : ℝ)/E m := by
    rw [probability,total_eq_E]
    exact congrArg (fun n : ℕ => (n : ℝ)/(E m : ℝ)) (H_eq_event_card m i j).symm
  rw [hh]
  have he := (AllEndpoints5.endpoint_ratio_all m).1
  have hs : 1-(H m i j : ℝ)/E m=((E m : ℝ)-H m i j)/E m := by
    rw [sub_div,div_self (ne_of_gt he)]
  rw [hs,min_div_div_right he.le]

theorem finite_crossing_bound (m : Fin 8) (r : Fin (54+10*m.val)) (d : Fin 7) :
    min (InfiniteDominance5.crossing m.val r.val d : ℝ)
      ((E m.val : ℝ)-InfiniteDominance5.crossing m.val r.val d)≤N m.val := by
  let c := FiniteGrid4.verified m
  have hh := c.pairs r d
  change FiniteGrid4.pairCheck c.f c.g c.E c.N (r.val+1) d at hh
  unfold FiniteGrid4.pairCheck at hh
  have hb : min (FiniteGrid4.eventCount c.f c.g (r.val+1) d)
      (c.E-FiniteGrid4.eventCount c.f c.g (r.val+1) d)≤c.N := by
    split_ifs at hh
    · exact hh.2.le
    · have hp := c.positive
      omega
  have he : (c.E : ℝ)=E m.val := by exact_mod_cast (FiniteLinks4.verified_counts m).1
  have hn : (c.N : ℝ)=N m.val := by exact_mod_cast (FiniteLinks4.verified_counts m).2
  have hcast : ((min (FiniteGrid4.eventCount c.f c.g (r.val+1) d)
      (c.E-FiniteGrid4.eventCount c.f c.g (r.val+1) d) : ℕ) : ℝ)=
      min (FiniteGrid4.eventCount c.f c.g (r.val+1) d : ℝ)
        ((c.E : ℝ)-FiniteGrid4.eventCount c.f c.g (r.val+1) d) := by
    rw [Nat.cast_min,Nat.cast_sub hh.1]
  have hb' : ((min (FiniteGrid4.eventCount c.f c.g (r.val+1) d)
      (c.E-FiniteGrid4.eventCount c.f c.g (r.val+1) d) : ℕ) : ℝ)≤(c.N : ℝ) := by exact_mod_cast hb
  rw [hcast,hn,he] at hb'
  have hx := FiniteTransfer7.crossing_eq_event (FiniteTransfer7.verified m) r d
  have hx' : (InfiniteDominance5.crossing m.val r.val d : ℝ)=
      (FiniteGrid4.eventCount c.f c.g (r.val+1) d : ℝ) := by exact_mod_cast hx
  simpa only [hx'] using hb'

/-- The same actual event cardinality is the result4 full-grid DP edge sum
for every one of the eight finite parameters. -/
theorem H_eq_finite_pairEvent (m : Fin 8) (i j : Fin (pNat m.val)) :
    (H m.val i j : ℤ)=
      (FiniteGrid4.pairEvent (FiniteGrid4.verified m).f (FiniteGrid4.verified m).g
        (i.val+1) (j.val+1) : ℤ) := by
  rw [H_eq_crossing,FiniteGrid4.pairEvent_eq_cutoff]
  exact FiniteTransfer7.crossing_eq_event (FiniteTransfer7.verified m) i _

theorem top_even (m : ℕ) (i : Fin (pNat m)) (hi : i.val=53+10*m) :
    chainLabel m 0 i=(1 : Fin (size m)).rev := by
  apply Fin.ext
  have hone : (1 : Fin (size m)).val=1 := by
    change 1%(108+20*m)=1
    exact Nat.mod_eq_of_lt (by omega)
  simp only [chainLabel,Fin.val_zero,Fin.val_rev,hone]
  dsimp [size]
  omega

theorem top_odd (m : ℕ) (i : Fin (pNat m)) (hi : i.val=53+10*m) :
    chainLabel m 1 i=(0 : Fin (size m)).rev := by
  apply Fin.ext
  simp only [chainLabel,Fin.val_one,Fin.val_rev,Fin.val_zero]
  dsimp [size]
  omega

theorem every_cross_balance (m : ℕ) (i j : Fin (pNat m)) :
    balance m (chainLabel m 0 i) (chainLabel m 1 j)≤(N m : ℝ)/E m := by
  let d := FiniteGrid4.cutoff (i.val+1) (j.val+1)
  have hi : i.val<54+10*m := i.isLt
  by_cases hend : (i.val=0 ∨ i.val=53+10*m) ∧ d.val=3
  · have hij : i=j := by
      apply Fin.ext
      have hh := hend.2
      dsimp [d,FiniteGrid4.cutoff] at hh
      omega
    subst j
    rcases hend.1 with hzero | htop
    · have hz : i=0 := Fin.ext hzero
      subst i
      rw [bottom_even,bottom_odd,bottom_balance]
    · rw [top_even m i htop,top_odd m i htop,←endpoint_balance_tie,bottom_balance]
  · rw [cross_balance]
    have hcross : (H m i j : ℝ)=(InfiniteDominance5.crossing m i.val d : ℝ) := by
      exact_mod_cast H_eq_crossing m i j
    rw [hcross]
    apply (div_le_div_iff_of_pos_right (AllEndpoints5.endpoint_ratio_all m).1).mpr
    by_cases hm : 8≤m
    · have hh := InfiniteDominance5.transfer_dominance m i.val hm hi d hend
      have he := (AllEndpoints5.endpoint_ratio_all m).1
      linarith
    · exact finite_crossing_bound ⟨m,by omega⟩ ⟨i.val,hi⟩ d

/-- The actual finite-poset maximum, with uniform probabilities on linear
extensions, equals the bottom minority ratio for every natural parameter. -/
theorem delta_eq_ratio (m : ℕ) : delta m=(N m : ℝ)/E m := by
  apply le_antisymm
  · apply delta_le_of_cross_bound m _
    · have hh := (AllEndpoints5.endpoint_ratio_all m).2.1
      linarith
    · intro i j _
      exact every_cross_balance m i j
  · rw [←bottom_balance m]
    apply balance_le_delta
    apply adjacent_incomparable m 0 1
    change 1%(108+20*m)=1
    exact Nat.mod_eq_of_lt (by omega)

/-- Limit of the balance constant of the actual alpha-family posets. -/
theorem delta_tendsto :
    Filter.Tendsto delta Filter.atTop
      (nhds ((115713181619-36*Real.sqrt 6697)/331705168868)) := by
  have hf : delta=(fun m : ℕ => (N m : ℝ)/E m) := funext delta_eq_ratio
  rw [hf]
  exact OneThird.ratio_tendsto

end
end OneThird.Balance7
