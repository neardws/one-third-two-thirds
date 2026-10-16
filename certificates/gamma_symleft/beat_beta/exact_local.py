import os,time,itertools,json,sys
from pathlib import Path
from decimal import Decimal,localcontext
from searchlib import *
sys.path.insert(0,'src')
from family import broken
assert os.getpriority(os.PRIO_PROCESS,0)>=10
start=time.process_time();wall=time.monotonic();n=int(sys.argv[1]) if len(sys.argv)>1 else 248
br=set(json.loads(Path(f'logs/exact_local_{n}.json').read_text())['broken']) if Path(f'logs/exact_local_{n}.json').exists() else broken((n-248)//20);best=exact(*fg(n,br));base=best;trace=[];count=0
for sweep in range(24):
    bv=best;bb=None;move=None
    for k in (1,2):
        for inds in itertools.combinations(range(n-3),k):
            if count%500==0: throttle()
            nb=br.symmetric_difference(inds);v=exact(*fg(n,nb));count+=1
            if 3*v[0]>v[1] and v[0]*bv[1]<bv[0]*v[1]:bv,bb,move=v,nb,inds
    with localcontext() as c:
        c.prec=85
        rec=dict(sweep=sweep,count=count,move=move,delta=str(Decimal(bv[0])/bv[1]),gap=str(Decimal(bv[0])/bv[1]-beta_decimal()),cpu=time.process_time()-start)
    trace.append(rec);print(json.dumps(rec),flush=True)
    Path(f'logs/exact_local_{n}.json').write_text(json.dumps(dict(n=n,trace=trace,broken=sorted(bb or br),minority=str(bv[0]),extensions=str(bv[1]),witness=bv[2],cpu=time.process_time()-start,wall=time.monotonic()-wall,complete=bb is None),indent=2))
    if bb is None:break
    br,best=bb,bv
