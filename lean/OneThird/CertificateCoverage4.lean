module
public import OneThird.SpectralBridge4
@[expose] public section
namespace OneThird.CertificateCoverage4
open Structure CertificateData4 CertificateChecker
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def typeMask : Fin 144 → Mask := ![pre[0]!, pre[1]!, pre[2]!, pre[3]!, pre[4]!, pre[5]!, pre[6]!, pre[7]!, pre[8]!, pre[9]!, pre[10]!, pre[11]!, pre[12]!, pre[13]!, pre[14]!, pre[15]!, pre[16]!, pre[17]!, pre[18]!, pre[19]!, pre[20]!, pre[21]!, mid[0]!, mid[1]!, mid[2]!, mid[3]!, mid[4]!, mid[5]!, mid[6]!, mid[7]!, mid[8]!, mid[9]!, mid[10]!, suf[0]!, suf[1]!, suf[2]!, suf[3]!, suf[4]!, suf[5]!, suf[6]!, suf[7]!, suf[8]!, suf[9]!, suf[10]!, suf[11]!, suf[12]!, suf[13]!, suf[14]!, suf[15]!, suf[16]!, suf[17]!, suf[18]!, suf[19]!, suf[20]!, block[0]!, block[0]!, block[1]!, block[1]!, block[2]!, block[2]!, block[3]!, block[3]!, block[4]!, block[4]!, block[0]!, block[0]!, block[1]!, block[1]!, block[2]!, block[2]!, block[3]!, block[3]!, block[4]!, block[4]!, block[0]!, block[0]!, block[1]!, block[1]!, block[2]!, block[2]!, block[3]!, block[3]!, block[4]!, block[4]!, block[0]!, block[0]!, block[1]!, block[1]!, block[2]!, block[2]!, block[3]!, block[3]!, block[4]!, block[4]!, block[0]!, block[0]!, block[1]!, block[1]!, block[2]!, block[2]!, block[3]!, block[3]!, block[4]!, block[4]!, block[0]!, block[0]!, block[1]!, block[1]!, block[2]!, block[2]!, block[3]!, block[3]!, block[4]!, block[4]!, block[0]!, block[0]!, block[1]!, block[1]!, block[2]!, block[2]!, block[3]!, block[3]!, block[4]!, block[4]!, block[0]!, block[0]!, block[1]!, block[1]!, block[2]!, block[2]!, block[3]!, block[3]!, block[4]!, block[4]!, block[0]!, block[0]!, block[1]!, block[1]!, block[2]!, block[2]!, block[3]!, block[3]!, block[4]!, block[4]!]

/-- Every numerical cell uses the corresponding mask from the formal row word. -/
theorem rowMap_binding (i : Fin 144) : (cells i).rowMap=rowMatrix (typeMask i) := by
  fin_cases i <;> decide

/-- Precisely two numerical cases are excluded: the tied endpoint cutoffs. -/
theorem exclusions (i : Fin 144) :
    (cells i).excluded=if i.val=0 ∨ i.val=53 then {3} else ∅ := by
  fin_cases i <;> rfl

theorem checked_case_count :
    ∑i : Fin 144, (Finset.univ \ (cells i).excluded).card=1006 := by
  simp_rw [exclusions]
  decide

/-- The interval checker's column cutoff is the formal crossing-event row. -/
theorem cut_binding (i : Fin 144) (d : Fin 7) :
    cut (cells i).rowMap d.val=eventRow (typeMask i) ((d.val : ℤ)-3) := by
  rw [rowMap_binding]
  funext r e
  simp only [cut, eventRow]
  have he : (e.val<d.val) ↔ ((e.val : ℤ)<(d.val : ℤ)-3+3) := by omega
  simp only [he]
end OneThird.CertificateCoverage4
