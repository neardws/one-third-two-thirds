# All-pairs dominance for the β family (asymmetric-cap broken-rung ladder)

Date: 2026-10-15. Paper argument + exact rational certificate (stdlib `Fraction`/integers only). No Lean in this step.
(Codex generated the certificate and checker. Its session stalled before it wrote this report, so the report was assembled from the verified certificate, check.log and PROGRESS.md.)

## Theorem (paper + exact certificate)
Let P_m be the β family: a broken-rung ladder with n = 248+20m (m ≥ 0), asymmetric caps L=100 and a Chen period-10 core (residues {3,6,9}). The caps are defined in `family.py` and `../best_families/BELOW_caps_1003.json`. For **every m ≥ 0**:
1. The top endpoint pair (a_p, b_p) is the **unique** maximizing pair. Under reflection it becomes the bottom endpoint (a_1, b_1).
2. Every non-endpoint cross-chain pair has balance < 1743/5000 = 0.3486.
3. The other endpoint pair has balance < 6976869191857/20000000000000 (= 0.34884345959285). The target pair's uniform lower bound is strictly above this, so the two endpoints are never tied.
4. Hence δ(P_m) = N_m/E_m (the top-endpoint minority count over E_m), and δ(P_m) → β, where
   β = (70601103221348402231752613608561321408507 − 76527504√6697)/202386202979838556018601359840018770821908 < α. β < α is proved by exact square comparison.

## Coverage
- Spectral tail: the certificate covers all m ≥ 16 (K=8) with **2,057** exact rational row/cutoff interval cases. Each case uses the column-masked edge-insertion H_m(i,j) over all cross-chain pairs, as in REPORT3. Only the target endpoint is excluded from the strict bound.
- Finite grids: full ideal-grid exact-integer DP covers m = 0..15.
- Structure: `structure.py` proves the row word PRE(53) X(5)^m MID(11) Y(5)^m SUF(61) and the six-state band [-3,2] symbolically for all m. It uses nonnegative-affine source membership and residue checks, so it does not rely on finite sampling.
- Spectral: the active blocks satisfy charpoly z^4(z^2−164z+27). The exact projector expansion is over Q(√6697), as in REPORT3 §3. The endpoint count difference has three strictly positive quadratic-field coefficients, which gives a further all-m proof that the two endpoints are ordered.

## Commands
    python3 dominance_cert.py          # regenerate dominance_certificate.json
    python3 dominance_cert.py --check  # recompute all; requires exact equality with the saved JSON
The checker refuses to run under `python -O` (assertion_guard.log). The `--check` run PASSED (check.log): "Certificate regenerated and exactly matched. All exact rational checks passed: 2057".

## Proved vs open
- Proved (paper + certificate): δ(P_m) = top-endpoint ratio for all m ≥ 0, and δ(P_m) → β < α.
- Not done: a Lean formalization, and an independent second implementation of the interval engine.
- Search for families beating β: not run in this step (budget was spent on the certificate). Open.

## Files
family.py, structure.py, arithmetic.py, dominance_cert.py, dominance_certificate.json, generate.log, check.log, PROGRESS.md, inspection.log
