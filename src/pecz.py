from indep import *
from decimal import Decimal as D,getcontext;getcontext().prec=40
import json
beta=(D(5864893)+27*D(57).sqrt())/D(16812976)
def ladder(n,broken):
    el=list(range(n));R={(i,i+2) for i in range(n-2)}|{(i,i+3) for i in range(n-3) if i not in broken}
    return el,R
T=[(9,[1,2,3,4]),(10,[1,5]),(11,[1,6]),(12,[1,7]),(13,[1,8]),(14,[1,9]),(15,[1,5,6,10]),(16,[1,11]),(17,[1,5,8,12]),
(18,[1,5,8,9,13]),(19,[1,5,6,9,10,14]),(20,[1,5,8,11,15]),(21,[1,5,8,9,12,16]),(22,[1,5,6,9,12,13,17]),(23,[1,5,8,11,14,18]),
(24,[1,5,8,11,12,15,19]),(25,[1,5,8,9,12,13,16,20]),(26,[1,5,8,11,14,17,21]),(27,[1,5,8,11,14,15,18,22]),
(29,[1,5,8,9,12,13,16,17,20,24]),(33,[1,5,8,9,12,13,16,17,20,21,24,28]),(34,[1,5,8,9,12,13,17,18,21,22,25,29]),
(41,[1,5,8,9,12,13,17,20,24,25,28,29,32,36]),(44,[1,5,8,9,12,13,17,20,23,27,28,31,32,35,39]),
(45,[1,5,8,9,12,13,17,20,21,24,28,29,32,33,36,40]),(49,[1,5,8,9,12,13,17,20,21,24,25,28,32,33,36,37,40,44]),
(50,[1,5,8,9,12,13,17,20,21,25,26,29,33,34,37,38,41,45])]
out=[]
for n,B in T:
    el,R=ladder(n,set(B));up=closure(el,R);b,e,_=balance(el,up);x=D(b.numerator)/D(b.denominator)
    out.append((n,B,b,x));print(f"L{n},{','.join(map(str,B))}  {b.numerator}/{b.denominator}  {x:.12f}  {'<beta' if x<beta else ''}")
json.dump([dict(n=n,broken=B,delta=str(b)) for n,B,b,x in out],open("pecz_table.json","w"))
# is our poset a ladder with broken rungs? interleave a,b alternately
def as_ladder(f,g):
    el,R=poset_from_fg(f,g);up=closure(el,R);p,q=len(f),len(g)
    for first in 'ab':
        seq=[];ia=ib=1;turn=first
        while ia<=p or ib<=q:
            if turn=='a' and ia<=p: seq.append(('a',ia));ia+=1
            elif turn=='b' and ib<=q: seq.append(('b',ib));ib+=1
            else: seq=None;break
            turn='b' if turn=='a' else 'a'
        if not seq: continue
        n=len(seq);lt=lambda i,j: seq[j] in up[seq[i]]
        Bk=[i for i in range(n-3) if not lt(i,i+3)]
        el2,R2=ladder(n,set(Bk));up2=closure(el2,R2)
        if all((seq[j] in up[seq[i]])==(j in up2[i]) for i in range(n) for j in range(n)): return Bk
    return None
for row in json.load(open("below_beta.json")):
    Bk=as_ladder(row["f"],row["g"]); fr=row["delta"].split('/');x=D(int(fr[0]))/D(int(fr[1]))
    print(row["n"],f"{x:.12f}","ladder broken:",Bk)
