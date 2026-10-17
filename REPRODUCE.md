# Reproducing the Lean build, the axiom audit and the certificates

All commands are run from the repository root of a fresh clone.

## Lean (α family): clean-environment build and full axiom audit

```sh
scripts/reproduce_lean.sh
```

The script uses an existing elan in `$ELAN_HOME` or `~/.elan`, or installs elan
into `./.elan`. It then runs `./lean/lakew exe cache get` (prebuilt Mathlib),
`./lean/lakew build`, and `python3 -B lean/generate_audit7.py`.

Pinned versions:

| item | value |
|---|---|
| Lean toolchain | `leanprover/lean4:v4.35.0` (`lean/lean-toolchain`) |
| Mathlib | `v4.35.0`, commit `56a005855ea17e0b0958f73ec801ae140b0a1679` (`lean/lake-manifest.json`) |
| Lean sources | identical to commit `6786282` (this branch only adds tooling and documentation) |

Expected result: `Build completed successfully (1799 jobs).`, then the audit reports
10311 inventoried and 10311 audited declarations, allowed/observed axioms only
`propext`, `Classical.choice`, `Quot.sound`, no unexpected axioms, no missing
declarations or modules, and a source scan of 60 files with 0 hits for
`sorry`, `admit`, `native_decide`, `axiom`.

Measured run (2026-10-17, branch `repro-fixes`, Linux x86_64, 8 cores, 15 GB RAM,
default `lakew` settings `LEAN_NUM_THREADS=1`, `LAKE_NUM_THREADS=4`):

- Mathlib cache fetch/unpack: about 1.5 min (with a warm download cache);
- `lake build` of the project: about 19 min (1150 s);
- `generate_audit7.py`: about 30 s.

The audit regenerates `lean/Inventory7.lean`, `lean/CheckAxioms.lean`,
`lean/audit_inventory7.json`, `lean/audit_names7.txt`, `lean/axioms7.log`,
`lean/audit7.json` and `lean/source_scan7.json`. On this Linux run all of them were
byte-identical to the committed copies, which were produced on macOS/arm64
(see `lean/BUILD_STATUS7.md`); `git status` after the script shows no changes
to tracked files.

Other generators: `python3 lean/generate_finite_transfer7.py` regenerates
`lean/OneThird/FiniteTransferData7_*.lean` and `FiniteTransferVerified7.lean`
from the existing `GridData4_*` tables (output byte-identical to the committed files).

## Certificates (β, γ) and the independent two-generator check

```sh
python3 certificates/beta/beta_dominance/dominance_cert.py --check      # 2057 cases, ~10 s
python3 certificates/gamma_symleft/symleft_dominance/dominance_cert.py --check   # 2056 cases
python3 certificates/two_generator_check.py   # alpha 1006, beta 2056 (+endpoint), gamma 2056; ~1 min
python3 certificates/alpha/certify.py         # needs sympy
```

Both dominance checkers try to lower their own scheduling priority to niceness 10
and only print a warning if the operating system refuses (tested by simulating a
refusal: both still regenerate and match their certificates); priority has no
mathematical role. The γ checker also sets `OMP_NUM_THREADS=1` and prints its CPU time. (At commit `6786282` the β
checker instead *asserted* niceness ≥ 10 and had to be started with `nice -n 10`.)
The β checker compares the regenerated certificate with the stored one as parsed
JSON; the γ checker compares the encoded bytes.
