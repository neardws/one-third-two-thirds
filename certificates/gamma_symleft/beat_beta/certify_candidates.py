"""Recheck all saved finite candidates using two integer DP implementations.
Run: OMP_NUM_THREADS=1 python3 certify_candidates.py
No assertion may be disabled. Exact beta comparisons use integer squares.
"""
import json,sys,time,os
from pathlib import Path
from decimal import Decimal,localcontext
from fractions import Fraction
from searchlib import exact,fg,below_beta,beta_decimal
sys.path.insert(0,'src')
from w2lib import delta as dense_delta
if not __debug__:raise RuntimeError('Run without -O')
assert os.getpriority(os.PRIO_PROCESS,0)>=10
start=time.process_time()
local=json.loads(Path('logs/exact_local_248.json').read_text())
broad=json.loads(Path('logs/broad_best.json').read_text())
candidates=[('FINITE_exact_local_248',local,'Finite 24-sweep continuation after 6 initial radius-two sweeps; NOT a growing-family limit certificate.'),
 ('FINITE_broad_best',broad,'Best screened finite candidate from broad search; NOT a limit certificate.')]
for name in ('symleft','asym','symright'):
 d=json.loads(Path(f'best_families/{name}.json').read_text());d['n']=d['n0']
 candidates.append((name,d,'Growing-family proposal; only this finite member is certified here.'))
summary=[]
for name,d,label in candidates:
 p,q,f,g=fg(d['n'],set(d['broken']));N,E,arg=exact(p,q,f,g)
 rat,ee,arg2=dense_delta(p,q,f,g)
 assert ee==E and rat==Fraction(N,E) and arg==arg2
 if 'minority' in d: assert int(d['minority'])==N and int(d['extensions'])==E
 with localcontext() as c:
  c.prec=90;x=Decimal(N)/E;gap=x-beta_decimal()
 out=dict(d,label=label,certification='exact finite all-pairs balance ratio; two integer DP implementations agree',
    p=p,q=q,f=f,g=g,minority=str(N),extensions=str(E),witness=arg,
    delta=str(x),finite_delta_minus_beta=str(gap),finite_below_beta=below_beta(N,E),
    balance_ratio_limit_certified=False)
 Path(f'best_families/{name}.json').write_text(json.dumps(out,indent=2)+'\n')
 summary.append(dict(name=name,n=d['n'],delta=str(x),gap=str(gap),finite_below_beta=below_beta(N,E),witness=arg))
result=dict(ok=True,comparison='integer squared comparison against exact beta',candidates=summary,cpu=time.process_time()-start)
Path('logs/finite_certification.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
