import glob,re
from fractions import Fraction as F
import matplotlib;matplotlib.use("Agg");import matplotlib.pyplot as plt
from w2lib import delta
res={}
for fn in glob.glob("w2out/n*_p*.txt"):
    n=int(re.search(r"n(\d+)_",fn).group(1))
    for l in open(fn):
        if l.startswith("#") or not l.strip(): continue
        a=l.split(); f=[int(x) for x in a[5][2:].strip(',').split(',')]; g=[int(x) for x in a[4][2:].strip(',').split(',')]
        res.setdefault(n,[]).append((F(int(a[0]),int(a[1])),len(f),len(g),tuple(f),tuple(g)))
def covers(p,q,f,g):
    E=[]
    for i in range(1,p+1):
        j=f[i-1]
        if j<=q and not (i<p and f[i]==j) and not (j>1 and g[j-2]<=i): E.append((('a',i),('b',j)))
    for j in range(1,q+1):
        i=g[j-1]
        if i<=p and not (j<q and g[j]==i) and not (i>1 and f[i-2]<=j): E.append((('b',j),('a',i)))
    return E
def draw(n,d,p,q,f,g,fn):
    # y = position in a "typical" order: use index average
    fig,ax=plt.subplots(figsize=(3,0.45*max(p,q)+1.2))
    pos={}
    for i in range(1,p+1): pos[('a',i)]=(0,i)
    for j in range(1,q+1): pos[('b',j)]=(1,j)
    # better heights: rank sum layout
    for t in range(200):
        for (s,k),(x,y) in list(pos.items()):
            pass
    for i in range(1,p): ax.plot([0,0],[i,i+1],'k-')
    for j in range(1,q): ax.plot([1,1],[j,j+1],'k-')
    for u,v in covers(p,q,f,g):
        (x1,y1),(x2,y2)=pos[u],pos[v]; ax.annotate("",xy=(x2,y2),xytext=(x1,y1),arrowprops=dict(arrowstyle="->",color="tab:blue"))
    for (s,k),(x,y) in pos.items():
        ax.plot(x,y,'o',color='tab:red' if s=='a' else 'tab:green',ms=12); ax.text(x,y,f"{s}{k}",ha='center',va='center',fontsize=7,color='w')
    ax.set_title(f"n={n}  δ={d} ≈{float(d):.6f}",fontsize=9);ax.axis('off');ax.set_xlim(-0.6,1.6)
    plt.tight_layout();plt.savefig(fn,dpi=110);plt.close()
out=[]
for n in sorted(res):
    L=sorted(set(res[n]))
    # dedupe a/b swap
    seen=set();k=0
    for d,p,q,f,g in L:
        key=(d,frozenset([(f,g),(g,f)]))
        if key in seen: continue
        seen.add(key); dd=delta(p,q,f,g)[0]
        if dd!=d: print("MISMATCH",n,d,dd,p,q,f,g)
        if k<3: draw(n,d,p,q,f,g,f"hasse/n{n:02d}_{k+1}.png")
        out.append((n,k+1,str(d),float(d),p,q,f,g,covers(p,q,f,g))); k+=1
        if k>=3: break
import csv
w=csv.writer(open("width2_minima.csv","w",newline=""));w.writerow(["n","rank","delta","float","p","q","f","g","cross_covers(x<y)"])
for r in out: w.writerow(list(r[:6])+[" ".join(map(str,r[6])), " ".join(map(str,r[7])), " ".join(f"{u[0]}{u[1]}<{v[0]}{v[1]}" for u,v in r[8])])
for r in out:
    if r[1]==1: print(r[0],r[2],"%.6f"%r[3],r[4],r[5]," ".join(f"{u[0]}{u[1]}<{v[0]}{v[1]}" for u,v in r[8]))
