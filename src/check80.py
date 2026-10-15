from indep import *
import glob,json
from decimal import Decimal as D,getcontext;getcontext().prec=40
beta=(D(5864893)+27*D(57).sqrt())/D(16812976)
pecz=D(1087457557)/D(3117322468)
rows=[]
for fn in sorted(glob.glob("sa2/*.txt"))+sorted(glob.glob("saout/*.txt")):
    l=sorted(open(fn))[0].split()
    f=[int(x) for x in l[3][2:].strip(',').split(',')];g=[int(x) for x in l[4][2:].strip(',').split(',')]
    if float(l[0])>0.3488436: continue
    el,R=poset_from_fg(f,g);up=closure(el,R);b,e,arg=balance(el,up)
    x=D(b.numerator)/D(b.denominator); rows.append((x,len(el),f,g,str(b)))
rows.sort()
seen=set()
for x,n,f,g,b in rows:
    if (n,str(x)) in seen: continue
    seen.add((n,str(x)))
    print(n,"%.15f"%x,"<beta" if x<beta else "", "<Peczarski" if x<pecz else "")
json.dump([dict(n=n,delta=b,f=f,g=g) for x,n,f,g,b in rows],open("below_beta.json","w"),indent=0)
