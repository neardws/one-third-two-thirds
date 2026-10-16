module
public import OneThird.RegionModels5
@[expose] public section
namespace OneThird.LocatedCells5
open Structure TransferCache5 CircuitBindings5 CircuitSemantics5 RegionModels5 CertificateCoverage4
set_option maxHeartbeats 0
set_option maxRecDepth 100000
set_option linter.unusedSimpArgs false

def blocks (m : ℕ) : List Mask := (List.replicate m block).flatten

theorem blocks_split (k l : ℕ) : blocks (k+l+1)=blocks k++block++blocks l := by
  rw [show k+l+1=k+(l+1) by omega]
  simp [blocks,List.replicate_add,List.flatten_append,List.replicate_succ,List.append_assoc]

theorem pre_split (t : Fin 22) : pre=pre.take t.val++pre[t.val]!::pre.drop (t.val+1) := by
  fin_cases t <;> rfl
theorem mid_split (t : Fin 11) : mid=mid.take t.val++mid[t.val]!::mid.drop (t.val+1) := by
  fin_cases t <;> rfl
theorem suf_split (t : Fin 21) : suf=suf.take t.val++suf[t.val]!::suf.drop (t.val+1) := by
  fin_cases t <;> rfl
theorem block_split (t : Fin 5) : block=block.take t.val++block[t.val]!::block.drop (t.val+1) := by
  fin_cases t <;> rfl

theorem pre_mask (t : Fin 22) : typeMask ⟨t.val,by omega⟩=pre[t.val]! := by fin_cases t <;> rfl
theorem mid_mask (t : Fin 11) : typeMask ⟨22+t.val,by omega⟩=mid[t.val]! := by fin_cases t <;> rfl
theorem suf_mask (t : Fin 21) : typeMask ⟨33+t.val,by omega⟩=suf[t.val]! := by fin_cases t <;> rfl

theorem left_mask (k l : ℕ) (t : Fin 5) : typeMask (leftIndex k l t)=block[t.val]! := by
  by_cases hk : k<4
  · interval_cases k <;> fin_cases t <;> rfl
  · by_cases hl : l<4
    · interval_cases l <;> fin_cases t <;> simp [leftIndex,regime,hk,typeMask]
    · fin_cases t <;> simp [leftIndex,regime,hk,hl,typeMask]

theorem right_mask (k l : ℕ) (t : Fin 5) : typeMask (rightIndex k l t)=block[t.val]! := by
  by_cases hk : k<4
  · interval_cases k <;> fin_cases t <;> rfl
  · by_cases hl : l<4
    · interval_cases l <;> fin_cases t <;> simp [rightIndex,regime,hk,typeMask]
    · fin_cases t <;> simp [rightIndex,regime,hk,hl,typeMask]

/-- A circuit cell placed at an actual row of the formal family word. -/
structure Located (m r : ℕ) (i : Fin 144) (n : ℕ → ℕ) where
  before : List Mask
  after : List Mask
  word : rows m 0 (55+10*m)=before++typeMask i::after
  length_before : before.length=r
  left : leftSpec i n=select3*transfer before
  right : rightSpec i n=transfer after*select2
  endpoints : (i.val=0 ∨ i.val=53) ↔ (r=0 ∨ r=53+10*m)

/-- PRE placements, uniformly in the arbitrary number of repeated blocks. -/
def locate_pre (m : ℕ) (t : Fin 22) : Located m t.val ⟨t.val,by omega⟩ (assignments m 0 0) where
  before := pre.take t.val
  after := pre.drop (t.val+1)++blocks m++mid++blocks m++suf
  word := by
    rw [row_word,pre_mask]
    change pre++blocks m++mid++blocks m++suf= _
    conv_lhs => rw [pre_split t]
    simp only [List.append_assoc,List.cons_append]
  length_before := by simp [List.length_take,pre] <;> omega
  left := (pre_specs m t).1
  right := by
    rw [(pre_specs m t).2]
    simp [transfer_append,blocks,transfer_repeat,block_eq_A,Matrix.mul_assoc]
  endpoints := by
    change (t.val=0 ∨ t.val=53) ↔ (t.val=0 ∨ t.val=53+10*m)
    omega

