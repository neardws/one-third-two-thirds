"""Unified transfer form, exact limits, and the c_P corollary for alpha, beta, gamma.

Stdlib only; exact arithmetic in Q and Q(sqrt(6697)); no floating point in decisions.
Run from the repository root:   python3 certificates/limits_and_cP.py

For each family the row word PRE . X^m . MID . X^m . SUF (alpha: stored in
certificates/alpha/certificate.json; beta, gamma: the 'structure' field of the
dominance certificates, in the checkers' reflected coordinates) gives
    A = Phi(X),  M = Phi(MID),
    u_E = e_0 Phi(PRE),  u_N = e_0 Phi_N(PRE),  v = Phi(SUF) e_{-1},
where e_d is the basis vector of offset d, Phi(word) is the ordered product of the row
matrices, and Phi_N replaces the row-0 matrix by its part with crossing height >= 1
(b_1 placed before a_1).  Then E_m = u_E A^m M A^m v and N_m = u_N A^m M A^m v.
The script checks:
  0. the rebuilt A, M, u_E, u_N, v equal the stored data (alpha: certificate.json;
     beta, gamma: the 'matrices' field of dominance_certificate.json);
  1. A^3 - 164 A^2 + 27 A = 0;
  2. for m = 0, 1, 2: E_m and N_m/E_m agree with an independent exact computation of
     |L(P_m)| and delta(P_m) from the generating relations in ORIGINAL coordinates
     (certificates/pdagger/verify_pdagger.exact_balances);
  3. lim N_m/E_m = (u_N Pi M Pi v)/(u_E Pi M Pi v) equals the stated closed form exactly,
     where Pi = (A^2 - sA)/(r(r-s)), r,s = 82 +- sqrt(6697);
  4. c_P corollary: N_m/E_m < c_P = 1087457557/3117322468 for every m >= 0, by the
     finite verification lemma with K = 1 (four tuples in {Lambda, A}^2, m >= 1) and a
     direct check at m = 0.  With all-pairs dominance (delta = N_m/E_m) this gives
     delta(P_m) < c_P for every member of each family.
  5. approach from above: with Pi_r = (A^2 - sA)/(r(r-s)), Pi_s = (A^2 - rA)/(s(s-r)),
     A = r Pi_r + s Pi_s and A Pi_r = r Pi_r, A Pi_s = s Pi_s, so A^m = r^m Pi_r + s^m Pi_s
     for m >= 1 and, with lim = (a - b sqrt 6697)/c and u = u_N - lim u_E,
         N_m - lim E_m = C 27^m + D s^(2m),
     C = u (Pi_r M Pi_s + Pi_s M Pi_r) v,  D = u Pi_s M Pi_s v  (rs = 27; the r^(2m)
     coefficient u Pi_r M Pi_r v vanishes by 3).  The script checks these identities, the
     closed form for m = 0..4 against u A^m M A^m v (so m = 0 is included), and C, D > 0.
     Since E_m > 0, N_m/E_m > lim for every m >= 0.
"""
import json, sys, itertools
from fractions import Fraction
from pathlib import Path
HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE / 'beta' / 'beta_dominance'))
sys.path.insert(0, str(HERE / 'pdagger'))
from arithmetic import Quad, mm, power, matadd, scale, rowmap, prod, masked, basisrow, basiscol
from verify_pdagger import exact_balances

CP = (1087457557, 3117322468)
LIMITS = {   # (a, b, c): limit = (a - b sqrt 6697)/c
    'alpha': (115713181619, 36, 331705168868),
    'beta': (70601103221348402231752613608561321408507, 76527504,
             202386202979838556018601359840018770821908),
    'gamma': (113344761041171128772377413341625230454875, 4782969,
              324915826638865693871423059126368044433152),
}


def positive(x):
    x = x if isinstance(x, Quad) else Quad(x)
    if x.b == 0: return x.a > 0
    if x.a >= 0 and x.b > 0: return True
    if x.a <= 0 and x.b < 0: return False
    return x.a * x.a > 6697 * x.b * x.b if x.a > 0 else 6697 * x.b * x.b > x.a * x.a


def qpow(x, k):
    out = Quad(1)
    for _ in range(k): out = out * x
    return out


def chain(*ms):
    out = ms[0]
    for x in ms[1:]: out = mm(out, x)
    return out


def alpha_broken(m):
    n = 108 + 20 * m
    cap = {1, 5, 8, 9, 12, 13, 17, 20, 21, 25, 28, 29, 33, 36, 39, 43}
    core = {j for j in range(44, 52 + 10 * m + 1) if j % 10 in (3, 6, 9)}
    return n, cap | core | {n - 4 - j for j in cap | core}


