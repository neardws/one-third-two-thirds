from indep import *
from decimal import Decimal as D,getcontext;getcontext().prec=50
beta=(D(5864893)+27*D(57).sqrt())/D(16812976)
import json
cands={
"P60":([2,3,4,5,7,7,9,9,10,11,13,13,14,15,17,17,18,19,21,21,22,23,25,25,27,27,28,29,30,31],
       [4,4,6,6,8,8,10,10,12,12,14,14,16,16,17,19,19,21,21,23,23,25,25,27,27,29,29,31,31,31]),
"P81":([2,3,4,5,7,7,9,9,10,11,13,13,14,15,17,17,18,19,21,21,23,23,25,25,27,27,29,29,31,31,33,33,35,35,37,37,39,39,41,41,41],
       [4,4,6,6,8,8,10,10,12,12,14,14,16,16,18,18,19,20,21,23,23,25,25,26,27,29,29,30,32,32,33,34,36,36,38,38,39,40,41,42])}
for name,(f,g) in cands.items():
    el,R=poset_from_fg(f,g); up=closure(el,R)
    b,e,arg=balance(el,up)
    # width: Dilworth -> two chains given; check not a chain-pair trivially: width>=2 since incomparable pairs exist
    # linear-sum test over all ideals
    down={x:{y for y in el if x in up[y]} for x in el}
    # enumerate ideals by closure-under-down of subsets reachable: reuse BFS
    idx={x:k for k,x in enumerate(el)}; bit={x:1<<idx[x] for x in el}; dm={x:sum(bit[y] for y in down[x]) for x in el}
    ideals={0};layer=[0]
    while layer:
        nxt=set()
        for I in layer:
            for x in el:
                if not I&bit[x] and (dm[x]&I)==dm[x]: nxt.add(I|bit[x])
        nxt-=ideals; ideals|=nxt; layer=list(nxt)
    full=(1<<len(el))-1; ls=False
    for I in ideals:
        if I in (0,full): continue
        ins=[x for x in el if I&bit[x]]; out=[y for y in el if not I&bit[y]]
        if all(y in up[x] for x in ins for y in out): ls=True;break
    x=D(b.numerator)/D(b.denominator)
    print(name,len(el),"ideals",len(ideals),"linear_sum",ls,"delta",b,"\n  =",x,"\n  delta-beta =",x-beta,"pair",arg)
    json.dump({"f":f,"g":g,"delta":str(b),"e":e},open(f"{name}.json","w"))