def locate_mid (m : ℕ) (t : Fin 11) : Located m (22+5*m+t.val) ⟨22+t.val,by omega⟩ (assignments m 0 0) where
  before := pre++blocks m++mid.take t.val
  after := mid.drop (t.val+1)++blocks m++suf
  word := by
    rw [row_word,mid_mask]
    change pre++blocks m++mid++blocks m++suf= _
    conv_lhs => rw [mid_split t]
    simp only [List.append_assoc,List.cons_append]
  length_before := by simp [blocks,List.length_flatten,pre,mid,block,List.length_take] <;> omega
  left := by
    rw [(mid_specs m t).1]
    simp [transfer_append,blocks,transfer_repeat,block_eq_A,Matrix.mul_assoc]
  right := by
    rw [(mid_specs m t).2]
    simp [transfer_append,blocks,transfer_repeat,block_eq_A,Matrix.mul_assoc]
  endpoints := by
    change (22+t.val=0 ∨ 22+t.val=53) ↔ (22+5*m+t.val=0 ∨ 22+5*m+t.val=53+10*m)
    omega

def locate_suf (m : ℕ) (t : Fin 21) : Located m (33+10*m+t.val) ⟨33+t.val,by omega⟩ (assignments m 0 0) where
  before := pre++blocks m++mid++blocks m++suf.take t.val
  after := suf.drop (t.val+1)
  word := by
    rw [row_word,suf_mask]
    change pre++blocks m++mid++blocks m++suf= _
    conv_lhs => rw [suf_split t]
    simp only [List.append_assoc,List.cons_append]
  length_before := by simp [blocks,List.length_flatten,pre,mid,suf,block,List.length_take] <;> omega
  left := by
    rw [(suf_specs m t).1]
    simp [transfer_append,blocks,transfer_repeat,block_eq_A,Matrix.mul_assoc]
  right := (suf_specs m t).2
  endpoints := by
    change (33+t.val=0 ∨ 33+t.val=53) ↔ (33+10*m+t.val=0 ∨ 33+10*m+t.val=53+10*m)
    omega

def locate_left (m k l : ℕ) (hp : k+l+1=m) (hh : 4≤k ∨ 4≤l) (t : Fin 5) :
    Located m (22+5*k+t.val) (leftIndex k l t) (assignments m k l) where
  before := pre++blocks k++block.take t.val
  after := block.drop (t.val+1)++blocks l++mid++blocks m++suf
  word := by
    rw [row_word,left_mask]
    change pre++blocks m++mid++blocks m++suf= _
    conv_lhs => enter [1,1,1,2]; rw [←hp,blocks_split k l,block_split t]
    simp only [List.append_assoc,List.cons_append]
  length_before := by simp [blocks,List.length_flatten,pre,block,List.length_take] <;> omega
  left := by
    rw [(left_specs m k l hh t).1]
    simp [transfer_append,blocks,transfer_repeat,block_eq_A,Matrix.mul_assoc]
  right := by
    rw [(left_specs m k l hh t).2]
    simp [transfer_append,blocks,transfer_repeat,block_eq_A,Matrix.mul_assoc]
  endpoints := by simp only [leftIndex]; omega

def locate_right (m k l : ℕ) (hp : k+l+1=m) (hh : 4≤k ∨ 4≤l) (t : Fin 5) :
    Located m (33+5*m+5*k+t.val) (rightIndex k l t) (assignments m k l) where
  before := pre++blocks m++mid++blocks k++block.take t.val
  after := block.drop (t.val+1)++blocks l++suf
  word := by
    rw [row_word,right_mask]
    change pre++blocks m++mid++blocks m++suf= _
    conv_lhs => enter [1,2]; rw [←hp,blocks_split k l,block_split t]
    simp only [List.append_assoc,List.cons_append]
  length_before := by simp [blocks,List.length_flatten,pre,mid,block,List.length_take] <;> omega
  left := by
    rw [(right_specs m k l hh t).1]
    simp [transfer_append,blocks,transfer_repeat,block_eq_A,Matrix.mul_assoc]
  right := by
    rw [(right_specs m k l hh t).2]
    simp [transfer_append,blocks,transfer_repeat,block_eq_A,Matrix.mul_assoc]
  endpoints := by simp only [rightIndex]; omega

