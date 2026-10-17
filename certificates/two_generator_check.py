"""Independent all-parameter dominance check by the two-generator reformulation.

Suggested by GPT 6 Pro (referee report on the accompanying note).  Stdlib only;
exact arithmetic in Q(sqrt(6697)); no floating point in any decision.

Let A be the period block, r,s = 82 +- sqrt(6697), Lam = A^2 - s*A.  Since
A^3 - 164 A^2 + 27 A = 0, for all k >= K >= 1
    A^k = (r^k - r^K s^(k-K)) / (r (r-s)) * Lam + s^(k-K) * A^K,
with both coefficients >= 0.  Pair counts H and totals E are multilinear in the
long segments, so c*E - H > 0 (or H - (1-c)*E > 0) for every exponent >= K
follows from the same strict inequality at the 2^(#long) choices of generator
in {Lam, A^K}.  This script checks every non-endpoint row/cutoff case, in the
same regime decomposition as the interval certificates, for m >= 2K.

Run from the repository root:
    python3 certificates/two_generator_check.py alpha   # K=4, 1006 cases
    python3 certificates/two_generator_check.py beta    # K=8, 2056 cases (+ endpoint separation)
    python3 certificates/two_generator_check.py gamma   # K=8, 2056 cases
The row-mask word (PRE, X, MID, SUF) is taken from the stored certificates; its
correctness for all m is proved separately (Lean `row_word` for alpha,
`structure.py` affine cases for beta/gamma).
"""
import itertools, json, sys
from pathlib import Path
HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE / 'beta' / 'beta_dominance'))
from arithmetic import F, Quad, mm, power, matadd, scale, rowmap, prod, masked, basisrow, basiscol

def positive(x):
    x = x if isinstance(x, Quad) else Quad(x)
    if x.b == 0: return x.a > 0
    if x.a >= 0 and x.b > 0: return True
    if x.a <= 0 and x.b < 0: return False
    return x.a*x.a > 6697*x.b*x.b if x.a > 0 else 6697*x.b*x.b > x.a*x.a

def chain(*fs):
    out = fs[0]
    for f in fs[1:]: out = mm(out, f)
    return out

def load(fam):
    if fam == 'alpha':
        return json.loads((HERE/'alpha'/'certificate.json').read_text()), 4
    path = {'beta': HERE/'beta'/'beta_dominance'/'dominance_certificate.json',
            'gamma': HERE/'gamma_symleft'/'symleft_dominance'/'dominance_certificate.json'}[fam]
    return json.loads(path.read_text())['structure'], 8

def main(fam):
    c, K = load(fam)
    PRE, X, MID, SUF = c['PRE'], c['X'], c['MID'], c['SUF']
    assert c.get('Y', X) == X
    A, M = prod(X), prod(MID)
    zero = [[0]*6 for _ in range(6)]
    assert matadd(matadd(chain(A, A, A), scale(chain(A, A), -164)), scale(A, 27)) == zero
    s = Quad(82, -1)
    gens = [matadd(chain(A, A), scale(A, -s)), power(A, K)]
    u = chain(basisrow(3), prod(PRE)); v = chain(prod(SUF), basiscol(2))
    CUT = F(1743, 5000)
    count = 0

    def check(build, nlong, skip=(), cut=CUT, only=None):
        nonlocal count
        for d in (range(-3, 4) if only is None else only):
            if d in skip: continue
            sides = []
            for side in ('H', 'E-H'):
                ok = True
                for combo in itertools.product(gens, repeat=nlong):
                    E, H = build(combo, None), build(combo, d)
                    val = cut*E - H if side == 'H' else H - (1-cut)*E
                    if not (positive(E) and positive(val)): ok = False; break
                if ok: sides.append(side); break
            assert sides, (d, 'no side separates')
            count += 1

    loc = lambda rm, d: rm if d is None else masked(rm, d)
    for t in range(len(PRE)):
        check(lambda cb, d, t=t: chain(basisrow(3), prod(PRE[:t]), loc(rowmap(PRE[t]), d),
              prod(PRE[t+1:]), cb[0], M, cb[1], v)[0][0], 2, skip=(0,) if t == 0 else ())
    for t in range(len(MID)):
        check(lambda cb, d, t=t: chain(u, cb[0], prod(MID[:t]), loc(rowmap(MID[t]), d),
              prod(MID[t+1:]), cb[1], v)[0][0], 2)
    def suf(cb, d, t):
        return chain(u, cb[0], M, cb[1], prod(SUF[:t]), loc(rowmap(SUF[t]), d),
                     prod(SUF[t+1:]), basiscol(2))[0][0]
    for t in range(len(SUF)-1):
        check(lambda cb, d, t=t: suf(cb, d, t), 2, skip=(0,) if t == len(SUF)-2 else ())
    regimes = [(i, 'T') for i in range(K)] + [('T', i) for i in range(K)] + [('T', 'T')]
    for k, l in regimes:
        n = 1 + (k == 'T') + (l == 'T')
        for t in range(5):
            def left(cb, d, k=k, l=l, t=t):
                it = iter(cb)
                Ak = next(it) if k == 'T' else power(A, k)
                Al = next(it) if l == 'T' else power(A, l)
                return chain(u, Ak, prod(X[:t]), loc(rowmap(X[t]), d), prod(X[t+1:]), Al, M, next(it), v)[0][0]
            def right(cb, d, k=k, l=l, t=t):
                it = iter(cb); Am = next(it)
                Ak = next(it) if k == 'T' else power(A, k)
                Al = next(it) if l == 'T' else power(A, l)
                return chain(u, Am, M, Ak, prod(X[:t]), loc(rowmap(X[t]), d), prod(X[t+1:]), Al, v)[0][0]
            check(left, n); check(right, n)
    print(f'{fam}: K={K}, ordinary row/cutoff cases passed: {count} (all m >= {2*K})')
    if fam == 'beta':
        before = count
        check(lambda cb, d: suf(cb, d, len(SUF)-2), 2, cut=F(34884345959285, 10**14), only=(0,))
        assert count == before + 1
        print('beta: other-endpoint separation below 34884345959285/10^14 passed')

if __name__ == '__main__':
    if not __debug__: raise RuntimeError('Run without -O.')
    for fam in (sys.argv[1:] or ['alpha', 'beta', 'gamma']): main(fam)
