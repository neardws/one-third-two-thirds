"""Exact certificate for the family F (n = 108+20m).  Run: python3 certify.py  (needs sympy).
Writes certificate.json.  See README.md for the mathematical argument."""
import sys, json, sympy as sp
sys.path.insert(0, '.')
from family import valid_fn
OFF = list(range(-3, 3))           # band offsets d = j - i  (verified below)
def masks(n):
    p, q, f, g, v = valid_fn(n)
    assert p == q == n//2
    for i in range(p+1):
        for j in range(q+1):
            if v(i, j): assert -3 <= j-i <= 2, "band violated"
    return [tuple(d for d in OFF if v(i, i+d)) for i in range(p+1)]
def rowmap(mask):
    """6x6 matrix L: (G on row i+1) -> (G on row i), offset coords.
    G[i][j] = G[i+1][j] + G[i][j+1] on valid cells, 0 elsewhere.
    Row i+1 entry at offset d' sits at j=i+1+d' i.e. offset d'+1 rel. to row i."""
    L = sp.zeros(6, 6)
    # process d descending; express each G[i][i+d] as linear comb of row i+1 vector
    expr = {}
    for d in reversed(OFF):
        if d not in mask: expr[d] = sp.zeros(1, 6); continue
        e = sp.zeros(1, 6)
        if d-1 in OFF: e[OFF.index(d-1)] += 1          # G[i+1][j]: offset d-1 in row i+1
        if d+1 in OFF: e += expr[d+1]                  # G[i][j+1]
        expr[d] = e
    for d in OFF: L[OFF.index(d), :] = expr[d]
    return L
def prod(ms):
    P = sp.eye(6)
    for M in ms: P = P*rowmap(M)                       # row0 = L0 L1 ... L_{p-1} top
    return P
K1, K2 = 22, 33                                        # insertion points (rows), found by search
S0 = masks(108)
X = masks(128)[K1:K1+5]; Y = masks(128)[K2+5:K2+10]
PRE, MID, SUF = S0[:K1], S0[K1:K2], S0[K2:]
# (1) word decomposition, checked for m = 0..MCHK
MCHK = int(sys.argv[1]) if len(sys.argv) > 1 else 40
for m in range(MCHK+1):
    assert masks(108+20*m) == PRE + X*m + MID + Y*m + SUF, m
# top row p: G[p][q]=1 only valid cell at offset 0 of last row handled by SUF's last mask
top = sp.zeros(6, 1); top[OFF.index(-1)] = 1          # virtual row p+1: G[p+1][q]=1 seeds G[p][q]=1
SUFm = SUF                                             # rows .. p are maps
assert max(SUF[-1]) == 0                               # row p has no cell with j>q
A = prod(X); B = prod(Y); M = prod(MID); v = prod(SUFm)*top
P1 = prod(PRE[1:])                                     # rows 1..K1-1
uE = (prod(PRE[:1])*P1)[OFF.index(0), :]               # E = G[0][0]
uN = uE - P1[OFF.index(-1), :]   # G[1][0] = #ext with a1 before b1 (majority); N = E - G[1][0] = #ext with b1 before a1 (minority)
def seq(u, m): return (u*A**m*M*B**m*v)[0]
# cross-check with the independent DP (w2lib.delta) for small m
sys.path.insert(0, '..')
from w2lib import delta
from family import ladder_fg, broken
for m in range(4):
    n = 108+20*m; p, q, f, g = ladder_fg(n, broken(n)); d, e, arg = delta(p, q, f, g)
    assert arg == (1, 1) and e == seq(uE, m) and d*e == seq(uN, m), m
# (2) Kronecker linearisation: a_m = c^T K^m w, K = A^T (x) B  (36x36)
K = sp.kronecker_product(A.T, B); c = sp.Matrix(list(M))  # vec row-major
def wvec(u): return sp.kronecker_product(u.T, v)
z = sp.symbols('z'); qpoly = sp.expand((z-27)*(z**2-26842*z+729))
coeffs = sp.Poly(qpoly, z).all_coeffs()
def qK(w):
    r = sp.zeros(36, 1); Kp = w
    for co in reversed(coeffs): r += co*Kp; Kp = K*Kp
    return r
ok = {}
for name, u in (('E', uE), ('N', uN)):
    w = wvec(u); r = qK(w); x = c.T
    allz = True
    for k in range(36):
        allz &= (x*r)[0] == 0; x = x*K
    ok[name] = allz
    assert all((c.T*K**m*w)[0] == seq(u, m) for m in range(3))
assert ok['E'] and ok['N']
chiK = sp.factor(K.charpoly(z).as_expr())
# (3) limit
E = [seq(uE, m) for m in range(3)]; N = [seq(uN, m) for m in range(3)]
s = sp.sqrt(6697); rp = 13421+164*s; rm = 13421-164*s
cE = E[2]-(27+rm)*E[1]+27*rm*E[0]; cN = N[2]-(27+rm)*N[1]+27*rm*N[0]
assert sp.N(cE, 50) > 0 and sp.N(cN/cE, 50) < sp.Rational(1, 2)
alpha = (115713181619-36*s)/331705168868
lim = sp.radsimp(cN/cE)
assert sp.simplify(lim-alpha) == 0
mp = sp.Poly(1326820675472*z**2-925705452952*z+161463150497, z)
assert sp.simplify(mp.as_expr().subs(z, alpha)) == 0
out = dict(n_formula='108+20m', word_checked_up_to_m=MCHK, K1=K1, K2=K2,
  PRE=PRE, X=X, MID=MID, Y=Y, SUF=SUF,
  A=[[int(t) for t in A.row(i)] for i in range(6)], B=[[int(t) for t in B.row(i)] for i in range(6)],
  M=[[int(t) for t in M.row(i)] for i in range(6)], v=[int(t) for t in v], uE=[int(t) for t in uE], uN=[int(t) for t in uN],
  charpoly_A=str(sp.factor(A.charpoly(z).as_expr())), charpoly_B=str(sp.factor(B.charpoly(z).as_expr())),
  charpoly_K=str(chiK), recurrence=str(qpoly), E012=[str(t) for t in E], N012=[str(t) for t in N],
  alpha=str(alpha), alpha_num=str(sp.N(alpha, 40)), limit_equals_alpha=True)
json.dump(out, open('certificate.json', 'w'), indent=1)
print("charpoly A:", out['charpoly_A']); print("charpoly B:", out['charpoly_B']); print("charpoly K:", chiK)
print("recurrence verified (E,N):", ok); print("alpha =", out['alpha'], out['alpha_num'])
