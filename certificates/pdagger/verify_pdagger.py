"""Standalone exact verification of the finite poset P-dagger (248 elements).

Stdlib only, integer arithmetic only, no search logs.  Run from anywhere:
    python3 certificates/pdagger/verify_pdagger.py

Checks
 1. The order is rebuilt from the generating relations x<x+2 and x<x+3 (x not in B);
    it has width two (chains a_r=2r-2, b_r=2r-1).
 2. Valid grid points (i,j) are those for which {a_1..a_i} u {b_1..b_j} is a down-set
    of that order (tested against the transitive closure, not a mask formula).
 3. Integer path DP gives E = #linear extensions and, for every cross-chain pair,
    H(i,j) = #{extensions with a_i before b_j}.  H in {0,E} exactly for comparable pairs.
 4. N = min(H(1,1), E-H(1,1)) and E match the stored values; the pair (a_1,b_1) is the
    unique maximizer of min(H,E-H)/E; the gap to the second largest balance is reported.
 5. delta(P-dagger) < gamma, < beta, < c_P by exact integer comparisons.
"""
import json, sys, time
from pathlib import Path

D = 6697
GAMMA = (113344761041171128772377413341625230454875, 4782969,
         324915826638865693871423059126368044433152)          # (a - b sqrt D)/c
BETA = (70601103221348402231752613608561321408507, 76527504,
        202386202979838556018601359840018770821908)
CP = (1087457557, 3117322468)                                   # Peczarski's c_P


def below_quadratic(N, E, abc):
    """N/E < (a - b sqrt D)/c  <=>  U = aE - cN > 0 and U^2 > D (bE)^2."""
    a, b, c = abc
    U = a * E - c * N
    return U > 0 and U * U - D * (b * E) ** 2 > 0


def exact_balances(n, B):
    """Rebuild the order of the ladder with broken set B from its generating relations,
    find the valid grid points by a down-set test, and return (E, balances, nvalid), where
    balances lists (min(H, E-H), i, j) for every incomparable cross-chain pair (a_i, b_j).
    Comparable pairs are checked to have H in {0, E} with the correct orientation."""
    assert n % 2 == 0 and all(0 <= x <= n - 4 for x in B)
    p = n // 2
    gens = [(x, x + 2) for x in range(n - 2)] + [(x, x + 3) for x in range(n - 3) if x not in B]
    below = [0] * n                          # bitmask of elements below x
    for x in range(n):                       # generators increase labels
        for a, b in gens:
            if b == x:
                below[x] |= (1 << a) | below[a]
    less = lambda x, y: bool(below[y] >> x & 1)
    a_ = lambda r: 2 * r - 2
    b_ = lambda r: 2 * r - 1
    for r in range(1, p):
        assert less(a_(r), a_(r + 1)) and less(b_(r), b_(r + 1))
    for r in range(1, p + 1):                # a_r || b_r: width exactly two
        assert not less(a_(r), b_(r)) and not less(b_(r), a_(r))
    pref_a = [0] * (p + 1); pref_b = [0] * (p + 1)
    for r in range(1, p + 1):
        pref_a[r] = pref_a[r - 1] | (1 << a_(r)); pref_b[r] = pref_b[r - 1] | (1 << b_(r))
    def valid(i, j):
        S = pref_a[i] | pref_b[j]
        return all((below[x] & ~S) == 0 for x in range(n) if S >> x & 1)
    V = {(i, j) for i in range(p + 1) for j in range(p + 1) if valid(i, j)}
    F = {}; G = {}
    for i in range(p + 1):
        for j in range(p + 1):
            if (i, j) in V:
                F[i, j] = 1 if (i, j) == (0, 0) else F.get((i - 1, j), 0) + F.get((i, j - 1), 0)
    for i in range(p, -1, -1):
        for j in range(p, -1, -1):
            if (i, j) in V:
                G[i, j] = 1 if (i, j) == (p, p) else G.get((i + 1, j), 0) + G.get((i, j + 1), 0)
    E = F[p, p]
    assert E == G[0, 0] > 0
    balances = []
    for i in range(1, p + 1):
        H = 0                                # a_i is placed by a step (i-1,h)->(i,h);
        for j in range(1, p + 1):            # a_i before b_j  iff  h < j
            H += F.get((i - 1, j - 1), 0) * G.get((i, j - 1), 0)
            if less(a_(i), b_(j)) or less(b_(j), a_(i)):
                assert H in (0, E) and (H == E) == less(a_(i), b_(j)), (i, j)
            else:
                assert 0 < H < E, (i, j)
                balances.append((min(H, E - H), i, j))
    return E, balances, len(V)


def main():
    t0 = time.process_time()
    data = json.loads((Path(__file__).resolve().parent / 'pdagger.json').read_text())
    n, B = data['n'], set(data['broken'])
    E, balances, nvalid = exact_balances(n, B)
    top = max(t[0] for t in balances)
    winners = [t for t in balances if t[0] == top]
    second = max(t for t in balances if t[0] < top)
    N = top
    assert str(N) == data['N'] and str(E) == data['E'], 'stored N/E mismatch'
    assert [(t[1], t[2]) for t in winners] == [(1, 1)], winners
    assert 3 * N > E                          # delta > 1/3
    assert below_quadratic(N, E, GAMMA), 'delta >= gamma'
    assert below_quadratic(N, E, BETA), 'delta >= beta'
    assert N * CP[1] < CP[0] * E, 'delta >= c_P'
    from decimal import Decimal, getcontext
    getcontext().prec = 60
    gap = Decimal(N - second[0]) / Decimal(E)
    print(f'n = {n}, valid ideals = {nvalid}, incomparable cross-chain pairs = {len(balances)}')
    print(f'E = {E}')
    print(f'N = {N}')
    print(f'delta = N/E = {Decimal(N) / Decimal(E)}')
    print(f'unique maximizer (a_1,b_1); runner-up (a_{second[1]},b_{second[2]}), gap {gap:.6E}')
    print('delta < gamma, delta < beta, delta < c_P: exact integer comparisons passed')
    print(f'process CPU seconds: {time.process_time() - t0:.2f}')


if __name__ == '__main__':
    if not __debug__:
        raise RuntimeError('Run without -O: the checks are assert statements.')
    main()
