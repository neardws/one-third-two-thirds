from w2lib import delta
from fractions import Fraction as Fr
import mpmath as mp
mp.mp.dps=60
def ladder_fg(n,br):
    p=(n+1)//2;q=n//2;f=[0]*(p+2);g=[0]*(q+2)
    for r in range(p,0,-1):
        i=2*(r-1);v=q+1
        if i+3<=n-1 and i not in br: v=(i+2)//2+1
        if r<p: v=min(v,f[r+1])
        f[r]=v
    for s in range(q,0,-1):
        i=2*(s-1)+1;v=p+1
        if i+3<=n-1 and i not in br: v=(i+3)//2+1
        if s<q: v=min(v,g[s+1])
        g[s]=v
    return p,q,f[1:p+1],g[1:q+1]
def build(cap,L,n,per,R):
    h=(n-4)//2;B=set(cap)|{j for j in range(L,h+1) if j%per in R};B|={n-4-j for j in B};return B
cap=[1,5,8,9,12,13,17,20,21,25,28,29,33,36,39,43]
vals=[]
for n in [148,168,188,228,268]:
    p,q,f,g=ladder_fg(n,build(cap,44,n,10,{3,6,9}))
    d,e,arg=delta(p,q,f,g); x=mp.mpf(d.numerator)/d.denominator; vals.append(x)
    print(n,arg,mp.nstr(x,40))
x=vals[-1]
print("diff last two",mp.nstr(vals[-1]-vals[-2],5))
for deg in (2,3,4):
    print(deg,mp.findpoly(x,deg,maxcoeff=10**9))
