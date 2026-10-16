"""Self-contained definition of the family F (copied from ../exactfam.py, no side effects).
Ladder L_{n,B}: elements 0..n-1, relations i<i+2 (all i), i<i+3 for i not in B (B = broken rungs).
Chains: a = even elements, b = odd elements. f[r] (1-indexed) = index of first b above a_r, g[s] likewise."""
CAP=[1,5,8,9,12,13,17,20,21,25,28,29,33,36,39,43]
def broken(n):
    h=(n-4)//2
    B=set(CAP)|{j for j in range(44,h+1) if j%10 in (3,6,9)}
    return B|{n-4-j for j in B}
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
def valid_fn(n):
    p,q,f,g=ladder_fg(n,broken(n)); F=[None]+f;G=[None]+g
    cB=[sum(1 for k in range(1,q+1) if G[k]<=i) for i in range(p+1)]
    cA=[sum(1 for k in range(1,p+1) if F[k]<=j) for j in range(q+1)]
    return p,q,f,g,(lambda i,j: 0<=i<=p and 0<=j<=q and cB[i]<=j and cA[j]<=i)
