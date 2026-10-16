# Round 7 build and axiom status

All five Round 7 goals are kernel checked. See [REPORT7.md](REPORT7.md) for exact theorem names and proof scope.

## Pinned environment

- Lean: `leanprover/lean4:v4.35.0`, release commit `eb6cafb7290e8bd5f2937522d8d804f58f02bafc`, arm64-apple-darwin24.6.0.
- Mathlib: `v4.35.0`, commit `56a005855ea17e0b0958f73ec801ae140b0a1679` in `lean/lake-manifest.json`.
- Pins unchanged. Toolchain, dependency caches, and temporary files remain local to the workspace.
- `lean/lakew` exports `OMP_NUM_THREADS=1`, `LEAN_NUM_THREADS=1`, `LAKE_NUM_THREADS=4`; inherited scheduling priority was not changed.

## Final full build

Command from the workspace root: `./lean/lakew build`.

Exit code: **0**.

Full output: [lean/build7.log](lean/build7.log); exit-code artifact: [lean/build7.exit](lean/build7.exit).

Final output tail:

```text

Note: This linter can be disabled with `set_option linter.unusedTactic false`
warning: OneThird/LocatedCells5.lean:116:83: Used `tac1 <;> tac2` where `(tac1; tac2)` would suffice

Note: This linter can be disabled with `set_option linter.unnecessarySeqFocus false`
warning: OneThird/LocatedCells5.lean:134:87: Unused tactic linter: `<;>` should be replaced with `;` or be removed.

Note: This linter can be disabled with `set_option linter.unusedTactic false`
warning: OneThird/LocatedCells5.lean:134:87: Used `tac1 <;> tac2` where `(tac1; tac2)` would suffice

Note: This linter can be disabled with `set_option linter.unnecessarySeqFocus false`
✔ [1797/1799] Built OneThird.Balance7 (1.2s)
✔ [1798/1799] Built OneThird (1.0s)
Build completed successfully (1799 jobs).
```

The warnings in this tail are pre-existing tactic-linter warnings. All 18 new modules are imported by the default project root; no source module is missing from the compiled audit.

## Complete declaration audit

Regenerate with `python3 -B generate_audit7.py`, after a successful full build. It inventories the compiled environment by declaration-origin module, including private and generated declarations, generates `lean/CheckAxioms.lean`, and runs Lean's `#print axioms` for every inventoried name. It also checks preservation of the Round 6 inventory and coverage of every project source module.

- Generator exit: `0`.
- `CheckAxioms` exit: `0`.
- Inventoried declarations: **10311**.
- Audited declarations: **10311**.
- Allowed and observed axiom union: `propext`, `Classical.choice`, `Quot.sound`.
- Unexpected axioms: `[]`.
- Missing declarations: `[]`.
- Missing Round 6 declarations: `[]`.
- Missing source modules: `[]`.

Artifacts: [axioms7.log](lean/axioms7.log), [audit7.json](lean/audit7.json), [audit_inventory7.json](lean/audit_inventory7.json), [audit_names7.txt](lean/audit_names7.txt), [audit7_summary.log](lean/audit7_summary.log), and [generate_audit7.py](generate_audit7.py). The JSON contains the full per-declaration axiom list, not just the final theorem subset.

## Forbidden-token scan

[lean/source_scan7.json](lean/source_scan7.json) scans `lean/OneThird.lean` and every `lean/OneThird/*.lean`: **60 files, 0 hits**.

- Remaining `sorry`: **none**.
- Remaining `admit`: **none**.
- Every `native_decide` use: **none**.
- Custom axiom declarations or dependencies: **none**.

## Final claims

`RowCounts7.extension_card_eq_E`, `BottomCounts7.bottom_card_eq_N`, `HitRows7.H_eq_crossing`, `Balance7.H_eq_finite_pairEvent`, `Balance7.delta_eq_ratio`, and `Balance7.delta_tendsto` are all present in the compiled inventory and the full audit. The balance definition is the actual uniform-probability finite-poset maximum from Round 6. All requested goals are closed; symleft Lean not started.

The handoff `result7.tgz` contains the reports, Lean source/configuration tree without `.lake`, logs, complete audit JSON and inventory, and generators. `package_result7.py` verifies its manifest and every member hash. No private references, PDF, secrets, toolchains, or dependency caches are packaged.
