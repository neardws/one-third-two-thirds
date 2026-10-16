module
public import OneThird.Counting6
@[expose] public section
namespace OneThird.FirstStep6
open Structure LinearExtensions4 ChainPrefixes5 LatticePaths6 Counting6
set_option maxHeartbeats 0

/-- The first interior vertex; this is a genuine grid event. -/
def FirstOdd {m : ℕ} (w : LatticePath m) : Prop :=
  w.vertex ⟨1,by dsimp [size]; omega⟩=(0,1)

theorem first_odd_iff (m : ℕ) (w : LatticePath m) :
    FirstOdd w ↔
      w.toExtension.val (chainLabel m 1 0)<w.toExtension.val (chainLabel m 0 0) := by
  have hs := w.step ⟨0,by dsimp [size]; omega⟩
  have hz : w.vertex ⟨0,by dsimp [size]; omega⟩=(0,0) := w.start
  rw [hz] at hs
  have he := w.toExtension_prefix ⟨1,by dsimp [size]; omega⟩ (chainLabel m 0 0)
  have ho := w.toExtension_prefix ⟨1,by dsimp [size]; omega⟩ (chainLabel m 1 0)
  rcases hs with hs | hs
  · have he' : (w.toExtension.val (chainLabel m 0 0)).val<1 := by
      apply he.mp
      have hp : Prefix 1 0 0 := ⟨0,by omega,Or.inl ⟨rfl,by omega⟩⟩
      simpa [hs,chainLabel] using hp
    have ho' : ¬(w.toExtension.val (chainLabel m 1 0)).val<1 := by
      intro h
      have hh := ho.mpr h
      have hf : ¬Prefix 1 0 1 := by
        rintro ⟨r,hr,h | h⟩ <;> omega
      exact hf (by simpa [hs,chainLabel] using hh)
    have hn : ¬FirstOdd w := by
      unfold FirstOdd
      rw [hs]
      decide
    constructor
    · exact fun h => False.elim (hn h)
    · intro h
      change (w.toExtension.val (chainLabel m 1 0)).val<
        (w.toExtension.val (chainLabel m 0 0)).val at h
      omega
  · have he' : ¬(w.toExtension.val (chainLabel m 0 0)).val<1 := by
      intro h
      have hh := he.mpr h
      have hf : ¬Prefix 0 1 0 := by
        rintro ⟨r,hr,h | h⟩ <;> omega
      exact hf (by simpa [hs,chainLabel] using hh)
    have ho' : (w.toExtension.val (chainLabel m 1 0)).val<1 := by
      apply ho.mp
      have hp : Prefix 0 1 1 := ⟨0,by omega,Or.inr ⟨rfl,by omega⟩⟩
      simpa [hs,chainLabel] using hp
    constructor
    · intro _
      change (w.toExtension.val (chainLabel m 1 0)).val<
        (w.toExtension.val (chainLabel m 0 0)).val
      omega
    · intro _
      exact hs

noncomputable def bottomFirstOddEquiv (m : ℕ) :
    {e : FamilyExtension m // e.val (chainLabel m 1 0)<e.val (chainLabel m 0 0)} ≃
    {w : LatticePath m // FirstOdd w} :=
  (extensionPathEquiv m).subtypeEquiv (fun e => by
    change e.val (chainLabel m 1 0)<e.val (chainLabel m 0 0) ↔ FirstOdd (ofExtension m e)
    rw [first_odd_iff,toExtension_ofExtension])

/-- The actual bottom minority cardinality is exactly the number of paths
whose first edge is vertical, independently of any recurrence interpretation. -/
theorem bottom_card_eq_first_odd (m : ℕ) :
    Nat.card {e : FamilyExtension m // e.val (chainLabel m 1 0)<e.val (chainLabel m 0 0)} =
    Nat.card {w : LatticePath m // FirstOdd w} :=
  Nat.card_congr (bottomFirstOddEquiv m)

end OneThird.FirstStep6
