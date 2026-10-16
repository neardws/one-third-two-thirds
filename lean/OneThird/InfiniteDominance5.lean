module
public import OneThird.LocatedCells5
public import OneThird.AllEndpoints5
@[expose] public section
namespace OneThird.InfiniteDominance5
open Matrix Structure MatrixBounds CertificateChecker CertificateData4 CertificateCoverage4
open TransferCache5 CircuitBindings5 CircuitSemantics5 RegionModels5 LocatedCells5
set_option maxHeartbeats 0
set_option maxRecDepth 100000

theorem select_scalar (a : ZMat) : (select3*a*select2) 3 2=a 3 2 := by
  simp [select3,select2,Matrix.mul_apply]

theorem corridor_entry (m : ℕ) : transfer (rows m 0 (55+10*m)) 3 2=E m := by
  simpa [basisRow,basisCol,Matrix.mul_apply] using corridor_eq_E m

theorem located_total {m r : ℕ} {i : Fin 144} {n : ℕ → ℕ} (h : Located m r i n) :
    (leftSpec i n*(cells i).rowMap*rightSpec i n) 3 2=E m := by
  have ht : transfer (rows m 0 (55+10*m))=
      transfer h.before*rowMatrix (typeMask i)*transfer h.after := by
    rw [h.word,transfer_append]
    change transfer h.before*(rowMatrix (typeMask i)*transfer h.after)= _
    rw [Matrix.mul_assoc]
  rw [h.left,h.right,rowMap_binding]
  have he : select3*transfer h.before*rowMatrix (typeMask i)*(transfer h.after*select2)=
      select3*(transfer h.before*rowMatrix (typeMask i)*transfer h.after)*select2 := by
    simp only [Matrix.mul_assoc]
  rw [he,select_scalar,←ht,corridor_entry]

/-- The actual word-transfer crossing count at row r and cutoff d.
Its interpretation as an extension-event cardinality remains a separate theorem. -/
def crossing (m r : ℕ) (d : Fin 7) : ℤ :=
  (select3*transfer ((rows m 0 (55+10*m)).take r)*
    eventRow (rowMask m r) ((d.val : ℤ)-3)*
    transfer ((rows m 0 (55+10*m)).drop (r+1))*select2) 3 2

theorem located_crossing {m r : ℕ} {i : Fin 144} {n : ℕ → ℕ}
    (h : Located m r i n) (hr : r<55+10*m) (d : Fin 7) :
    (leftSpec i n*cut (cells i).rowMap d.val*rightSpec i n) 3 2=crossing m r d := by
  rw [(located_prefix h).1,(located_prefix h).2,cut_binding,located_mask h hr]
  simp only [crossing,Matrix.mul_assoc]

/-- Kernel-checked infinite-range dominance for actual family transfer crossings.
The two endpoint cutoffs are explicitly excluded. The bound includes strict slack. -/
theorem transfer_dominance (m r : ℕ) (hm : 8≤m) (hr : r<54+10*m)
    (d : Fin 7) (hne : ¬((r=0 ∨ r=53+10*m) ∧ d.val=3)) :
    min (crossing m r d : ℝ) ((E m : ℝ)-crossing m r d)+
      (3/12500)*(E m : ℝ)<(N m : ℝ) := by
  obtain ⟨i,n,⟨h⟩,hn⟩ := located_coverage m r hm hr
  have hd : d ∉ (cells i).excluded := by
    rw [exclusions]
    split_ifs with he
    · intro hd
      have hv : d.val=3 := congrArg Fin.val (Finset.mem_singleton.mp hd)
      exact hne ⟨h.endpoints.mp he,hv⟩
    · simp
  have hb := transfer_cell_bounds i n hn d hd
  dsimp at hb
  rw [located_total h,located_crossing h (by omega) d] at hb
  have he := AllEndpoints5.endpoint_ratio_all m
  exact dominance_of_separator (E m) (N m) (crossing m r d) he.1 he.2.1 hb.2

end OneThird.InfiniteDominance5
