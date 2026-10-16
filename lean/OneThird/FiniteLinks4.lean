module
public import OneThird.FiniteVerified4
@[expose] public section
namespace OneThird.FiniteLinks4
open FiniteGrid4
theorem E_value3 : OneThird.E 3 = 16060715880066072501943985102042296992 := by
  have h := OneThird.E_rec 0
  norm_num only [show 0+3=3 from rfl, show 0+2=2 from rfl, show 0+1=1 from rfl] at h
  simpa [E_0, E_1, E_2] using h
theorem N_value3 : OneThird.N 3 = 5602675691149231542096194368517834280 := by
  have h := OneThird.N_rec 0
  norm_num only [show 0+3=3 from rfl, show 0+2=2 from rfl, show 0+1=1 from rfl] at h
  simpa [N_0, N_1, N_2] using h
theorem E_value4 : OneThird.E 4 = 431101299460433275548631596728993981040720 := by
  have h := OneThird.E_rec 1
  norm_num only [show 1+3=4 from rfl, show 1+2=3 from rfl, show 1+1=2 from rfl] at h
  simpa [E_1, E_2, E_value3] using h
theorem N_value4 : OneThird.N 4 = 150386868738996608430437499102705872074668 := by
  have h := OneThird.N_rec 1
  norm_num only [show 1+3=4 from rfl, show 1+2=3 from rfl, show 1+1=2 from rfl] at h
  simpa [N_1, N_2, N_value3] using h
theorem E_value5 : OneThird.E 5 = 11571609371855073414095275534996572407396525856 := by
  have h := OneThird.E_rec 2
  norm_num only [show 2+3=5 from rfl, show 2+2=4 from rfl, show 2+1=3 from rfl] at h
  simpa [E_2, E_value3, E_value4] using h
theorem N_value5 : OneThird.N 5 = 4036680246341568115695041678111228185977352008 := by
  have h := OneThird.N_rec 2
  norm_num only [show 2+3=5 from rfl, show 2+2=4 from rfl, show 2+1=3 from rfl] at h
  simpa [N_2, N_value3, N_value4] using h
theorem E_value6 : OneThird.E 6 = 310604824486486573925287126481528556617368041065040 := by
  have h := OneThird.E_rec 3
  norm_num only [show 3+3=6 from rfl, show 3+2=5 from rfl, show 3+1=4 from rfl] at h
  simpa [E_value3, E_value4, E_value5] using h
theorem N_value6 : OneThird.N 6 = 108352461540273060632958628812838437574489098364908 := by
  have h := OneThird.N_rec 3
  norm_num only [show 3+3=6 from rfl, show 3+2=5 from rfl, show 3+1=4 from rfl] at h
  simpa [N_value3, N_value4, N_value5] using h
theorem E_value7 : OneThird.E 7 = 8337246263163040534954038163180461287760463318363980192 := by
  have h := OneThird.E_rec 4
  norm_num only [show 4+3=7 from rfl, show 4+2=6 from rfl, show 4+1=5 from rfl] at h
  simpa [E_value4, E_value5, E_value6] using h
theorem N_value7 : OneThird.N 7 = 2908393829924109910506719169287529668094023576292623592 := by
  have h := OneThird.N_rec 4
  norm_num only [show 4+3=7 from rfl, show 4+2=6 from rfl, show 4+1=5 from rfl] at h
  simpa [N_value4, N_value5, N_value6] using h
theorem counts0 : (GridData4_0.checked.E : ℤ)=OneThird.E 0 ∧ (GridData4_0.checked.N : ℤ)=OneThird.N 0 := by
  constructor
  · exact OneThird.E_0.symm
  · exact OneThird.N_0.symm
theorem counts1 : (GridData4_1.checked.E : ℤ)=OneThird.E 1 ∧ (GridData4_1.checked.N : ℤ)=OneThird.N 1 := by
  constructor
  · exact OneThird.E_1.symm
  · exact OneThird.N_1.symm
theorem counts2 : (GridData4_2.checked.E : ℤ)=OneThird.E 2 ∧ (GridData4_2.checked.N : ℤ)=OneThird.N 2 := by
  constructor
  · exact OneThird.E_2.symm
  · exact OneThird.N_2.symm
theorem counts3 : (GridData4_3.checked.E : ℤ)=OneThird.E 3 ∧ (GridData4_3.checked.N : ℤ)=OneThird.N 3 := by
  constructor
  · exact E_value3.symm
  · exact N_value3.symm
theorem counts4 : (GridData4_4.checked.E : ℤ)=OneThird.E 4 ∧ (GridData4_4.checked.N : ℤ)=OneThird.N 4 := by
  constructor
  · exact E_value4.symm
  · exact N_value4.symm