theorem located_coverage (m r : ℕ) (hm : 8≤m) (hr : r<54+10*m) :
    ∃i n, Nonempty (Located m r i n) ∧ ∀k, 4≤n k := by
  rcases row_region_coverage m r hr with hpre | hleft | hmid | hright | hsuf
  · exact ⟨⟨r,by omega⟩,assignments m 0 0,⟨locate_pre m ⟨r,hpre⟩⟩,
      assignments_tail m 0 0 (by omega)⟩
  · obtain ⟨k,t,hk,ht,rfl⟩ := hleft
    let l := m-k-1
    have hp : k+l+1=m := by dsimp [l]; omega
    have hh : 4≤k ∨ 4≤l := by omega
    exact ⟨leftIndex k l ⟨t,ht⟩,assignments m k l,
      ⟨locate_left m k l hp hh ⟨t,ht⟩⟩,assignments_tail m k l (by omega)⟩
  · obtain ⟨t,ht,rfl⟩ := hmid
    exact ⟨⟨22+t,by omega⟩,assignments m 0 0,⟨locate_mid m ⟨t,ht⟩⟩,
      assignments_tail m 0 0 (by omega)⟩
  · obtain ⟨k,t,hk,ht,rfl⟩ := hright
    let l := m-k-1
    have hp : k+l+1=m := by dsimp [l]; omega
    have hh : 4≤k ∨ 4≤l := by omega
    exact ⟨rightIndex k l ⟨t,ht⟩,assignments m k l,
      ⟨locate_right m k l hp hh ⟨t,ht⟩⟩,assignments_tail m k l (by omega)⟩
  · obtain ⟨t,ht,rfl⟩ := hsuf
    exact ⟨⟨33+t,by omega⟩,assignments m 0 0,⟨locate_suf m ⟨t,ht⟩⟩,
      assignments_tail m 0 0 (by omega)⟩

theorem located_prefix {m r : ℕ} {i : Fin 144} {n : ℕ → ℕ} (h : Located m r i n) :
    leftSpec i n=select3*transfer ((rows m 0 (55+10*m)).take r) ∧
    rightSpec i n=transfer ((rows m 0 (55+10*m)).drop (r+1))*select2 := by
  have ht : (rows m 0 (55+10*m)).take r=h.before := by
    rw [h.word]
    exact List.take_left' h.length_before
  have hd : (rows m 0 (55+10*m)).drop (r+1)=h.after := by
    rw [h.word]
    have hx : (h.before++typeMask i::h.after).drop (h.before.length+1)=h.after := by simp
    simpa only [h.length_before] using hx
  rw [ht,hd]
  exact ⟨h.left,h.right⟩

theorem located_mask {m r : ℕ} {i : Fin 144} {n : ℕ → ℕ} (h : Located m r i n)
    (hr : r<55+10*m) : typeMask i=rowMask m r := by
  have hidx : (rows m 0 (55+10*m))[r]! = typeMask i := by
    rw [h.word]
    have hx : (h.before++typeMask i::h.after)[h.before.length]! = typeMask i := by simp
    simpa only [h.length_before] using hx
  simpa [rows,List.getElem!_eq_getElem?_getD,hr] using hidx.symm

/-- Every actual nonterminal family row is represented by a certified circuit,
with a common strictly positive scale for its total and every crossing event. -/
theorem uniform_circuit_instantiation (m r : ℕ) (hm : 8≤m) (hr : r<54+10*m) :
    ∃(i : Fin 144) (n : ℕ → ℕ) (q : ℝ), 0<q ∧ (∀k, 4≤n k) ∧
      (CertificateChecker.totalValue (CertificateData4.cells i)
        (fun k => SpectralBridge4.scaledPower (n k))=
        q*((select3*transfer ((rows m 0 (55+10*m)).take r)*rowMatrix (rowMask m r)*
          transfer ((rows m 0 (55+10*m)).drop (r+1))*select2) 3 2 : ℝ)) ∧
      (∀d : Fin 7, CertificateChecker.eventValue (CertificateData4.cells i)
        (fun k => SpectralBridge4.scaledPower (n k)) d=
        q*((select3*transfer ((rows m 0 (55+10*m)).take r)*
          eventRow (rowMask m r) ((d.val : ℤ)-3)*
          transfer ((rows m 0 (55+10*m)).drop (r+1))*select2) 3 2 : ℝ)) := by
  obtain ⟨i,n,⟨h⟩,hn⟩ := located_coverage m r hm hr
  refine ⟨i,n,weight (leftUses i++rightUses i) n,weight_pos _ _,hn,?_,?_⟩
  · have hv := (all_cell_values i n 0).1
    rw [(located_prefix h).1,(located_prefix h).2,rowMap_binding,located_mask h (by omega)] at hv
    simpa only [Matrix.mul_assoc] using hv
  · intro d
    have hv := (all_cell_values i n d).2
    rw [(located_prefix h).1,(located_prefix h).2,cut_binding,located_mask h (by omega)] at hv
    simpa only [Matrix.mul_assoc] using hv

end OneThird.LocatedCells5
