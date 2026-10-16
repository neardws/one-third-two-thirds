"""Exact limit certificate for the asymmetric-cap family beating alpha.
Run: OMP_NUM_THREADS=1 python3 below_limit_certify.py
"""
import json, os
from pathlib import Path
import sympy as sp
from cert.family import broken, ladder_fg
from track1_search import exact

OFF=list(range(-3,3))
LEFT=[1,5,8,9,12,13,17,20,21,25,28,29,33,36,37,43,46,47,50,53,58,64,67,68,73,76,83,89,90,93,96,97]
RIGHT=[1,5,8,9,12,13,17,20,21,25,28,29,33,36,37,45,48,51,55,58,61,62,65,73,76,77,83,89,90,93]
L=100
ALPHA=(115713181619-36*sp.sqrt(6697))/331705168868
LIMIT=(70601103221348402231752613608561321408507-76527504*sp.sqrt(6697))/202386202979838556018601359840018770821908

def make_br(n):
    initial=set(broken(n)); left=set(LEFT); right=set(RIGHT)
    core={j for j in initial if L<=j<n-3-L}
    return left|{n-4-j for j in right}|core

def masks_for(n,br):
    p,q,f,g=ladder_fg(n,br)
    F=[None]+f; G=[None]+g
    cB=[sum(1 for k in range(1,q+1) if G[k]<=i) for i in range(p+1)]
    cA=[sum(1 for k in range(1,p+1) if F[k]<=j) for j in range(q+1)]
    v=lambda i,j: 0<=i<=p and 0<=j<=q and cB[i]<=j and cA[j]<=i
    return [tuple(d for d in OFF if v(i,i+d)) for i in range(p+1)]

def rowmap(mask):
    M=sp.zeros(6,6); expr={}
    for d in reversed(OFF):
        if d not in mask: expr[d]=sp.zeros(1,6); continue
        e=sp.zeros(1,6)
        if d-1 in OFF: e[OFF.index(d-1)]+=1
        if d+1 in OFF: e+=expr[d+1]
        expr[d]=e
    for d in OFF: M[OFF.index(d),:]=expr[d]
    return M

def prod(ms):
    P=sp.eye(6)
    for m in ms: P=P*rowmap(m)
    return P

def main():
    assert os.getpriority(os.PRIO_PROCESS,0)>=10
    # Use reflected family so top-endpoint of original = bottom formula of reflection
    def refl(n):
        return {n-4-j for j in make_br(n) if 0<=n-4-j<=n-4}
    ms0,ms1,ms2=masks_for(248,refl(248)),masks_for(268,refl(268)),masks_for(288,refl(288))
    K1,K2=53,64
    PRE,MID,SUF=ms0[:K1],ms0[K1:K2],ms0[K2:]
    X=ms1[K1:K1+5]; Y=ms1[K1+5+(K2-K1):K1+5+(K2-K1)+5]
    assert ms2==PRE+X+X+MID+Y+Y+SUF
    A,B,M=prod(X),prod(Y),prod(MID)
    top=sp.zeros(6,1); top[OFF.index(-1)]=1
    v=prod(SUF)*top; P1=prod(PRE[1:])
    uE=(prod(PRE[:1])*P1)[OFF.index(0),:]
    uN=uE-P1[OFF.index(-1),:]
    def seq(u,m): return (u*A**m*M*B**m*v)[0]
    E=[seq(uE,m) for m in range(4)]; N=[seq(uN,m) for m in range(4)]
    for m,n in enumerate([248,268,288,308]):
        mm,ee,arg=exact(*ladder_fg(n,make_br(n)))
        assert ee==E[m] and mm==N[m] and arg==(n//2,n//2), (m,n,arg)
    s=sp.sqrt(6697); rm=13421-164*s
    z=sp.symbols('z')
    assert sp.factor(A.charpoly(z).as_expr())==z**4*(z**2-164*z+27)
    assert sp.factor(B.charpoly(z).as_expr())==z**4*(z**2-164*z+27)
    lim=sp.radsimp((N[2]-(27+rm)*N[1]+27*rm*N[0])/(E[2]-(27+rm)*E[1]+27*rm*E[0]))
    assert sp.simplify(lim-LIMIT)==0
    assert sp.simplify(ALPHA-LIMIT)!=0 and sp.N(ALPHA-LIMIT)>0
    out=dict(ok=True,limit=str(LIMIT),alpha=str(ALPHA),beats_alpha=True,
             limit_decimal=str(sp.N(LIMIT,40)), gap=str(sp.N(ALPHA-LIMIT,40)))
    Path('logs/below_limit_certify.json').write_text(json.dumps(out,indent=2))
    print(json.dumps(out,indent=2))

if __name__=='__main__':
    main()
