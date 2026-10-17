"""Rank-one form of the endpoint limits for alpha, beta, gamma (exact, stdlib only).

Run from the repository root:   python3 certificates/rank_one_limits.py

r = 82 + sqrt(6697) is a simple eigenvalue of each period block A (characteristic
polynomial z^4 (z^2 - 164 z + 27)).  With an explicit right eigenvector x and left
eigenvector y the script checks exactly, in Q(sqrt 6697):
  1. A x = r x,  y^T A = r y^T,  y^T x != 0;
  2. Pi_r := A (A - sI) / (r (r - s)) equals x y^T / (y^T x)   (so Pi_r has rank one);
  3. u_E x > 0, (y^T M x)(y^T v) > 0, and u_N x / u_E x equals the stated limit, so
         lim N_m / E_m = (u_N x) / (u_E x):
     only the boundary vector at the target end (PRE side, checker coordinates)
     survives; M (seam) and v (far cap) cancel;
  4. beta, gamma: v_other = Phi(SUF[:-2]) (Phi(S_{p-1}) - masked(Phi(S_{p-1}), 0)) Phi(S_p) e_{-1}
     (stored as 'vother'); O_m = u_E A^m M A^m v_other counts the linear extensions with
     b_p before a_p in checker coordinates, i.e. b_1 before a_1 in ORIGINAL coordinates
     (checked against a direct count for m = 0,1,2).  lim O_m/E_m = (y^T v_other)/(y^T v),
     which depends only on the far cap; its finite values for m = 0,1,2 agree with a direct exact computation
     from the generating relations; for beta this limit is below beta and below the
     endpoint cut 6976869191857/2e13 used by the beta certificate.
"""
import sys
from fractions import Fraction
from pathlib import Path
HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import limits_and_cP as L
from arithmetic import Quad, mm, power, matadd, scale, rowmap, prod, masked, basisrow, basiscol
from verify_pdagger import exact_balances

R, S = Quad(82, 1), Quad(82, -1)
W = lambda a, b, d: Quad(Fraction(a, d), Fraction(b, d))     # (a + b sqrt 6697)/d
X_VEC = {'alpha': [1, 1, 1, W(-44, 1, 69), W(-67, 1, 69), 0],
         'beta': [0, W(529, 7, 61), W(404, 5, 61), W(279, 3, 61), W(154, 1, 61), 1]}
Y_VEC = {'alpha': [W(-119, 2, 207), W(44, 1, 207), 1, 1, 0, 0],
         'beta': [W(-69, 1, 44), W(-25, 1, 88), 1, 1, 0, 0]}
X_VEC['gamma'], Y_VEC['gamma'] = X_VEC['beta'], Y_VEC['beta']


def bottom_event(n, B):
    """Directly from the generating relations (original coordinates): return (E, count of
    linear extensions with b_1 = 1 placed before a_1 = 0).  Paths start at (0,0); the
    extension places b_1 first iff the first step goes to (0,1)."""
    p = n // 2
    below = [0] * n
    for x in range(n):
        for a in (x - 2, x - 3):
            if a >= 0 and (a == x - 2 or a not in B):
                below[x] |= (1 << a) | below[a]
    pa = [0] * (p + 1); pb = [0] * (p + 1)
    for r in range(1, p + 1):
        pa[r] = pa[r - 1] | 1 << (2 * r - 2); pb[r] = pb[r - 1] | 1 << (2 * r - 1)
    def ok(i, j):
        S = pa[i] | pb[j]
        return all(below[x] & ~S == 0 for x in range(n) if S >> x & 1)
    G = {}
    for i in range(p, -1, -1):
        for j in range(p, -1, -1):
            if ok(i, j):
                G[i, j] = 1 if (i, j) == (p, p) else G.get((i + 1, j), 0) + G.get((i, j + 1), 0)
    return G[0, 0], G.get((0, 1), 0)


def col(x): return [[Quad(t) if not isinstance(t, Quad) else t] for t in x]
def row(y): return [[Quad(t) if not isinstance(t, Quad) else t for t in y]]
def eqm(a, b): return all(Quad(0) + p == Quad(0) + q for ra, rb in zip(a, b) for p, q in zip(ra, rb))
def sc(z): return z[0][0]


