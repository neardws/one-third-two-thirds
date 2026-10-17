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
  4. beta, gamma: the other endpoint (stored vector 'vother', the bottom pair (a_1,b_1)
     in ORIGINAL coordinates) has limit (y^T v_other)/(y^T v), which depends only on the
     far cap; its finite values for m = 0,1,2 agree with a direct exact computation
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
            vo = w['matrices']['vother']; mtv = w['matrices']['v']
            for m in (0, 1, 2):
                Am = power(A, m)
                E = L.chain(uE, Am, M, Am, mtv)[0][0]; O = L.chain(uE, Am, M, Am, vo)[0][0]
                n, B = broken(m)
                Ed, bal, _ = exact_balances(n, B)
                (h,) = [t[0] for t in bal if tuple(t[1:]) == (1, 1)]
                assert E == Ed and O == h, (fam, m, 'other endpoint')
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


if __name__ == '__main__':
    if not __debug__: raise RuntimeError('Run without -O.')
    main()
