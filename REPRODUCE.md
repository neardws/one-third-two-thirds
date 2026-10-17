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
python3 certificates/limits_and_cP.py         # unified transfer form, exact limits, c_P corollary; ~1 s
python3 certificates/pdagger/verify_pdagger.py   # finite P-dagger (n=248), standalone; ~0.2 s
python3 certificates/rank_one_limits.py       # rank-one limit formula, v_other, Chen-cap example; ~4 s
python3 certificates/row_words.py             # compact row words of the paper vs JSON and structure.py
```

All of the above (except `certify.py`, which needs `sympy`) are run by
`scripts/check_certificates.sh`.

`certificates/pdagger/verify_pdagger.py` reads only `certificates/pdagger/pdagger.json`
(the broken-rung set B† and the stored N†, E†). It rebuilds the order from the generating
relations, finds all order ideals by a down-set test, computes every cross-chain balance
with an exact integer path DP, checks N† and E†, checks that (a_1,b_1) is the unique
maximizer (runner-up gap ≈ 3.1745e-14), and proves δ(P†) < γ, δ(P†) < β and δ(P†) < c_P by
exact integer comparisons. It does not use any search log. (The older
`certificates/gamma_symleft/beat_beta/certify_candidates.py` is a historical search-time
script and needs uncommitted logs.)

`certificates/limits_and_cP.py` builds u_E, u_N, M, v and A from each family's row word,
checks E_m and δ(P_m) for m = 0, 1, 2 against a direct computation from the generating
relations, verifies each closed-form limit exactly in Q(√6697), and proves N_m/E_m < c_P for
every m ≥ 0 (finite verification lemma with K = 1, plus m = 0).

`certificates/rank_one_limits.py` checks, for each family, an explicit right/left
eigenvector pair x, y of the period block for r = 82 + √6697, that the spectral projector
A(A − sI)/(r(r − s)) equals x yᵀ/(yᵀx), and that the limit equals (u_N x)/(u_E x), so only
the boundary vector at the target end survives. For β and γ it also checks the other
endpoint (the bottom pair in original coordinates) against a direct computation for
m = 0, 1, 2 and computes its limit (yᵀv_other)/(yᵀv). Here
v_other = Φ(SUF without its last two rows) · (Φ(S_{p−1}) − masked(Φ(S_{p−1}), 0)) · Φ(S_p) e_{−1},
and O_m = u_E A^m M A^m v_other counts the extensions with b_p before a_p in checker
coordinates, i.e. b_1 before a_1 in original coordinates (checked against a direct count).
It also evaluates Chen's family P(5k,5k) in the same framework: its row word is
`a b O` followed by the α block, and with the same eigenvector x_α the formula gives Chen's
limit (93 − √6697)/32.

`certificates/row_words.py` checks the compact letter-code row words printed in the paper
(Appendix A) against the stored certificates and against `structure.py`.

### Checker implementation details (no mathematical role)

Both dominance checkers regenerate the certificate from scratch and compare it with the
stored JSON. The β checker compares parsed JSON (`json.loads(...) == result`, which ignores
whitespace); the γ checker compares the encoded bytes (`path.read_bytes() == encoded`). In
both cases the regenerated mathematical content must agree exactly.

Scheduling priority plays no mathematical role. At commit `6786282` the β script asserted a
process niceness ≥ 10 (so it failed under default priority unless started with
`nice -n 10`), and the γ script called `os.getpriority`/`os.nice` without a guard, which fails
on systems that do not provide or permit these calls. Since the `repro-fixes` branch both
`main()` functions use the same code: they try to raise the niceness to 10 and, on
`AttributeError` or `OSError`, print a warning to standard error and continue. The γ script
also sets `OMP_NUM_THREADS=1` and prints its process CPU time. With the niceness calls forced
to fail, both checkers still regenerate and match their stored certificates (2057 and 2056
cases).
