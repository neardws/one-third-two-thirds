module
public import OneThird.Certificate
public import Mathlib.Tactic.FinCases

@[expose] public section
namespace OneThird.Structure
set_option maxRecDepth 100000
set_option maxHeartbeats 0

def p (m : ℕ) : ℤ := 54 + 10 * (m : ℤ)
def half (m : ℕ) : ℤ := 52 + 10 * (m : ℤ)
def mirror (m : ℕ) (x : ℤ) : ℤ := 104 + 20 * (m : ℤ) - x

abbrev cap (x : ℤ) : Prop :=
  x=1 ∨ x=5 ∨ x=8 ∨ x=9 ∨ x=12 ∨ x=13 ∨ x=17 ∨ x=20 ∨
  x=21 ∨ x=25 ∨ x=28 ∨ x=29 ∨ x=33 ∨ x=36 ∨ x=39 ∨ x=43
instance (x : ℤ) : Decidable (cap x) := by infer_instance

abbrev interior (m : ℕ) (x : ℤ) : Prop :=
  44 ≤ x ∧ x ≤ half m ∧ (x%10=3 ∨ x%10=6 ∨ x%10=9)
instance (m : ℕ) (x : ℤ) : Decidable (interior m x) := by infer_instance

abbrev broken (m : ℕ) (x : ℤ) : Prop :=
  cap x ∨ interior m x ∨ cap (mirror m x) ∨ interior m (mirror m x)
instance (m : ℕ) (x : ℤ) : Decidable (broken m x) := by infer_instance

/-- Uniform bounded broken-run lemma, including caps and the central seam. -/
theorem broken_no_two (m : ℕ) (x : ℤ) : ¬ (broken m x ∧ broken m (x+2)) := by
  simp only [broken, cap, interior, half, mirror]
  omega

/-- Prefix ideals, expressed by downward closure under the cross-chain generators.
The chain generators are automatic for prefixes. Indices r,s below are zero based. -/
def Valid (m : ℕ) (i j : ℤ) : Prop :=
  0 ≤ i ∧ i ≤ p m ∧ 0 ≤ j ∧ j ≤ p m ∧
  (∀ r : ℤ, 0 ≤ r → 2*r+3 < 2*p m → ¬ broken m (2*r) → r+2 ≤ j → r+1 ≤ i) ∧
  (∀ s : ℤ, 0 ≤ s → 2*s+4 < 2*p m → ¬ broken m (2*s+1) → s+3 ≤ i → s+1 ≤ j)

/-- The ideal grid has uniformly bounded width, for every family parameter. -/
theorem band {m : ℕ} {i j : ℤ} (h : Valid m i j) : -3 ≤ j-i ∧ j-i ≤ 2 := by
  obtain ⟨hi0, hip, hj0, hjp, he, ho⟩ := h
  constructor
  · by_contra hb
    have h1 : broken m (2*j+1) := by
      by_contra hn
      have := ho j hj0 (by omega) hn (by omega)
      omega
    have h2 : broken m (2*(j+1)+1) := by
      by_contra hn
      have := ho (j+1) (by omega) (by omega) hn (by omega)
      omega
    have := broken_no_two m (2*j+1)
    have : broken m (2*j+1+2) := by convert h2 using 1; ring
    exact broken_no_two m (2*j+1) ⟨h1, this⟩
  · by_contra hb
    have h1 : broken m (2*i) := by
      by_contra hn
      have := he i hi0 (by omega) hn (by omega)
      omega
    have h2 : broken m (2*(i+1)) := by
      by_contra hn
      have := he (i+1) (by omega) (by omega) hn (by omega)
      omega
    have : broken m (2*i+2) := by convert h2 using 1; ring
    exact broken_no_two m (2*i) ⟨h1, this⟩

/-- A finite-window criterion, suitable for executable mask computation. -/
abbrev LocalValid (m : ℕ) (i j : ℤ) : Prop :=
  0 ≤ i ∧ i ≤ p m ∧ 0 ≤ j ∧ j ≤ p m ∧
  -3 ≤ j-i ∧ j-i ≤ 2 ∧
  (j=i+2 → broken m (2*i)) ∧ (i=j+3 → broken m (2*i-5))
instance (m : ℕ) (i j : ℤ) : Decidable (LocalValid m i j) := by
  infer_instance

/-- Exact locality, not just a necessary band constraint. -/
theorem valid_iff_local (m : ℕ) (i j : ℤ) : Valid m i j ↔ LocalValid m i j := by
  constructor
  · intro h
    have hb := band h
    obtain ⟨hi0, hip, hj0, hjp, he, ho⟩ := h
    refine ⟨hi0, hip, hj0, hjp, hb.1, hb.2, ?_, ?_⟩
    · intro hij
      by_contra hn
      have := he i hi0 (by omega) hn (by omega)
      omega
    · intro hij
      by_contra hn
      have hh : ¬ broken m (2*j+1) := by
        have heq : 2*j+1 = 2*i-5 := by omega
        rwa [heq]
      have := ho j hj0 (by omega) hh (by omega)
      omega
  · rintro ⟨hi0, hip, hj0, hjp, hb1, hb2, he, ho⟩
    refine ⟨hi0, hip, hj0, hjp, ?_, ?_⟩
    · intro r hr0 hrp hn hrj
      by_contra hb
      have hri : r=i := by omega
      have hij : j=i+2 := by omega
      exact hn (by simpa only [hri] using he hij)
    · intro s hs0 hsp hn hsi
      by_contra hb
      have hsj : s=j := by omega
      have hij : i=j+3 := by omega
      have hbr := ho hij
      apply hn
      have heq : 2*i-5 = 2*s+1 := by omega
      rwa [heq] at hbr

