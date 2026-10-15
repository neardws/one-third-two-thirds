import csv,glob
from fractions import Fraction as F
from analyze import struct
summary=[];extremes={}
hist={}
with open("results.csv","w",newline="") as out:
  w=csv.writer(out); w.writerow(["n","digraph6","e","delta","delta_float","x","y"])
  for n in range(2,11):
    rows=[]
    for r in csv.reader(open(f"raw_{n}.csv")):
        e=int(r[2]);k=int(r[3]);d=F(k,e);rows.append((d,r[1],e,r[4],r[5]))
        if n<=9: w.writerow([n,r[1],e,str(d),f"{float(d):.6f}",r[4],r[5]])
    hist[n]=[float(x[0]) for x in rows]
    rows.sort()
    eq=[x for x in rows if x[0]==F(1,3)]; assert all(x[0]>=F(1,3) for x in rows)
    gt=[x for x in rows if x[0]>F(1,3)][:10]
    summary.append((n,len(rows)+1,len(rows),min(x[0] for x in rows),len(eq)))
    extremes[n]=(eq,gt)
import pickle;pickle.dump((summary,extremes),open("ext.pkl","wb"))
import matplotlib;matplotlib.use("Agg");import matplotlib.pyplot as plt
plt.figure(figsize=(8,5))
for n in (8,9,10): plt.hist(hist[n],bins=100,range=(1/3,0.5),histtype="step",density=True,label=f"n={n}")
plt.axvline(1/3,color='r',ls='--');plt.xlabel("delta(P)");plt.ylabel("density");plt.legend();plt.title("delta(P) over non-total posets")
plt.savefig("delta_hist.png",dpi=120)
for s in summary: print(s)
