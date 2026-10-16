# Exact certificate: broken-rung ladder family F

Run: `python3 certify.py [MCHK]` (needs sympy, ~1 s; default MCHK=40, certificate.json was built with MCHK=100).
Files: `family.py` (definition of the family), `certify.py` (all checks; every assert is exact integer or algebraic arithmetic), `certificate.json` (all matrices and data), `lean/` (Lean 4 + Mathlib formal certificate; see BUILD_STATUS.md for checked declarations and proof status).

## Family
n = 108+20m. L_{n,B} has elements 0..n−1 with relations i<i+2 and i<i+3 for i∉B. The broken set is B = C* ∪ {44≤j≤(n−4)/2 : j mod 10 ∈ {3,6,9}}, closed under j↦n−4−j, with
C* = {1,5,8,9,12,13,17,20,21,25,28,29,33,36,39,43}.
The chains are a = even elements and b = odd elements (p = q = n/2). Linear extensions correspond to lattice paths in the grid of order ideals (i,j). The bottom pair is (a1,b1).

## What is proved (exact arithmetic, for all m ≥ 0)
1. **Band and word structure.** Every valid ideal (i,j) satisfies −3 ≤ j−i ≤ 2. A row of the grid is therefore described by its mask (the set of valid offsets). The sequence of row masks for n=108+20m equals the word PRE·X^m·MID·Y^m·SUF, where X=Y is a fixed block of 5 rows (one period of 10 elements).
   This decomposition is now proved symbolically for **all m≥0**, including m=0: see [REPORT2.md](REPORT2.md), and the Lean theorems `orderIdeal_band`, `valid_iff_local`, and `row_word`. Lean also proves the transfer factorization and equality with an independently defined row-scan path DP. The full linear-extension/lattice-path bijection is kernel checked in Round 6. Round 7 proves the path-cardinality/DP identification, the actual-poset balance formula for every parameter, and its alpha limit (see [REPORT7.md](REPORT7.md)).
2. **Transfer matrices.** The count G(i,j) of paths from (i,j) to the top satisfies G(i,j) = G(i+1,j) + G(i,j+1) on valid cells. Each row gives an exact 6×6 integer map, which yields
   E_m = #L(P) = uE·A^m·M·A^m·v and N_m = #{extensions with b1 before a1} = uN·A^m·M·A^m·v.
   The all-pairs certificate below proves that δ is attained at both endpoint pairs for every m≥0. Its eight finite-exception checks also compare the matrix counts with an independent full-grid DP.
