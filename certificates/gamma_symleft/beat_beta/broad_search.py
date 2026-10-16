"""Deterministic bounded float screen + exact finite validation; no limit claims."""
import os,time,json,itertools,random
from pathlib import Path
from searchlib import *
from screenlib import screen
assert os.getpriority(os.PRIO_PROCESS,0)>=10
start=time.process_time();wall=time.monotonic();rng=random.Random(20261016)
beta=float(beta_decimal());counts={};short=[];checks=0;best=None
base=json.loads(Path('src/best_families/BELOW_caps_1003.json').read_text())
L0=set(base['left_cap']);R0=set(base['right_cap'])

def build(n,L,left,right,p,res):
 h=(n-4)//2;core={j for j in range(L,h+1) if j%p in res}
 return left|{n-4-j for j in right}|core|{n-4-j for j in core}

def test(kind,n,b,meta):
 global checks,best
 counts[kind]=counts.get(kind,0)+1
 if sum(counts.values())%500==0:throttle()
 v=screen(n,b)
 if v<=beta+2e-16:
  N,E,arg=exact(*fg(n,b));checks+=1
  if best is None or N*int(best['extensions'])<int(best['minority'])*E:
   with localcontext() as c:
    c.prec=85;gap=str(Decimal(N)/E-beta_decimal())
   best=dict(kind=kind,n=n,broken=sorted(b),minority=str(N),extensions=str(E),witness=arg,gap=gap,meta=meta,below_beta=below_beta(N,E))
   print(json.dumps({k:best[k] for k in ('kind','n','gap','meta')}),flush=True)
   Path('logs/broad_best.json').write_text(json.dumps(best,indent=2))
  if len(short)<100:short.append(dict(kind=kind,n=n,float=v,meta=meta))

def save():
 Path('logs/broad_search.json').write_text(json.dumps(dict(counts=counts,exact_checks=checks,best=best,cpu=time.process_time()-start,wall=time.monotonic()-wall,short=short,complete=True),indent=2))
# Every nonempty binary period through length 16; reflected core, unchanged beta caps.
for p in range(2,17):
 n=208+8*p
 for mask in range(1,1<<p):
  r={j for j in range(p) if mask>>j&1}
  test('period_exhaustive',n,build(n,100,L0,R0,p,r),dict(period=p,mask=mask,L=100))
 save()
# Longer periods: complete Hamming-radius-two neighborhoods of repeated Chen words.
for p in (20,30,40,50,60,80):
 n=208+4*p;r0={j for j in range(p) if j%10 in (3,6,9)}
 for k in (0,1,2):
  for inds in itertools.combinations(range(p),k):
   r=r0.symmetric_difference(inds)
   test('long_period_radius2',n,build(n,100,L0,R0,p,r),dict(period=p,flips=inds,L=100))
 save()
# Combine every saved cap pair whose cap lengths agree. No old claims are trusted.
caps={}
for path in sorted(Path('src/best_families').glob('*.json')):
 d=json.loads(path.read_text());L=d.get('cap_length');le=d.get('left_cap');ri=d.get('right_cap')
 if L and le is not None and ri is not None:
  caps.setdefault(L,set()).update((tuple(le),tuple(ri)))
for L,cs in sorted(caps.items()):
 n=108+20*max(0,(2*L+80-108+19)//20)
 for le in sorted(cs):
  for ri in sorted(cs):
   test('combined_caps',n,build(n,L,set(le),set(ri),10,{3,6,9}),dict(L=L,left=list(le),right=list(ri),period=10))
 save()
# Asymmetric random cap/core perturbations around beta, several cap depths and mutation sizes.
for t in range(20000):
 n=rng.choice((248,288,328,408));b=build(n,100,L0,R0,10,{3,6,9})
 k=rng.choice((3,4,5,6,8));inds=rng.sample(range(n-3),k)
 test('random_3_to_8_flips',n,b.symmetric_difference(inds),dict(flips=inds,seed=20261016))
save();print(json.dumps(dict(counts=counts,exact_checks=checks,cpu=time.process_time()-start)),flush=True)
