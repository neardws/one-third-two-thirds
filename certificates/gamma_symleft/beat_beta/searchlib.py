import bisect, os, time
from fractions import Fraction
from decimal import Decimal, localcontext
def exact(p,q,f,g):
    """Sparse ideal-grid DP. Return unreduced max minority, total, witness."""
    lo=[bisect.bisect_right(g,i) for i in range(p+1)]
    hi=[x-1 for x in f]+[q]
    if any(l>h for l,h in zip(lo,hi)): raise ValueError('empty row')
    F=[]
    for i in range(p+1):
        row=[]
        for j in range(lo[i],hi[i]+1):
            up=F[i-1][j-lo[i-1]] if i and lo[i-1]<=j<=hi[i-1] else 0
            row.append(1 if (i,j)==(0,0) else up+(row[-1] if row else 0))
        F.append(row)
    G=[None]*(p+1)
    for i in range(p,-1,-1):
        row=[0]*(hi[i]-lo[i]+1)
        for j in range(hi[i],lo[i]-1,-1):
            down=G[i+1][j-lo[i+1]] if i<p and lo[i+1]<=j<=hi[i+1] else 0
            row[j-lo[i]]=1 if (i,j)==(p,q) else down+(row[j+1-lo[i]] if j<hi[i] else 0)
        G[i]=row
    E=F[p][-1]; best=0; arg=None
    if not E: raise ValueError('no paths')
    for i in range(1,p+1):
        s=0
        for h in range(max(lo[i-1],lo[i]),min(hi[i-1],hi[i],q-1,f[i-1]-2)+1):
            s+=F[i-1][h-lo[i-1]]*G[i][h-lo[i]]
            m=min(s,E-s)
            if m>best: best=m;arg=(i,h+1)
    return best,E,arg

BETA_A=70601103221348402231752613608561321408507
BETA_B=-76527504
BETA_C=202386202979838556018601359840018770821908

def beta_decimal():
    with localcontext() as c:
        c.prec=90
        return (Decimal(BETA_A)+BETA_B*Decimal(6697).sqrt())/BETA_C

def below_beta(N,E):
    z=BETA_A*E-BETA_C*N
    return z>0 and z*z>BETA_B*BETA_B*6697*E*E

def fg(n,br):
    p=(n+1)//2;q=n//2
    f=[q+1]*(p+1);g=[p+1]*(q+1)
    for r in range(p-1,-1,-1):
        f[r]=min(r+2 if 2*r+3<n and 2*r not in br else q+1,f[r+1])
    for r in range(q-1,-1,-1):
        g[r]=min(r+3 if 2*r+4<n and 2*r+1 not in br else p+1,g[r+1])
    return p,q,f[:p],g[:q]

def throttle():
    while os.getloadavg()[0]>6:
        time.sleep(5)
