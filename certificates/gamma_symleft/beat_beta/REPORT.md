# Search for width-2 ladder families below beta

Status: stopped at the user's final-step request; no additional searches were launched after that request. **Finite improvements below beta are exactly certified. A full growing-family balance-ratio limit below beta has NOT been certified; beating beta in the limit remains open.**

## Reference and definitions

The supplied beta is

    beta = (70601103221348402231752613608561321408507 - 76527504 sqrt(6697))
           / 202386202979838556018601359840018770821908.

All reported gaps use this exact algebraic number, not its rounded decimal. For a finite poset, delta is the maximum, over incomparable pairs, of the minority ordering probability. An endpoint probability alone is only a lower bound on this maximum. A finite delta below beta does not establish a growing-family limit below beta.

Work reused the supplied ladder construction, sparse exact DP, family structure checker, and quadratic-field arithmetic in `src/`. Some copied entry points have missing `cert` imports; the new scripts avoid those imports. No Lean work, external original checkout edits, PDF access, or refs-content access was performed.

## Search space actually covered

1. **Exact local neighborhoods at n=248:** six initial sweeps, followed by 24 continuation sweeps. Each sweep checks every one- and two-rung toggle among all 245 possible rung sources: 245 + binomial(245,2) = 30,135 candidates. Every move is ranked by integer cross multiplication of full all-pairs delta. Total: **904,050 exact evaluations**. The continuation starts from the saved result of the first six sweeps. These are 30 neighborhoods along an improving path, not all Hamming-distance-60 candidates. The configured sweep cap was reached with an improving move; no radius-two local-optimality claim is made (`complete=false`). The finite record itself is not automatically a growing-family definition.
2. **Short periods:** all nonempty binary residue subsets for each p=2,...,16, totaling **131,053 float screens**, with fixed beta caps of length 100 and reflected core. The tested size is n=208+8p for each p. This is one finite size per period; it is not an exhaustive search over all cap/phase/period combinations.
3. **Long periods:** p in {20,30,40,50,60,80}, complete Hamming-radius-zero/one/two neighborhoods of the repeated Chen word (residues congruent to 3,6,9 modulo 10), totaling **7,846 float screens**. Fixed beta caps; n=208+4p.
4. **Combined caps:** extracted distinct available caps at matching cap lengths from the supplied JSON files, tested all ordered cap combinations at each such length with the reflected period-10 core: **12 float screens**. Size rule is in `broad_search.py`.
5. **Local random perturbations:** **20,000 float screens** of 3,4,5,6,or 8 rung toggles around beta at n in {248,288,328,408}, deterministic seed 20261016.

Total broad screens: **158,911**. Candidates with float delta <= float(beta)+2e-16 were re-evaluated exactly: **3,672 exact checks**. Screen ties were retained. The float filter is a heuristic, not an interval guarantee that no candidate was missed. `screen.c` uses `long double` internally but returns double; it was smoke-checked against exact DP on 30 perturbed ladders. It does not make the final record decisions.

## Saved finite candidates

All files below are in `best_families/`. Their JSON includes the complete broken-rung set, cross-chain maps, unreduced minority/extension counts, witness, decimal gap, and explicit certification labels.

| File | n | Finite delta (rounded display) | Finite delta - beta | Status |
|---|---:|---:|---:|---|
| `FINITE_exact_local_248.json` | 248 | 0.3488434595928454710208128148900290308 | -8.247869358932e-15 | Exact finite improvement |
| `FINITE_broad_best.json` | 288 | 0.3488434595928463687830917587650478963 | -7.350107079988e-15 | Exact finite improvement |
| `symleft.json` | 248 | 0.3488434595928454710208128148900290315 | -8.247869358932e-15 | Exact finite improvement |
| `asym.json` | 248 | 0.3560521253168874444017082939704944375 | +7.208665724034e-03 | Rejected finite candidate |
| `symright.json` | 248 | 0.3560521253168889111850198609879992685 | +7.208665724035e-03 | Rejected finite candidate |

The best finite candidate has exact ratio

    651413227161569890696144661362095442432291791687618240
    / 1867351126266980493055916252346490607551032183835026048,

with witness (a_1,b_1). Its gap is approximately **-8.247869358932353e-15**. It is preserved from `logs/exact_local_248.json` as `best_families/FINITE_exact_local_248.json`; the original log remains intact. This is a successful finite improvement and a near-miss with respect to the requested certified-family goal.

`FINITE_broad_best.json` preserves `logs/broad_best.json`, including its search metadata. The three cap proposals `symleft`, `asym`, and `symright` retain the explicit cap/core family parameters. `asym` and `symright` are rejected: rebuilding their core introduces larger interior balances. They are saved to document this negative outcome, not presented as improvements.

## Quick symleft endpoint-limit evaluation

