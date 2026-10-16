module
public import OneThird.CertificateChecker

@[expose] public section
namespace OneThird.FiniteGrid4
open Structure
set_option maxHeartbeats 0
set_option maxRecDepth 100000

abbrev Table (p : ℕ) := Fin (p+1) → Fin 6 → ℕ

/-- A compressed table, extended by zero to the entire quadrant. The conditions
explicitly clip both square-grid boundaries and both edges of the proved band. -/
def entry {p : ℕ} (a : Table p) (i j : ℕ) : ℕ :=
  if hi : i≤p then
    if j≤p then
      if hb : i ≤ j + 3 ∧ j ≤ i + 2 then a ⟨i,by omega⟩ ⟨j+3-i,by omega⟩ else 0
    else 0
  else 0

def forwardStep (m : ℕ) (a : Table (54+10*m)) (i j : ℕ) : Prop :=
  entry a i j = if LocalValid m (i : ℤ) (j : ℤ) then
    if i+j=0 then 1 else (if i=0 then 0 else entry a (i-1) j) +
      (if j=0 then 0 else entry a i (j-1)) else 0

def backwardStep (m : ℕ) (a : Table (54+10*m)) (i j : ℕ) : Prop :=
  entry a i j = if LocalValid m (i : ℤ) (j : ℤ) then
    if i=54+10*m ∧ j=54+10*m then 1 else entry a (i+1) j + entry a i (j+1) else 0

instance (m) (a : Table (54+10*m)) (i j) : Decidable (forwardStep m a i j) :=
  inferInstanceAs (Decidable (_ = _))
instance (m) (a : Table (54+10*m)) (i j) : Decidable (backwardStep m a i j) :=
  inferInstanceAs (Decidable (_ = _))

def forwardRow (m : ℕ) (a : Table (54+10*m)) (i : Fin (55+10*m)) : Prop :=
  ∀j : Fin (55+10*m), forwardStep m a i j

def backwardRow (m : ℕ) (a : Table (54+10*m)) (i : Fin (55+10*m)) : Prop :=
  ∀j : Fin (55+10*m), backwardStep m a i j
instance (m) (a : Table (54+10*m)) (i : Fin (55+10*m)) : Decidable (forwardRow m a i) :=
  Fintype.decidableForallFintype
instance (m) (a : Table (54+10*m)) (i : Fin (55+10*m)) : Decidable (backwardRow m a i) :=
  Fintype.decidableForallFintype

/-- Six-column form of the horizontal-edge sum, with explicit lower clipping. -/
def eventCount {p : ℕ} (f g : Table p) (i : ℕ) (d : Fin 7) : ℕ :=
  ∑t : Fin 6, if t.val < d.val ∧ 3 ≤ i + t.val then
    entry f (i-1) (i+t.val-3) * entry g i (i+t.val-3) else 0

def pairCheck {p : ℕ} (f g : Table p) (E N i : ℕ) (d : Fin 7) : Prop :=
  eventCount f g i d≤E ∧
  if (i=1 ∨ i=p) ∧ d.val=3 then min (eventCount f g i d) (E-eventCount f g i d)=N
  else 5000*min (eventCount f g i d) (E-eventCount f g i d)<1743*E
instance {p : ℕ} (f g : Table p) (E N i : ℕ) (d : Fin 7) : Decidable (pairCheck f g E N i d) :=
  by
  unfold pairCheck
  infer_instance

/-- Any two full-grid forward tables satisfying the recurrence agree.
This certifies that cached tables are DP solutions, independently of generation. -/
theorem forward_unique {m : ℕ} (f g : Table (54+10*m))
    (hf : ∀i j, i≤54+10*m → j≤54+10*m → forwardStep m f i j)
    (hg : ∀i j, i≤54+10*m → j≤54+10*m → forwardStep m g i j) :
    ∀i j, i≤54+10*m → j≤54+10*m → entry f i j=entry g i j := by
  have main : ∀n i j, i+j=n → i≤54+10*m → j≤54+10*m → entry f i j=entry g i j := by
    intro n
    induction n using Nat.strong_induction_on with
    | h n ih =>
      intro i j hn hi hj
      have hl : (if i=0 then 0 else entry f (i-1) j) =
          (if i=0 then 0 else entry g (i-1) j) := by
        by_cases h : i=0
        · simp [h]
        · simp only [h, ite_false]
          exact ih ((i-1)+j) (by omega) (i-1) j rfl (by omega) hj
      have hr : (if j=0 then 0 else entry f i (j-1)) =
          (if j=0 then 0 else entry g i (j-1)) := by
        by_cases h : j=0
        · simp [h]
        · simp only [h, ite_false]
          exact ih (i+(j-1)) (by omega) i (j-1) rfl hi (by omega)
      rw [hf i j hi hj, hg i j hi hj, hl, hr]
  exact fun i j hi hj => main (i+j) i j rfl hi hj

/-- All integer pair thresholds, represented directly by their crossing height. -/
def pairEvent {p : ℕ} (f g : Table p) (i j : ℕ) : ℕ :=
  ∑t : Fin 6, if 3 ≤ i + t.val ∧ i+t.val-3<j then
    entry f (i-1) (i+t.val-3) * entry g i (i+t.val-3) else 0

def cutoff (i j : ℕ) : Fin 7 := ⟨min (j+3-i) 6, by omega⟩

/-- The seven cutoffs exhaust every pair in the full square, including the
saturated thresholds outside the six-column band. -/
theorem pairEvent_eq_cutoff {p : ℕ} (f g : Table p) (i j : ℕ) :
    pairEvent f g i j=eventCount f g i (cutoff i j) := by
  apply Finset.sum_congr rfl
  intro t _
  have ht := t.isLt
  have he : (3 ≤ i + t.val ∧ i+t.val-3<j) ↔
      (t.val<(cutoff i j).val ∧ 3 ≤ i + t.val) := by
    simp only [cutoff]
    omega
  simp only [he]

structure Checked (m : ℕ) where
  f : Table (54+10*m)
  g : Table (54+10*m)
  E : ℕ
  N : ℕ
  total : entry g 0 0=E ∧ entry f (54+10*m) (54+10*m)=E
  minority : entry g 0 1=N
  positive : 0<E ∧ 2*N<E ∧ 100000*N>34884*E
  forward : ∀i, forwardRow m f i
  backward : ∀i, backwardRow m g i
  pairs : ∀i : Fin (54+10*m), ∀d : Fin 7, pairCheck f g E N (i.val+1) d

end OneThird.FiniteGrid4
