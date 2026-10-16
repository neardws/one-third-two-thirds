"""Exact endpoint limit only; does NOT certify the limit of max pair balance.
The row word is proved for every m by candidate_structure.verify().
Run: OMP_NUM_THREADS=1 python3 evaluate_symleft_limit.py
"""
import sys,json,time,os
from pathlib import Path
from fractions import Fraction as F
from decimal import Decimal,localcontext
from searchlib import exact,beta_decimal,BETA_A,BETA_B,BETA_C
from candidate_family import ladder_fg
from candidate_structure import verify
sys.path.insert(0,'src')
from arithmetic import Quad,mm,prod,power,eye,matadd,scale,basisrow,basiscol
if not __debug__:raise RuntimeError('Run without -O')
assert os.getpriority(os.PRIO_PROCESS,0)>=10
start=time.process_time()
def sign(x):
 a,b=x.a,x.b
 if not b:return (a>0)-(a<0)
 if not a:return (b>0)-(b<0)
 if a>0 and b>0:return 1
 if a<0 and b<0:return -1
 z=a*a-6697*b*b
 return ((z>0)-(z<0))*(1 if a>0 else -1)
def dec(x):
 return Decimal(x.a.numerator)/x.a.denominator+Decimal(x.b.numerator)/x.b.denominator*Decimal(6697).sqrt()
w=verify();P,X,M,Y,S=[prod(w[k]) for k in ('PRE','X','MID','Y','SUF')]
assert X==Y
rho=Quad(82,1);sigma=Quad(82,-1)
assert sign(rho)>0 and sign(sigma)>0 and sign(rho-sigma)>0
# X^4 times its quadratic factor vanishes: no unaccounted spectral modes.
x4=power(X,4);x5=mm(x4,X);x6=mm(x5,X)
assert matadd(matadd(x6,scale(x5,-164)),scale(x4,27))==[[0]*6 for _ in range(6)]
Q=scale(matadd(x5,scale(x4,-sigma)),1/(rho*rho*rho*rho*(rho-sigma)))
R=scale(matadd(x5,scale(x4,-rho)),1/(sigma*sigma*sigma*sigma*(sigma-rho)))
assert mm(X,Q)==scale(Q,rho) and mm(X,R)==scale(R,sigma)
assert mm(Q,Q)==Q and mm(R,R)==R
assert matadd(scale(Q,rho*rho*rho*rho),scale(R,sigma*sigma*sigma*sigma))==x4
# Therefore X^m/rho^m -> Q, exactly proved for all m>=4.
top=basiscol(2);uE=mm(basisrow(3),P)
uN=matadd(uE,scale(mm(basisrow(2),prod(w['PRE'][1:])),-1))
col=mm(mm(mm(mm(Q,M),Q),S),top)
E=mm(uE,col)[0][0];N=mm(uN,col)[0][0]
assert sign(E)>0
limit=N/E
assert sign(limit)>0 and sign(Quad(F(1,2))-limit)>0
beta=Quad(F(BETA_A,BETA_C),F(BETA_B,BETA_C))
assert sign(beta-limit)>0 # Exact rational squared comparison in sign().
samples=[]
for m in (0,1,2,4,8,16,32):
 p,q,f,g=ladder_fg(m);a,e,arg=exact(p,q,f,g)
 # This also checks endpoint extraction against independent all-pairs DP.
 colm=mm(mm(mm(mm(power(X,m),M),power(X,m)),S),top)
 ee=mm(uE,colm)[0][0];nn=mm(uN,colm)[0][0]
 assert e==ee and a==nn and arg==(1,1)
 with localcontext() as c:
  c.prec=90
  samples.append(dict(m=m,n=248+20*m,delta=str(Decimal(a)/e),gap=str(Decimal(a)/e-beta_decimal()),witness=arg))
with localcontext() as c:
 c.prec=90
 out=dict(ok=True,scope='exact limit of endpoint minority probability ONLY; not full balance-ratio limit',
  family='symleft: n=248+20m, cap_length=100, symmetric caps, reflected Chen period-10 core',
  limit_a=str(limit.a),limit_b=str(limit.b),radicand=6697,
  endpoint_limit_decimal=str(dec(limit)),endpoint_limit_minus_beta=str(dec(limit-beta)),
  endpoint_limit_below_beta=True,balance_ratio_limit_certified=False,
  all_pairs_finite_samples=samples,word_proof_cases=len(w['affine_row_cases']),
  missing='Uniform all-pairs dominance or limsup bound for growing m.',
  cpu=time.process_time()-start)
Path('logs/symleft_endpoint_limit.json').write_text(json.dumps(out,indent=2)+'\n')
p=Path('best_families/symleft.json');d=json.loads(p.read_text());d['endpoint_limit_evaluation']=out;p.write_text(json.dumps(d,indent=2)+'\n')
print(json.dumps(out,indent=2))
