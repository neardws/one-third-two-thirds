# All-pairs dominance for the symleft family

Date: 2026-10-16. Paper argument plus exact integer/rational certificate; no Lean formalization in this step.

## Result: proved

Let P_m have n=248+20m, p=n/2, m>=0, the chain relations x_i<x_(i+2), and the intact rung relations x_i<x_(i+3), with zero-based rung sources. Its cap length is 100, its reflected period-10 Chen core has residues {3,6,9}, and both caps are exactly

    [1,5,8,9,12,13,17,20,21,25,28,29,33,36,37,
     43,49,55,61,67,73,79,85,91,97].

The checker checks these parameters against symleft_family.json, including its entire n=248 broken-source set, cross-chain maps, extension count and endpoint minority count. The input JSON remains the historical proposal; the new proof status is recorded in dominance_certificate.json.

For every integer m>=0:

1. Exactly two cross-chain pairs maximize the minority ordering probability: (a_1,b_1) and (a_p,b_p). They tie exactly. There is no unique endpoint maximizer.
2. Every other cross-chain pair has minority probability strictly below 1743/5000 = 0.3486. Within-chain pairs are comparable and have minority probability zero.
3. Both endpoints have minority probability N_m/E_m strictly above 0.3486 and below 1/2. Consequently delta(P_m)=N_m/E_m.
4. The full balance ratio converges to gamma, where

       gamma = (113344761041171128772377413341625230454875
                - 4782969 sqrt(6697))
               / 324915826638865693871423059126368044433152.

Thus the previously certified endpoint limit is now the certified full balance-ratio limit. No non-endpoint pair defeats it.

## Comparison with beta

The reference is exactly

    beta = (70601103221348402231752613608561321408507
            - 76527504 sqrt(6697))
           / 202386202979838556018601359840018770821908.

Exact quadratic-field arithmetic proves gamma<beta. The sign check uses rational squares, and the certificate also records a strictly positive rational interval for beta-gamma. Rounded displays, taken from the supplied endpoint evaluation, are

    gamma      ≈ 0.348843459592845471020812814890029031575563394
    beta-gamma ≈ 8.24786935893235317251512921070417638 × 10^(-15).

These decimals are explanatory only; no float participates in proof decisions.

## Symbolic structure for every m

structure.py verifies 135 affine row cases, using coefficient signs for independently nonnegative integer variables, rather than extrapolating from samples. The broken-source word is

    LC U^m C V^m RC,

with piece lengths 100, 10, 45, 10, 100. The seam is at 122+10m, so shifting by 10 preserves the core residues. The right pieces are reflections. Checks of all pieces and every possible join, including omitted repeats at m=0, show that no two broken sources are distance two apart.

This property bounds the ideal grid to -3<=j-i<=2: consecutive possible rung sources of either parity cannot both be broken. At the boundary the rectangle gives the corresponding bound. Within this band the four inner offsets are automatic, subject to the rectangle bounds; offset -3 is allowed precisely when source 2i-5 is broken, and offset 2 precisely when source 2i is broken. symbolic_mask checks these conditions uniformly.

The complete row-mask word is

    PRE(53) X(5)^m MID(11) Y(5)^m SUF(61),

with X=Y. For fixed pieces the affine cases use m>=0; for repeated blocks they use independent k,l>=0 with m=k+l+1, covering every occurrence of both repeats for every m>=1. The word has 125+10m=p+1 rows.

## Counting and all-pairs coverage

Each six-state row matrix counts the allowed vertical run followed by a horizontal step in an ideal-grid path. The final row is terminated at the full ideal. For the insertion representing a_i, a column mask retains exactly the placements with fewer than j elements of chain b already present, hence counts H_m(i,j), the extensions with a_i<b_j. The minority probability is min(H_m/E_m,1-H_m/E_m).

Only cutoffs d=j-i in [-3,3] need interval checks. Outside that range the mask retains either no columns or all columns, so the minority probability is zero. Every genuine insertion row is covered: all PRE and MID rows, all SUF rows except the final termination row, and all five positions within either repeat. The only excluded row/cutoff cases are the two endpoints, which are checked separately.

### Full finite grids

For m=0,...,15, finite_check constructs the entire (p+1)-by-(p+1) ideal rectangle from the literal intact generators, without using the six-state band to select valid ideals. Forward and backward integer DPs give E_m and the edge-insertion count for every one of the p^2 cross-chain pairs. Each pair count is checked against the transfer-matrix count, and the complete valid row sets are checked against the symbolic word.

