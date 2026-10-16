module
public import OneThird.EndpointData5
public import OneThird.FiniteLinks4
public import Mathlib.Tactic.IntervalCases
@[expose] public section
namespace OneThird.AllEndpoints5
set_option maxHeartbeats 0

/-- The stronger endpoint separator holds for every parameter, including the
finite exceptions already checked by the full-grid certificate. -/
theorem endpoint_ratio_all (m : ℕ) :
    0<(E m : ℝ) ∧ (34884 : ℝ)/100000<(N m : ℝ)/E m ∧ (N m : ℝ)/E m<1/2 := by
  by_cases hm : 4≤m
  · exact EndpointData5.endpoint_ratio m hm
  · have hlt : m<4 := by omega
    interval_cases m <;>
      norm_num [E_0,N_0,E_1,N_1,E_2,N_2,FiniteLinks4.E_value3,FiniteLinks4.N_value3]

end OneThird.AllEndpoints5