abbrev Mask := Finset (Fin 6)
/-- Bit t represents offset t-3. Bounds in LocalValid clip the grid edges. -/
def rowMask (m : ℕ) (i : ℕ) : Mask :=
  Finset.univ.filter (fun t => LocalValid m (i : ℤ) ((i : ℤ)+(t : ℤ)-3))

def L : Mask := {0,1,2,3,4}
def O : Mask := {1,2,3,4}
def R : Mask := {1,2,3,4,5}
def T : Mask := {0,1,2,3,4,5}
def pre : List Mask := [ {3,4}, {2,3,4}, O,L,R,L,R,L,O,L,R,L,O,L,R,L,O,L,R,L,O,O ]
def block : List Mask := [L,R,L,O,O]
def mid : List Mask := [L,R,L,O,O,L,O,R,L,O,O]
def suf : List Mask := [L,R,L,O,O,T,O,L,O,T,O,L,O,T,O,T,O,L,O,L,O,{0,1,2,3}]

theorem mask_pre (m : ℕ) (t : Fin 22) : rowMask m t = pre[t.val] := by
  ext d
  simp only [rowMask, Finset.mem_filter, Finset.mem_univ, true_and]
  fin_cases t <;> fin_cases d <;>
    simp [LocalValid, pre, L, O, R, p, broken, cap, interior, half, mirror] <;>
    omega

theorem mask_left (m k : ℕ) (hk : k < m) (t : Fin 5) :
    rowMask m (22+5*k+t) = block[t.val] := by
  ext d
  simp only [rowMask, Finset.mem_filter, Finset.mem_univ, true_and]
  fin_cases t <;> fin_cases d <;>
    simp [LocalValid, block, L, O, R, p, broken, cap, interior, half, mirror] <;> omega

theorem mask_mid (m : ℕ) (t : Fin 11) : rowMask m (22+5*m+t) = mid[t.val] := by
  ext d
  simp only [rowMask, Finset.mem_filter, Finset.mem_univ, true_and]
  fin_cases t <;> fin_cases d <;>
    simp [LocalValid, mid, L, O, R, p, broken, cap, interior, half, mirror] <;> omega

theorem mask_right (m k : ℕ) (hk : k < m) (t : Fin 5) :
    rowMask m (33+5*m+5*k+t) = block[t.val] := by
  ext d
  simp only [rowMask, Finset.mem_filter, Finset.mem_univ, true_and]
  fin_cases t <;> fin_cases d <;>
    simp [LocalValid, block, L, O, R, p, broken, cap, interior, half, mirror] <;> omega

theorem mask_suf (m : ℕ) (t : Fin 22) : rowMask m (33+10*m+t) = suf[t.val] := by
  ext d
  simp only [rowMask, Finset.mem_filter, Finset.mem_univ, true_and]
  fin_cases t <;> fin_cases d <;>
    simp [LocalValid, suf, L, O, R, T, p, broken, cap, interior, half, mirror] <;> omega


/-- Consecutive rows of the actual ideal grid. -/
def rows (m start len : ℕ) : List Mask :=
  (List.range len).map (fun k => rowMask m (start+k))

theorem rows_add (m start a b : ℕ) :
    rows m start (a+b) = rows m start a ++ rows m (start+a) b := by
  simp [rows, List.range_add, List.map_map, Nat.add_assoc]

private theorem rows_of_pointwise (m start : ℕ) (xs : List Mask)
    (h : ∀t : Fin xs.length, rowMask m (start+t) = xs[t.val]) :
    rows m start xs.length = xs := by
  apply List.ext_getElem (by simp [rows])
  intro k hk1 hk2
  simpa [rows] using h ⟨k, hk2⟩

private theorem rows_blocks (m start count : ℕ)
    (h : ∀k, k<count → rows m (start+5*k) 5 = block) :
    rows m start (5*count) = (List.replicate count block).flatten := by
  induction count with
  | zero => simp [rows]
  | succ count ih =>
    rw [Nat.mul_succ, rows_add]
    rw [ih (fun k hk => h k (by omega)), h count (by omega)]
    simp [List.replicate_succ', List.flatten_append]

/-- Full row-word identity, with both repeated regions empty when m=0. -/
theorem row_word (m : ℕ) :
    rows m 0 (55+10*m) = pre ++ (List.replicate m block).flatten ++ mid ++
      (List.replicate m block).flatten ++ suf := by
  have hp : rows m 0 22 = pre :=
    rows_of_pointwise m 0 pre (fun t => by simpa using mask_pre m t)
  have hl : rows m 22 (5*m) = (List.replicate m block).flatten := by
    apply rows_blocks
    intro k hk
    exact rows_of_pointwise m (22+5*k) block (fun t => mask_left m k hk t)
  have hm : rows m (22+5*m) 11 = mid :=
    rows_of_pointwise m (22+5*m) mid (fun t => mask_mid m t)
  have hr : rows m (33+5*m) (5*m) = (List.replicate m block).flatten := by
    apply rows_blocks
    intro k hk
    exact rows_of_pointwise m (33+5*m+5*k) block (fun t => mask_right m k hk t)
  have hs : rows m (33+10*m) 22 = suf :=
    rows_of_pointwise m (33+10*m) suf (fun t => mask_suf m t)
  have hn : 55+10*m = 22+5*m+11+5*m+22 := by omega
  rw [hn]
  simp only [rows_add, Nat.zero_add]
  rw [hp, hl, hm]
  have h1 : 22+5*m+11 = 33+5*m := by omega
  have h2 : 33+5*m+5*m = 33+10*m := by omega
  rw [h1, h2, hr, hs]

end OneThird.Structure