theorem counts5 : (GridData4_5.checked.E : ℤ)=OneThird.E 5 ∧ (GridData4_5.checked.N : ℤ)=OneThird.N 5 := by
  constructor
  · exact E_value5.symm
  · exact N_value5.symm
theorem counts6 : (GridData4_6.checked.E : ℤ)=OneThird.E 6 ∧ (GridData4_6.checked.N : ℤ)=OneThird.N 6 := by
  constructor
  · exact E_value6.symm
  · exact N_value6.symm
theorem counts7 : (GridData4_7.checked.E : ℤ)=OneThird.E 7 ∧ (GridData4_7.checked.N : ℤ)=OneThird.N 7 := by
  constructor
  · exact E_value7.symm
  · exact N_value7.symm
theorem verified_counts (m : Fin 8) :
    ((verified m).E : ℤ)=OneThird.E m.val ∧ ((verified m).N : ℤ)=OneThird.N m.val := by
  fin_cases m
  exact counts0
  exact counts1
  exact counts2
  exact counts3
  exact counts4
  exact counts5
  exact counts6
  exact counts7

/-- The finite checker bounds every pair threshold, not just the seven stored
representatives. These are crossing-event counts of the certified DP tables. -/
theorem all_finite_pairs (m : Fin 8) (i j : ℕ) (hi : 1 ≤ i) (hip : i ≤ 54 + 10*m.val) :
    let c := verified m
    pairEvent c.f c.g i j≤c.E ∧
      (min (pairEvent c.f c.g i j) (c.E-pairEvent c.f c.g i j)≤c.N) := by
  dsimp
  let c := verified m
  change pairEvent c.f c.g i j≤c.E ∧
    min (pairEvent c.f c.g i j) (c.E-pairEvent c.f c.g i j)≤c.N
  have h := c.pairs ⟨i-1,by omega⟩ (cutoff i j)
  have he : i-1+1=i := by omega
  simp only [he] at h
  rw [pairEvent_eq_cutoff]
  refine ⟨h.1, ?_⟩
  unfold pairCheck at h
  split_ifs at h with he
  · exact h.2.le
  · have hp := c.positive
    omega

/-- Full-square DP-event dominance for all eight finite cases. The two
endpoint events tie; every other event is strictly below them. -/
theorem finite_dominance (m : Fin 8) (i j : ℕ) (hi : 1 ≤ i)
    (hip : i ≤ 54+10*m.val) :
    let c := verified m
    let B := min (pairEvent c.f c.g i j) (c.E-pairEvent c.f c.g i j)
    if (i=1 ∧ j=1) ∨ (i=54+10*m.val ∧ j=54+10*m.val) then B=c.N else B<c.N := by
  dsimp
  let c := verified m
  change if (i=1 ∧ j=1) ∨ (i=54+10*m.val ∧ j=54+10*m.val) then
    min (pairEvent c.f c.g i j) (c.E-pairEvent c.f c.g i j)=c.N else
    min (pairEvent c.f c.g i j) (c.E-pairEvent c.f c.g i j)<c.N
  have h := c.pairs ⟨i-1,by omega⟩ (cutoff i j)
  have he : i-1+1=i := by omega
  simp only [he] at h
  unfold pairCheck at h
  have hend : ((i=1 ∨ i=54+10*m.val) ∧ (cutoff i j).val=3) ↔
      ((i=1 ∧ j=1) ∨ (i=54+10*m.val ∧ j=54+10*m.val)) := by
    simp only [cutoff]
    omega
  simp only [hend] at h
  rw [pairEvent_eq_cutoff]
  by_cases ht : (i=1 ∧ j=1) ∨ (i=54+10*m.val ∧ j=54+10*m.val)
  · simp only [ht, ite_true] at h ⊢
    exact h.2
  · simp only [ht, ite_false] at h ⊢
    have hp := c.positive
    omega

/-- The cached forward table satisfies the recurrence at every cell of the
full square; its band representation is not an omitted-cell assumption. -/
theorem full_grid_forward (m : Fin 8) (i j : ℕ)
    (hi : i ≤ 54+10*m.val) (hj : j ≤ 54+10*m.val) :
    forwardStep m.val (verified m).f i j :=
  (verified m).forward ⟨i,by omega⟩ ⟨j,by omega⟩

theorem full_grid_backward (m : Fin 8) (i j : ℕ)
    (hi : i ≤ 54+10*m.val) (hj : j ≤ 54+10*m.val) :
    backwardStep m.val (verified m).g i j :=
  (verified m).backward ⟨i,by omega⟩ ⟨j,by omega⟩
end OneThird.FiniteLinks4
