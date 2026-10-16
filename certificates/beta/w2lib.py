from fractions import Fraction as Fr
def closure_fg(p,q,rels):
    # rels: list of ('a',i,'b',j) meaning x<y ; 1-indexed. returns f,g
    N=p+q; idx=lambda t,i: i-1 if t=='a' else p+i-1
    lt=[[False]*N for _ in range(N)]
    for i in range(1,p): lt[i-1][i]=True
    for j in range(1,q): lt[p+j-1][p+j]=True
    for (s,i,t,j) in rels: lt[idx(s,i)][idx(t,j)]=True
    for k in range(N):
        for x in range(N):
            if lt[x][k]:
                for y in range(N):
                    if lt[k][y]: lt[x][y]=True
    f=[next((j for j in range(1,q+1) if lt[i-1][p+j-1]),q+1) for i in range(1,p+1)]
    g=[next((i for i in range(1,p+1) if lt[p+j-1][i-1]),p+1) for j in range(1,q+1)]
    return f,g
def delta(p,q,f,g):
    f=[None]+list(f); g=[None]+list(g)
    cB=[sum(1 for k in range(1,q+1) if g[k]<=i) for i in range(p+1)]
    cA=[sum(1 for k in range(1,p+1) if f[k]<=j) for j in range(q+1)]
    v=lambda i,j: cB[i]<=j and cA[j]<=i
    F=[[0]*(q+1) for _ in range(p+1)];G=[[0]*(q+1) for _ in range(p+1)]
    for i in range(p+1):
        for j in range(q+1):
            if v(i,j): F[i][j]=1 if i+j==0 else (F[i-1][j] if i else 0)+(F[i][j-1] if j else 0)
    for i in range(p,-1,-1):
        for j in range(q,-1,-1):
            if v(i,j): G[i][j]=1 if (i,j)==(p,q) else (G[i+1][j] if i<p else 0)+(G[i][j+1] if j<q else 0)
    e=F[p][q];best=Fr(0);arg=None
    for i in range(1,p+1):
        s=0
        for j in range(1,q+1):
            s+=F[i-1][j-1]*G[i][j-1]
            if f[i]<=j or g[j]<=i: continue
            m=Fr(min(s,e-s),e)
            if m>best: best=m;arg=(i,j)
    return best,e,arg