These 16 grids check 667,616 cross-chain pairs in total. Each has exactly the two asserted endpoint ties. At m=0 the exact counts agree with the supplied JSON:

    E_0 = 2009960198323945549461505959716672282406590204397537168
    N_0 = 701161469227246968510253165729581235308445538327695164.

### Spectral interval certificate

Let A be the product of one five-row repeat and M the central product. The checker proves the matrix identity

    A^3 - 164 A^2 + 27 A = 0.

Put r=82+sqrt(6697), s=82-sqrt(6697), t=s/r. Exact identities in Q(sqrt(6697)) verify matrices P,Q satisfying

    A/r = P+Q,  AP=rP,  AQ=sQ,
    P^2=P,  PQ=QP=0,  Q^2=tQ.

Therefore for every h>=1,

    A^h/r^h = P + t^(h-1) Q,

and 0<t<1. An integer-square-root bracket for sqrt(6697), with denominator 10^40, and outward rational rounding at mesh 10^(-30) enclose these matrices. The tail enclosure covers every h>=K=8. Intersecting its entries with nonnegative values is valid because A has nonnegative entries.

For m>=16, an insertion inside a repeated region splits its exponent into k+l=m-1>=15. At least one of k,l is >=8. The 17 regimes (k,tail), (tail,l) for k,l=0,...,7, and (tail,tail) cover all possibilities. Other long powers are enclosed independently; dropping their correlations only enlarges the interval enclosures.

There are 2,056 rational row/cutoff cases. Every denominator has a positive lower bound; every non-endpoint case certifies either H/E<0.3486 or H/E>1-0.3486. A separate endpoint enclosure proves 0.3486<N/E<1/2 throughout the tail. Together with the finite grids this covers all m>=0 and every cross-chain pair.

## Endpoint tie and convergence

Reflection x_i -> x_(n-1-i) is an order-reversing symmetry of this family and swaps the two chains. It sends the bottom endpoint ordering to the corresponding top endpoint ordering, so their minority probabilities agree.

The certificate additionally checks the count identity algebraically. For m>=1, the normalized difference between the bottom and top endpoint minority counts is a+b*z+c*z^2, with z=t^(m-1). All three coefficients in Q(sqrt(6697)) are exactly zero. The m=0 tie is checked by the full grid. The strict gap to every remaining pair establishes that these are exactly the two maximizers.

Writing E_m=u A^m M A^m v and N_m=uN A^m M A^m v, the spectral expansion gives the limit

    gamma = (uN P M P v)/(u P M P v).

The leading denominator is proved positive, and exact field arithmetic proves that this ratio equals the displayed gamma. Dominance promotes endpoint convergence to convergence of delta(P_m).

## Reproduction and proved versus open

Final `python3 dominance_cert.py --check`: **PASSED**, exit code 0. check.log records "Certificate regenerated and exactly matched" and all 2,056 rational checks passed. The check used 7.378489 process CPU seconds.

Run from this directory, using only the Python standard library:

    OMP_NUM_THREADS=1 python3 dominance_cert.py
    OMP_NUM_THREADS=1 python3 dominance_cert.py --check

The first command generates the certificate. The second recomputes it in memory and compares the canonical JSON bytes with the saved file; it does not overwrite the saved certificate. It raises on any byte mismatch. An explicit __debug__ guard rejects Python -O before assertion-based checks can be skipped. The executable sets OMP_NUM_THREADS=1 and tries to lower process priority to niceness at least 10; if the operating system refuses, it prints a warning and continues (priority has no effect on the certificate).

Proved here: the all-m symbolic band and row word, complete all-pairs dominance with exactly two tied endpoints, delta(P_m)->gamma, and gamma<beta. This is a paper argument backed by an executable exact-arithmetic certificate.

Open/not supplied: a Lean formalization of this new certificate and an independent second implementation of the rational interval engine. These limitations do not change the scope of the executable checks. The finite full-grid DP and transfer-matrix counts are distinct computations and agree for every finite pair checked.

Artifacts: family.py, structure.py, arithmetic.py, dominance_cert.py, dominance_certificate.json, generate.log, check.log, and PROGRESS.md. No external references, PDF, secrets, or refs/ contents are needed or included.
