# Exact certificate: broken-rung ladder family F, step 1

Run: `python3 certify.py [MCHK]` (needs sympy, ~1 s; default MCHK=40, certificate.json was built with MCHK=100).
Files: `family.py` (definition of the family), `certify.py` (all checks; every assert is exact integer or algebraic arithmetic), `certificate.json` (all matrices and data), `lean/` (Lean 4 + Mathlib skeleton; statements only, `sorry`s still open).

## Family
n = 108+20m. L_{n,B} has elements 0..n−1 with relations i<i+2 and i<i+3 for i∉B. The broken set is B = C* ∪ {44≤j≤(n−4)/2 : j mod 10 ∈ {3,6,9}}, closed under j↦n−4−j, with
C* = {1,5,8,9,12,13,17,20,21,25,28,29,33,36,39,43}.
The chains are a = even elements and b = odd elements (p = q = n/2). Linear extensions correspond to lattice paths in the grid of order ideals (i,j). The bottom pair is (a1,b1).

## What is proved (exact arithmetic, for all m ≥ 0, apart from the caveat in step 1)
1. **Band and word structure.** Every valid ideal (i,j) satisfies −3 ≤ j−i ≤ 2. A row of the grid is therefore described by its mask (the set of valid offsets). The sequence of row masks for n=108+20m equals the word PRE·X^m·MID·Y^m·SUF, where X=Y is a fixed block of 5 rows (one period of 10 elements).
   *Caveat:* this decomposition is **checked by direct computation for m=0..100**, not proved symbolically. It is the one non-algebraic step. A full proof needs the observation that the f/g arrays of `ladder_fg` (and hence each row mask) depend only on B in a bounded window, together with the fact that B is periodic in its interior. That argument is easy but has not been written out formally.
2. **Transfer matrices.** The count G(i,j) of paths from (i,j) to the top satisfies G(i,j) = G(i+1,j) + G(i,j+1) on valid cells. Each row gives an exact 6×6 integer map, which yields
   E_m = #L(P) = uE·A^m·M·A^m·v and N_m = #{extensions with b1 before a1} = uN·A^m·M·A^m·v.
   For m=0..3 these agree with the independent DP in `../w2lib.py`, including the fact that δ is attained at the bottom pair (1,1) with δ = N/E.
3. **Characteristic polynomials.** χ_A(z) = z^4(z²−164z+27), so the roots are r,s = 82±√6697 with rs = 27. Let K = Aᵀ⊗A (36×36), so that a_m = vec(M)ᵀK^m(u⊗v). Then χ_K = z^32(z−27)²(z²−26842z+729).
4. **Recurrence.** Let q(z) = (z−27)(z²−26842z+729) = z³−26869z²+725463z−19683. We checked vec(M)ᵀK^k q(K)w = 0 for k=0..35, for both w_E and w_N. By Cayley–Hamilton for K this forces the sequence to vanish for all k. Hence E_{m+3} = 26869E_{m+2} − 725463E_{m+1} + 19683E_m for **all m ≥ 0**, and the same holds for N.
5. **Limit.** The dominant root is ρ = 13421+164√6697 = r². Write E_m = c_E ρ^m + O(27^m) and similarly for N, where c = (a_2−(27+ρ')a_1+27ρ'a_0)/((ρ−27)(ρ−ρ')). We have c_E > 0, and the exact simplification gives
   **lim N_m/E_m = α = (115713181619−36√6697)/331705168868 ≈ 0.348843459593420226915**,
   with minimal polynomial 1326820675472x²−925705452952x+161463150497 (checked).
   Since α < 1/2, the bottom-pair balance min(N,E−N)/E tends to α.

## What is NOT proved (step 2)
- That δ(L_n) is attained at the bottom pair for every m. This has been checked numerically to n=1608 (`../exact3.py`), but not proved. Without it, the certificate shows only that **the bottom pair's balance → α**. On its own the certificate gives only δ(L_n) ≥ bottom-pair value; for "δ(L_n) → α" one needs every other pair to be at least as balanced.
- Also note that δ(L_n) is the *max* over pairs of min(p,1−p), so other pairs could only make δ larger. A statement such as "inf over finite width-2 posets of δ ≤ α" therefore needs step 2.
- Literature novelty has not been checked beyond Chen 2018, Sah 2021, Peczarski 2017/19 and Gupta 2026.
