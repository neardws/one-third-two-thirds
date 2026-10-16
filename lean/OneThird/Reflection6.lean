module
public import OneThird.Counting6
public import OneThird.Dominance
@[expose] public section
namespace OneThird.Reflection6
open Structure LinearExtensions4 LatticePaths6 Counting6
set_option maxHeartbeats 0

theorem rev_label (m : ℕ) (x : Fin (size m)) :
    (x.rev : ℤ)=flipLabel m (x : ℤ) := by
  simp only [Fin.val_rev,flipLabel,p]
  have hx := x.isLt
  dsimp [size] at hx ⊢
  omega

theorem relation_rev {m : ℕ} {x y : Fin (size m)} (h : FamilyRelation m x y) :
    FamilyRelation m y.rev x.rev := by
  change Relation.ReflTransGen (Generator m) (y.rev : ℤ) (x.rev : ℤ)
  rw [rev_label,rev_label]
  exact generated_reflection h

/-- Reverse both the original labels and the extension ranks. -/
def reflect {m : ℕ} (e : FamilyExtension m) : FamilyExtension m :=
  ⟨Fin.revPerm.trans (e.val.trans Fin.revPerm),by
    intro x y hxy
    change (e.val x.rev).rev≤(e.val y.rev).rev
    exact Fin.rev_le_rev.mpr (e.property _ _ (relation_rev hxy))⟩

theorem reflect_rank {m : ℕ} (e : FamilyExtension m) (x : Fin (size m)) :
    (reflect e).val x=(e.val x.rev).rev := rfl

theorem reflect_involutive (m : ℕ) : Function.Involutive (@reflect m) := by
  intro e
  apply Subtype.ext
  apply Equiv.ext
  intro x
  change (e.val x.rev.rev).rev.rev=e.val x
  simp

def reflectionEquiv (m : ℕ) : Equiv.Perm (FamilyExtension m) :=
  ⟨reflect,reflect,reflect_involutive m,reflect_involutive m⟩

theorem reflect_before {m : ℕ} (e : FamilyExtension m) (x y : Fin (size m)) :
    (reflect e).val x<(reflect e).val y ↔ e.val y.rev<e.val x.rev := by
  rw [reflect_rank,reflect_rank,Fin.rev_lt_rev]

def reflectionEventEquiv (m : ℕ) (x y : Fin (size m)) :
    {e : FamilyExtension m // e.val x<e.val y} ≃
    {e : FamilyExtension m // e.val y.rev<e.val x.rev} :=
  (reflectionEquiv m).subtypeEquiv (fun e => by
    change e.val x<e.val y ↔ (reflect e).val y.rev<(reflect e).val x.rev
    rw [reflect_before,Fin.rev_rev,Fin.rev_rev])

/-- Reflection preserves event counts with the order of the reflected pair
reversed; this is a theorem about actual extensions, not transfer matrices. -/
theorem reflection_event_card (m : ℕ) (x y : Fin (size m)) :
    Nat.card {e : FamilyExtension m // e.val x<e.val y} =
    Nat.card {e : FamilyExtension m // e.val y.rev<e.val x.rev} :=
  Nat.card_congr (reflectionEventEquiv m x y)

theorem endpoint_minority_tie (m : ℕ) :
    Nat.card {e : FamilyExtension m // e.val 1<e.val 0} =
    Nat.card {e : FamilyExtension m //
      e.val (0 : Fin (size m)).rev<e.val (1 : Fin (size m)).rev} :=
  reflection_event_card m 1 0

end OneThird.Reflection6
