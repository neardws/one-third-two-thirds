import csv,glob,gzip,sys
from fractions import Fraction as F
from collections import defaultdict
def parse(d6):
    n=ord(d6[1])-63;bits=[];
    for ch in d6[2:]:
        c=ord(ch)-63;bits+= [(c>>(5-k))&1 for k in range(6)]
    up=[[j for j in range(n) if bits[i*n+j]] for i in range(n)]
    lt=[[False]*n for _ in range(n)]
    for i in range(n):
        st=list(up[i])
        while st:
            j=st.pop()
            if not lt[i][j]: lt[i][j]=True; st+=up[j]
    return n,up,lt
def struct(d6):
    n,up,lt=parse(d6)
    cmp_=lambda a,b: lt[a][b] or lt[b][a]
    # height = longest chain
    h=[1]*n; order=sorted(range(n),key=lambda i:sum(lt[j][i] for j in range(n)))
    for i in order:
        for j in range(n):
            if lt[j][i]: h[i]=max(h[i],h[j]+1)
    height=max(h)
    width=1
    for m in range(1,1<<n):
        s=[i for i in range(n) if m>>i&1]
        if len(s)>width and all(not cmp_(a,b) for a in s for b in s if a<b): width=len(s)
    # disjoint union: comparability graph components
    seen=set();comps=0
    for s in range(n):
        if s in seen: continue
        comps+=1;st=[s];seen.add(s)
        while st:
            a=st.pop()
            for b in range(n):
                if b not in seen and cmp_(a,b): seen.add(b);st.append(b)
    # ordinal (linear-sum) summands: sort by #below; cut where every elem before is below every after
    o=sorted(range(n),key=lambda i:(sum(lt[j][i] for j in range(n)),i))
    # proper: summand blocks = maximal downsets D with D<all of complement; greedy over prefixes of some linear ext
    blocks=[];cur=[]
    rem=set(range(n));
    while rem:
        # smallest downset block: grow from minimal elements until all of block < all remaining
        mins=[i for i in rem if not any(lt[j][i] for j in rem)]
        B=set(mins)
        while True:
            R=rem-B
            bad={b for b in R for a in B if not lt[a][b]}
            if not bad: break
            # elements of R that are incomparable with something in B must join; also their down-closure
            add=set(bad)
            for b in list(add): add|={j for j in rem if lt[j][b]}
            B|=add
        blocks.append(B); rem-=B
    def bdesc(B):
        k=len(B)
        if k==1: return "1"
        sub=sorted(B); rel=[(a,b) for a in sub for b in sub if lt[a][b]]
        if k==3 and len(rel)==1: return "T"   # {a<b, c}
        if k==2 and not rel: return "A2"
        return f"[{k}]"
    summ="+".join(bdesc(B) for B in blocks)
    covers=[f"{i}<{j}" for i in range(n) for j in up[i]]
    return dict(width=width,height=height,disjoint_union=comps>1,ordinal_summands=summ,
                ordinal_decomposable=len(blocks)>1,covers=" ".join(covers))