For the symmetric `symleft` family, n=248+20m, m>=0, let

    C = {1,5,8,9,12,13,17,20,21,25,28,29,33,36,37,
         43,49,55,61,67,73,79,85,91,97}.

Its broken sources are C, their reflection j -> n-4-j, and the core sources 100<=j<=(n-4)/2 with residues {3,6,9} modulo 10, together with their reflections. Chain relations are x_i < x_(i+2); unbroken rung relations are x_i < x_(i+3), with zero-based source indices.

The endpoint minority probability has the **exact certified limit**

    gamma_endpoint = (113344761041171128772377413341625230454875
                      - 4782969 sqrt(6697))
                     / 324915826638865693871423059126368044433152

    = 0.348843459592845471020812814890029031575563393998724784296627962244080712978955196640231395

    gamma_endpoint - beta = -8.24786935893235317251512921070417638094182693013038491649919072167504616070947066908165518E-15.

`evaluate_symleft_limit.py` proves the row word PRE X^m MID X^m SUF using **135 affine cases**, adapted from the supplied symbolic structure checker. It verifies the matrix annihilator X^4(X^2-164X+27I)=0 and exact projectors for rho=82+sqrt(6697) and sigma=82-sqrt(6697). Since 0<sigma<rho, X^m/rho^m tends to the certified dominant projector. Applying it on both sides yields the displayed endpoint limit. Its comparison to beta uses exact rational arithmetic and squared comparisons; decimal evaluation is only for display. No guessed recurrence or floating-point sign decision is used.

Full finite all-pairs DP agrees with the endpoint formula at m=0,1,2,4,8,16,32 (n=248,268,288,328,408,568,888). **These checks are finite evidence only.** The uniform upper bound on every other pair as m grows is missing. Thus the script certifies the endpoint limit, **not** delta(P_m) -> gamma_endpoint, and does **not** settle the requested limit improvement. `logs/symleft_endpoint_limit.json` and `best_families/symleft.json` explicitly set `balance_ratio_limit_certified=false`.

## Exact checks and reproduction

Run from this folder, with inherited process niceness at least 10:

```sh
OMP_NUM_THREADS=1 python3 certify_candidates.py
OMP_NUM_THREADS=1 python3 evaluate_symleft_limit.py
```

Both reject Python `-O`. The finite checker recomputes all pairs with the sparse integer DP and the supplied independent dense ideal-grid implementation (`src/w2lib.py`); counts, ratios and witnesses agree for all five saved candidates. For N/E, comparison below beta checks z=A*E-C*N>0 and z^2>76527504^2*6697*E^2, where A and C are beta's numerator constant and denominator. This certifies the finite improvements exactly.

The endpoint checker verifies its algebraic comparisons by rational squared comparisons in Q(sqrt(6697)). Logs: `logs/finite_certification.json`, `logs/symleft_endpoint_limit.json`, and their console output where saved. The supplied beta dominance report is background evidence; its missing full dominance engine was not reconstructed or claimed rerun here.

Search entry points are `exact_local.py` and `broad_search.py`; they are **not** part of final verification. `exact_local.py` automatically resumes its saved broken set; to reproduce the original six-sweep initial run, use a clean log destination and set the initial sweep count to six, then continue for 24. Current scripts retain the final 24-sweep configuration. Exhaustive coverage claims refer only to completed loops above.

## CPU and execution controls

| Measured work | Process CPU seconds |
|---|---:|
| Initial six exact sweeps | 66.099306 |
| 24-sweep exact continuation | 260.499828 |
| Broad search, including exact screening checks | 4.373055 |
| Final independent finite certification | 0.026580 |
| Quick endpoint evaluation and finite samples | 0.032699 |
| **Measured total** | **331.031468 = 0.091953 CPU-hours** |

These are process CPU times, not wall time. Lightweight code inspection, compilation, the 30-case float smoke check, and report assembly were not instrumented, so this is not an exact whole-session CPU ledger; total use is approximately **0.092 CPU-hours**, far below four CPU-hours. The endpoint calculation took under one CPU-second, well below the final-step 20 CPU-minute allowance. The requested four-hour budget was an upper bound; it was not exhausted before the user's stop-search instruction.

At most two search processes overlapped. Search and certificate processes verified inherited niceness >=10. OMP_NUM_THREADS=1 was set. Searches check load every 500 candidates and pause in five-second increments while one-minute load exceeds six. Observed loads were below six, including the final observation (~1.98). No workers were launched after the final-step request; both searches had already finished. Per-command process handles had closed before final verification.

## Certification status

- **Certified:** saved finite all-pairs improvements below beta, with independent integer DP agreement and exact algebraic comparisons.
- **Certified:** the symmetric family's endpoint limiting probability gamma_endpoint is strictly below beta.
- **Uncertified/open:** a family whose full balance-ratio limit is strictly below beta. The missing step is uniform all-pairs dominance or a sufficient uniform limsup bound. No claim of a new certified balance-ratio limit is made.
