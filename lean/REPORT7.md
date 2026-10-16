# Round 7: actual-poset counting, dominance, and the alpha limit

All five requested goals are now proved in Lean for the original family. The final full build exits 0. The compiled-environment audit checks all **10,311** project declarations, including private and generated declarations, with no dependencies beyond `propext`, `Classical.choice`, and `Quot.sound`. All Round 6 declarations remain in the inventory. See [BUILD_STATUS7.md](BUILD_STATUS7.md) for pins, logs, the source scan, and reproducible commands.

## Exact statements and status

Here `FamilyRelation m` is definitionally `(familyOrder m).le`; `FamilyExtension m` consists of rank permutations respecting that actual order. `Balance6.delta` remains the Round 6 definition: the maximum over incomparable pairs of the minimum of their two uniform linear-extension probabilities. None of these definitions has been replaced by a transfer-count surrogate.

| Goal | Kernel-checked theorem | Status |
|---|---|---|
| 1. Actual extension total | `RowCounts7.extension_card_eq_E`: `(Nat.card (FamilyExtension m) : ℤ) = E m` | Closed for every natural `m` |
| 2. Actual bottom minority event | `BottomCounts7.bottom_card_eq_N`: the cardinality of extensions with `chainLabel m 1 0` before `chainLabel m 0 0`, cast to integers, equals `N m` | Closed for every natural `m` |
| 3. General pair-event numerical bridge | `HitRows7.H_eq_crossing`: `(Counting6.H m i j : ℤ) = InfiniteDominance5.crossing m i.val (FiniteGrid4.cutoff (i.val+1) (j.val+1))` | Closed for every `m,i,j` |
| 3, finite DP identification | `Balance7.H_eq_finite_pairEvent`: the same actual count equals result4's full-grid `pairEvent` for `m : Fin 8` | Closed for all eight parameters and every pair |
| 4. Actual balance constant | `Balance7.delta_eq_ratio`: `Balance6.delta m = (N m : ℝ) / E m` | Closed for every natural `m`, including zero |
| 5. Actual balance limit | `Balance7.delta_tendsto` | Closed with the exact alpha below |

The final limit is

```text
Filter.Tendsto Balance6.delta Filter.atTop
  (nhds ((115713181619 - 36 * Real.sqrt 6697) / 331705168868))
```

The two endpoint pairs attain the same maximum. `Balance7.bottom_balance` identifies the bottom balance with `N/E`; the existing actual-extension reflection theorem `Balance6.endpoint_balance_tie` identifies the top balance with it. The proof does not assert uniqueness.

## Counting bridge

`WalkCounting7` implements the announced finite recursive path type. A path of length zero carries a proof that its endpoints coincide and its vertex is allowed. A positive-length path carries the validity of its first vertex and either a horizontal-first or a vertical-first tail. Its equivalence with vertex-sequence paths is proved recursively in both directions. `latticeVertexEquiv` connects it with the independent Round 6 `LatticePath`; together with the existing extension/path bijection this transports genuine cardinalities, rather than assuming counting semantics.

`GridCounts7.G` is the cardinality of suffix paths of the necessary Manhattan length. Disjoint sum/product equivalences prove its recurrence, its terminal value, and its zero value outside the valid grid. Signed heights extend these counts by zero below the quadrant. `RowCounts7` proves that the six actual cardinalities in each row satisfy the same descending scan as `rowMatrix`. The terminal row uses the already specified virtual terminal seed. Backward induction gives `row_pathDP`; evaluation at the origin proves goal 1 using the existing all-parameter row-word/transfer identity.

`BottomCounts7` removes the forced first vertical edge by an equivalence. The remaining count is `G m 0 1`. The row-zero identity and `pathDP_bFirst_eq_N` prove goal 2. `Balance7.bottom_even`, `bottom_odd`, and `bottom_probability` explicitly identify these labels and the actual probability with labels `0,1` and `N/E`.

`PathEvents7.Hit` records the horizontal crossing at the row of an even-chain element, below the odd-chain threshold. Its equivalence with `Counting6.Below` is proved using the path labels, so the existing general extension-event equivalence applies. `HitCounts7` proves the disjoint recursive cardinality recurrence for that event. After its crossing row, the event count is zero; at the crossing row, a successful horizontal edge contributes the full suffix count.

`HitRows7` lifts this recurrence to the band rows. The event's last row is a clipped suffix vector; `clip_event` identifies clipping with the exact existing `eventRow`. Induction yields the prefix/event/suffix transfer product. The take/drop lemmas and coordinate selectors prove `H_eq_crossing`, with the saturated cutoff and all square/band boundary cases handled in Lean.

## Finite and infinite dominance

For `m < 8`, `FiniteTransfer7` supplies a generic induction identifying checked prefix/suffix vectors with the actual transfers. `FiniteTransferData7_0` through `_7` provide concrete bindings to the **existing result4 DP tables**. Each row product and each of seven event cutoffs is checked with kernel `decide`. `FiniteTransferVerified7` covers all `Fin 8` values. The event equalities bind those matrix products to result4's `eventCount`; hence `finite_crossing_bound` uses result4's already checked `pairCheck` inequalities. These bindings do not introduce an assumed counting or dominance hypothesis.

For `m >= 8`, `Balance7.every_cross_balance` invokes `InfiniteDominance5.transfer_dominance`, which already incorporates the uniform circuit instantiation and spectral certificate. `H_eq_crossing` supplies its previously missing actual-count interpretation. The two excluded endpoint cuts are identified arithmetically with the actual bottom/top pairs and handled by reflection and the bottom probability. The endpoint separator ensures `E>0` and `N/E<1/2` for every parameter.

`cross_balance` expresses the actual pair balance as `min(H,E-H)/E`. The all-parameter upper bound applies to all cross-chain pairs. The existing coverage theorem reduces every actual incomparable pair to such a pair. The bottom pair supplies the matching lower bound for the finite maximum. This proves `delta_eq_ratio` with no remaining hypotheses. Rewriting the existing algebraic `OneThird.ratio_tendsto` then proves the actual-poset limit.

## Verification, trust, and scope

All 18 new Round 7 modules are imported in `lean/OneThird.lean`. No existing source theorem was weakened. No `sorry`, `admit`, `native_decide`, or custom axiom occurs in the 60 scanned project sources. There are **zero uses of `native_decide`**. The audit includes all new theorems, concrete finite bindings, auxiliary declarations, and private declarations.

Python generators emit Lean statements and proofs; they are not mathematical trust assumptions. Incorrect generated vectors or bindings would fail the kernel checks. The proof depends on Lean's kernel and the imported Lean/Mathlib development with the three standard audited logical axioms. The handoff does not replace kernel arithmetic with a Python assertion or a native evaluation result.

There are no remaining gaps among goals 1–5. This round does not add an actual-poset strict-gap or uniqueness theorem; uniqueness is false because of reflection. The requested equality and limit do not require such a theorem. **symleft Lean not started**; no optional port is included.

The work and caches stayed inside this workspace; no private `refs/` material, `peczarski.pdf`, or secrets were used or included. The pins and CPU limits were preserved.

Checkpoints: `result7_checkpoint1.tgz` closes goal 1; `result7_checkpoint2.tgz` closes goal 2; `result7_checkpoint3.tgz` closes the all-parameter crossing bridge; `result7_checkpoint4.tgz` contains the full successful build through goals 4–5. The final audited checkpoint and handoff are `result7_checkpoint5.tgz` and `result7.tgz`. The final archive has an explicit file manifest with SHA-256 hashes and excludes dependency/build caches.