def main():
    for fam in ('alpha', 'beta', 'gamma'):
        w, broken = L.family(fam)
        PRE, X, MID, SUF = w['PRE'], w['X'], w['MID'], w['SUF']
        A, M = prod(X), prod(MID)
        r0 = rowmap(PRE[0]); r0N = matadd(r0, scale(masked(r0, 0), -1))
        uE = L.chain(basisrow(3), prod(PRE)); uN = L.chain(basisrow(3), r0N, prod(PRE[1:]))
        v = L.chain(prod(SUF), basiscol(2))
        x, y = col(X_VEC[fam]), row(Y_VEC[fam])
        assert eqm(mm(A, x), scale(x, R)) and eqm(mm(y, A), scale(y, R)), fam
        yx = sc(mm(y, x)); assert not yx == 0
        Pi = scale(matadd(mm(A, A), scale(A, -S)), 1 / (R * (R - S)))
        assert eqm(Pi, scale(mm(x, y), 1 / yx)), (fam, 'rank one')
        uEx, uNx = sc(mm(uE, x)), sc(mm(uN, x))
        assert L.positive(uEx) and L.positive(sc(L.chain(y, M, x)) * sc(mm(y, v)))
        a, b, c = L.LIMITS[fam]
        assert uNx * c == uEx * Quad(a, -b), (fam, 'limit')
        msg = f'{fam}: A x = r x, Pi_r = x y^T/(y^T x), limit = (u_N x)/(u_E x)'
        if fam != 'alpha':
            vo = L.chain(prod(SUF[:-2]), matadd(rowmap(SUF[-2]), scale(masked(rowmap(SUF[-2]), 0), -1)),
                         rowmap(SUF[-1]), basiscol(2))
            assert vo == w['matrices']['vother'] and v == w['matrices']['v'], fam
            mtv = v
            for m in (0, 1, 2):
                Am = power(A, m)
                E = L.chain(uE, Am, M, Am, mtv)[0][0]; O = L.chain(uE, Am, M, Am, vo)[0][0]
                n, B = broken(m)
                Ed, bal, _ = exact_balances(n, B)
                (h,) = [t[0] for t in bal if tuple(t[1:]) == (1, 1)]
                assert E == Ed and O == h, (fam, m, 'other endpoint')
                Eb, Ob = bottom_event(n, B)      # O_m counts b_1 before a_1 (original coords)
                assert Eb == E and Ob == O, (fam, m, 'O_m event')
            lim_o = sc(mm(y, vo)) / sc(mm(y, mtv))
            if fam == 'gamma':
                assert lim_o == Quad(Fraction(a, c), Fraction(-b, c))
            else:
                g = L.LIMITS['beta']
                assert L.positive(Quad(Fraction(g[0], g[2]), Fraction(-g[1], g[2])) - lim_o)   # bottom-end limit < beta
                CUT = Fraction(6976869191857, 20000000000000)   # endpoint cut of the beta certificate
                assert L.positive(Quad(CUT) - lim_o)                  # bottom-end limit < cut
            msg += f'; other endpoint limit = (y^T v_o)/(y^T v) = ({lim_o.a}) + ({lim_o.b}) sqrt6697'
        print(msg)
    chen_cap_example()


def chen_cap_example():
    """Chen's family P(5k,5k) [Chen18, Def. 2.2-2.3] is the ladder with n = 10k and broken set
    {j : j mod 10 in {1,5,8}}.  Its row word (computed here from the local-mask rule) is
    a b O . (L R L O O)^* ..., i.e. a 3-row prefix followed by the alpha block X = LRLOO.
    With the SAME eigenvector x_alpha, (u_N x)/(u_E x) = (93 - sqrt 6697)/32 = Chen's limit,
    while alpha's 22-row prefix gives alpha.  Also checked: the bottom-pair balance of
    P(5k,5k) computed directly from the generating relations approaches this value."""
    k = 8; n = 10 * k; p = n // 2
    B = {j for j in range(n - 3) if j % 10 in (1, 5, 8)}
    W = [[d for d in range(-3, 3) if 0 <= i + d <= p and (d != 2 or 2 * i in B)
          and (d != -3 or 2 * i - 5 in B)] for i in range(p + 1)]
    X = L.family('alpha')[0]['X']
    assert all(W[3 + 5 * q + t] == X[t] for q in range(6) for t in range(5))
    pre = W[:3]
    r0 = rowmap(pre[0]); r0N = matadd(r0, scale(masked(r0, 0), -1))
    uE = L.chain(basisrow(3), prod(pre)); uN = L.chain(basisrow(3), r0N, prod(pre[1:]))
    assert uE == [[1, 3, 5, 5, 0, 0]] and uN == [[0, 1, 2, 2, 0, 0]]
    x = col(X_VEC['alpha'])
    kappa = Quad(Fraction(93, 32), Fraction(-1, 32))
    assert sc(mm(uN, x)) / sc(mm(uE, x)) == kappa
    E, bal, _ = exact_balances(n, B)
    (h,) = [t[0] for t in bal if tuple(t[1:]) == (1, 1)]
    assert abs(Fraction(h, E) - Fraction(3488999921794, 10 ** 13)) < Fraction(1, 10 ** 13)
    print('Chen cap: prefix a b O, u_E = (1,3,5,5,0,0), u_N = (0,1,2,2,0,0); with x_alpha '
          '(u_N x)/(u_E x) = (93 - sqrt 6697)/32 (Chen); direct P(40,40) bottom balance agrees')


if __name__ == '__main__':
    if not __debug__: raise RuntimeError('Run without -O.')
    main()