def family(fam):
    if fam == 'alpha':
        w = json.loads((HERE / 'alpha' / 'certificate.json').read_text())
        return w, alpha_broken
    import importlib.util
    path = {'beta': HERE / 'beta' / 'beta_dominance',
            'gamma': HERE / 'gamma_symleft' / 'symleft_dominance'}[fam]
    spec = importlib.util.spec_from_file_location(fam + '_family', path / 'family.py')
    mod = importlib.util.module_from_spec(spec); spec.loader.exec_module(mod)
    cert = json.loads((path / 'dominance_certificate.json').read_text())
    w = dict(cert['structure']); w['matrices'] = cert['matrices']
    return w, lambda m: (248 + 20 * m, set(mod.broken(m)))   # original coordinates


def main():
    for fam in ('alpha', 'beta', 'gamma'):
        w, broken = family(fam)
        PRE, X, MID, SUF = w['PRE'], w['X'], w['MID'], w['SUF']
        assert w.get('Y', X) == X
        A, M = prod(X), prod(MID)
        zero = [[0] * 6 for _ in range(6)]
        assert matadd(matadd(chain(A, A, A), scale(chain(A, A), -164)), scale(A, 27)) == zero
        r0 = rowmap(PRE[0])
        r0N = matadd(r0, scale(masked(r0, 0), -1))           # crossing height h >= 1
        uE = chain(basisrow(3), prod(PRE))
        uN = chain(basisrow(3), r0N, prod(PRE[1:]))
        v = chain(prod(SUF), basiscol(2))
        if fam == 'alpha':
            assert uE[0] == w['uE'] and uN[0] == w['uN'] and [x[0] for x in v] == w['v'] and M == w['M']
        else:   # boundary data rebuilt from the row word must equal the stored 'matrices'
            mt = w['matrices']
            assert (A, M, uE, uN, v) == (mt['A'], mt['M'], mt['uE'], mt['uN'], mt['v']), fam
        # 2. independent exact check, original coordinates
        for m in (0, 1, 2):
            Am = power(A, m)
            E = chain(uE, Am, M, Am, v)[0][0]; N = chain(uN, Am, M, Am, v)[0][0]
            n, B = broken(m)
            Ed, bal, _ = exact_balances(n, B)
            top = max(t[0] for t in bal)
            assert E == Ed and Fraction(N, E) == Fraction(top, Ed), (fam, m)
        # 3. exact limit
        s = Quad(82, -1)
        Lam = matadd(chain(A, A), scale(A, -s))
        num = chain(uN, Lam, M, Lam, v)[0][0]; den = chain(uE, Lam, M, Lam, v)[0][0]
        a, b, c = LIMITS[fam]
        assert num * c == den * Quad(a, -b), fam
        # 4. c_P corollary
        for Z1, Z2 in itertools.product((Lam, A), repeat=2):
            Ez = chain(uE, Z1, M, Z2, v)[0][0]; Nz = chain(uN, Z1, M, Z2, v)[0][0]
            assert positive(Ez) and positive(CP[0] * Ez - CP[1] * Nz), (fam, 'c_P tuple')
        E0 = chain(uE, M, v)[0][0]; N0 = chain(uN, M, v)[0][0]
        assert E0 > 0 and CP[0] * E0 - CP[1] * N0 > 0
        # 5. approach from above: N_m - lim E_m = C 27^m + D s^(2m) with C, D > 0
        r = Quad(82, 1); lim = Quad(Fraction(a, c), Fraction(-b, c))
        A2 = chain(A, A)
        Pr = scale(matadd(A2, scale(A, -s)), 1 / (r * (r - s)))
        Ps = scale(matadd(A2, scale(A, -r)), 1 / (s * (s - r)))
        assert matadd(scale(Pr, r), scale(Ps, s)) == A
        assert chain(A, Pr) == scale(Pr, r) and chain(A, Ps) == scale(Ps, s)
        assert r * s == 27
        u = [[uN[0][i] - lim * uE[0][i] for i in range(6)]]
        f = lambda X, Y: chain(u, X, M, Y, v)[0][0]
        assert f(Pr, Pr) == 0
        C = f(Pr, Ps) + f(Ps, Pr); D = f(Ps, Ps)
        assert positive(C) and positive(D), (fam, 'approach from above')
        for m in range(5):
            Am = power(A, m)
            err = chain(uN, Am, M, Am, v)[0][0] - lim * chain(uE, Am, M, Am, v)[0][0]
            assert err == C * 27 ** m + D * qpow(s * s, m), (fam, m)
        if fam == 'alpha':
            assert C == Quad(0, Fraction(727011288, 6697))   # C = 727011288/sqrt(6697)
        print(f'{fam}: |PRE|={len(PRE)} X={"".join("OLRT"[(-3 in t) + 2 * (2 in t)] for t in X)} '
              f'|MID|={len(MID)} |SUF|={len(SUF)}; cubic ok; m=0,1,2 match direct DP; '
              f'exact limit ok; N_m/E_m < c_P for all m >= 0; '
              f'N_m - lim E_m = C 27^m + D s^(2m) with C, D > 0')


if __name__ == '__main__':
    if not __debug__: raise RuntimeError('Run without -O.')
    main()