3. **Characteristic polynomials.** χ_A(z) = z^4(z²−164z+27), so the roots are r,s = 82±√6697 with rs = 27. Let K = Aᵀ⊗A (36×36), so that a_m = vec(M)ᵀK^m(u⊗v). Then χ_K = z^32(z−27)²(z²−26842z+729).
4. **Recurrence.** Let q(z) = (z−27)(z²−26842z+729) = z³−26869z²+725463z−19683. We checked vec(M)ᵀK^k q(K)w = 0 for k=0..35, for both w_E and w_N. By Cayley–Hamilton for K this forces the sequence to vanish for all k. Hence E_{m+3} = 26869E_{m+2} − 725463E_{m+1} + 19683E_m for **all m ≥ 0**, and the same holds for N.
5. **Limit.** The dominant root is ρ = 13421+164√6697 = r². Write E_m = c_E ρ^m + O(27^m) and similarly for N, where c = (a_2−(27+ρ')a_1+27ρ'a_0)/((ρ−27)(ρ−ρ')). We have c_E > 0, and the exact simplification gives
   **lim N_m/E_m = α = (115713181619−36√6697)/331705168868 ≈ 0.348843459593420226915**,
   with minimal polynomial 1326820675472x²−925705452952x+161463150497 (checked).
   Since α < 1/2, the bottom-pair balance min(N,E−N)/E tends to α.

## All-pairs dominance (paper + exact certificate)

For **every m≥0**, the two endpoint pairs (a1,b1) and (a_p,b_q) tie for maximum balance, and

    δ(P_m) = N_m/E_m.

Every other pair is **at most as balanced**, and in fact has balance strictly below 0.3486, whereas N_m/E_m>0.34884. Thus there is a uniform non-endpoint gap greater than 3/12500. Uniqueness is false: the order-reversing reflection explains the top/bottom tie.

[REPORT3.md](REPORT3.md) gives the proof. `dominance_cert.py` verifies 1,006 exact rational spectral-interval cases covering all positions for m≥8, plus full-grid exact checks of m=0,...,7. The saved certificate is [dominance_certificate.json](dominance_certificate.json). Recheck it with:

```sh
python3 dominance_cert.py --check
```

Consequently δ(P_m) tends to the alpha displayed above. **The actual-poset formula and limit are now fully Lean verified for every m≥0.** Round 7 connects actual extension and pair-event cardinalities to the certified transfer crossings, binds the finite cases to result4 DP tables, and proves `Balance7.delta_eq_ratio` and `Balance7.delta_tendsto`. See [REPORT7.md](REPORT7.md) and [BUILD_STATUS7.md](BUILD_STATUS7.md): full build exit 0, 10,311 declarations audited, no proof placeholders or native evaluation proofs.

## Build and research notes

See [BUILD_STATUS.md](BUILD_STATUS.md) for the exact Lean/Mathlib pins, proof status and final build output, and [REPORT.md](REPORT.md) for the literature survey and ranked routes to prove all-pairs dominance.

With Lean/Elan on PATH, run `cd lean && lake build`. This workspace also has a local installation: `./lean/lakew build` runs the same Lake build while keeping the toolchain and Mathlib caches inside the project. To use the literal command with that installation:

```sh
export ELAN_HOME="$PWD/.elan"
export PATH="$ELAN_HOME/bin:$PATH"
export MATHLIB_CACHE_DIR="$PWD/.cache/mathlib"
cd lean
lake build
```

`python3 audit_pairs.py 100` regenerates the finite exact pair audit (`pair_audit.json`). `python3 compare_constants.py` regenerates rational enclosures proving the proposed alpha is strictly below Sah's published limit (`constant_comparison.json`). These older finite audits are supplementary; the new spectral certificate supplies the uniform dominance proof.

The all-parameter structural follow-up and its precise formalization boundary are recorded in [REPORT2.md](REPORT2.md) and [BUILD_STATUS2.md](BUILD_STATUS2.md).

The paper plus exact certificate dominance proof is recorded in [REPORT3.md](REPORT3.md). The result4 Lean scope is in [REPORT4.md](REPORT4.md) and [BUILD_STATUS4.md](BUILD_STATUS4.md): all 1,006 spectral numerical cases, the actual spectral tail enclosure, and all eight finite-grid DP cases are kernel checked. At the result4 boundary the uniform circuit-to-row identities and the linear-extension/path cardinality bijection were still open. Results5 and6 close those two gaps. Round 7 closes the counting-to-DP identification and final actual-poset balance theorem.

Result5 closes the uniform circuit-to-row transfer identities for the spectral range `m >= 8` and proves the endpoint separator `0.34884 < N_m/E_m < 1/2` for every `m >= 0`. Lean now proves infinite-range dominance for the actual row-transfer crossing expressions. The extension/path cardinality bijection and actual-poset balance theorem remain open. See [REPORT5.md](REPORT5.md) and [BUILD_STATUS5.md](BUILD_STATUS5.md) for that historical boundary and the full 2824-declaration audit.

Round 6 proves the full bijection between actual linear extensions and independently defined unit-step ideal-grid paths, transports all pair-event cardinalities, identifies the bottom event with a vertical first step, and proves the endpoint tie on actual extension counts and balances. `Balance6.delta` defines the actual uniform-probability maximum over incomparable pairs. At the Round 6 boundary, the remaining Lean gap was the path-cardinality recurrence and its DP/transfer identification; the actual formula `delta m = N_m/E_m` and its limit were therefore still open. See [REPORT6.md](REPORT6.md) and [BUILD_STATUS6.md](BUILD_STATUS6.md) for the precise boundary and expanded audit.

Round 7 closes all five counting/dominance goals without weakening the actual-poset definitions. The final handoff is `result7.tgz`; [REPORT7.md](REPORT7.md) describes the proofs and [BUILD_STATUS7.md](BUILD_STATUS7.md) records the green build and full axiom audit.
