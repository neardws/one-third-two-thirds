"""Exact all-pairs certificate for the symmetric-cap symleft family; stdlib only.
Run from any directory: python3 dominance_cert.py [--check].
No float participates in any calculation or proof decision.
"""
import json,os,sys,time
from pathlib import Path
from arithmetic import (F,Interval,Quad,mm,eye,power,matadd,scale,rowmap,prod,
                        masked,basisrow,basiscol,ibox,isqrt)
from family import LEFT, RIGHT, broken, ladder_fg
from structure import verify as structure_verify

if not __debug__:raise RuntimeError('Run without -O: certificate checks use assertions.')

ROOT=Path(__file__).resolve().parent
CUT=F(3486,10000)
GAMMA=Quad(F(113344761041171128772377413341625230454875,324915826638865693871423059126368044433152),
           F(-4782969,324915826638865693871423059126368044433152))
BETA=Quad(F(70601103221348402231752613608561321408507,202386202979838556018601359840018770821908),
          F(-76527504,202386202979838556018601359840018770821908))

def positive(x):
    """Exact sign in Q(sqrt(6697)); comparisons reduce to integer squares."""
    if x.b==0:return x.a>0
    if x.a>=0 and x.b>0:return True
    if x.a<=0 and x.b<0:return False
    return x.a*x.a>6697*x.b*x.b if x.a>0 else 6697*x.b*x.b>x.a*x.a

def chain(*factors):
    out=factors[0]
    for a in factors[1:]:out=mm(out,a)
    return out

def finite_check(m,c):
    """Full rectangle; valid ideals tested against literal intact generators.
    Includes ALL cross-chain pairs and checks each edge sum against insertion.
    """
    n=248+20*m;p=n//2;br=broken(m,True)
    even=[r for r in range(p) if 2*r+3<n and 2*r not in br]
    odd=[s for s in range(p) if 2*s+4<n and 2*s+1 not in br]
    valid=[[all(r+2>j or r+1<=i for r in even) and
            all(s+3>i or s+1<=j for s in odd) for j in range(p+1)] for i in range(p+1)]
    f=[[0]*(p+1) for _ in range(p+1)];g=[[0]*(p+1) for _ in range(p+1)]
    for i in range(p+1):
        for j in range(p+1):
            if valid[i][j]:f[i][j]=1 if i+j==0 else (f[i-1][j] if i else 0)+(f[i][j-1] if j else 0)
    for i in range(p,-1,-1):
        for j in range(p,-1,-1):
            if valid[i][j]:g[i][j]=1 if i==j==p else (g[i+1][j] if i<p else 0)+(g[i][j+1] if j<p else 0)
    e=g[0][0];N=g[0][1]
    assert e==f[p][p] and CUT<F(N,e)<F(1,2)
    word=c['PRE']+c['X']*m+c['MID']+c['Y']*m+c['SUF']
    actual=[[j-i for j in range(p+1) if valid[i][j]] for i in range(p+1)]
    assert actual==word
    maps=[rowmap(mask) for mask in word]
    suffix=[None]*(p+2);suffix[p+1]=basiscol(2)
    for i in range(p,-1,-1):suffix[i]=mm(maps[i],suffix[i+1])
    assert suffix[0][3][0]==e
    prefix=basisrow(3);ties=[];runner=0;ordinary=0;other=None
    for i in range(1,p+1):
        cross=mm(prefix,maps[i-1])[0];h=0
        for j in range(1,p+1):
            h+=f[i-1][j-1]*g[i][j-1]
            hm=sum(cross[t]*suffix[i][t][0] for t in range(6) if t<j-i+3)
            assert h==hm,(m,i,j)
            balance=min(h,e-h)
            if (i,j)==(1,1):assert balance==N
            elif (i,j)==(p,p):
                other=e-h
                assert balance==other==N
            else:
                assert F(balance,e)<CUT
                runner=max(runner,balance)
                ordinary=max(ordinary,balance)
            if balance==N:ties.append([i,j])
        prefix=[cross]
    assert ties==[[1,1],[p,p]] and other==N
    sandwich=chain(power(c['A'],m),c['M'],power(c['B'],m))
    assert chain(c['u'],sandwich,c['v'])[0][0]==e
    assert chain(c['un'],sandwich,c['v'])[0][0]==N
    assert chain(c['u'],sandwich,c['vother'])[0][0]==other
    return dict(m=m,n=n,E=str(e),N=str(N),other_endpoint=str(other),
                runner=str(runner),ordinary_runner=str(ordinary),ties=ties,pairs=p*p)

def generate(K=8):
    assert 1<=K
    supplied=json.loads((ROOT/'symleft_family.json').read_text())
    assert supplied['name']=='symleft' and supplied['n']==248
    assert supplied['endpoint_limit_evaluation']['radicand']==6697
    assert supplied['n0']==248 and supplied['step']==20 and supplied['L']==100
    assert supplied['period']==10 and supplied['residues']==[3,6,9]
    assert list(LEFT)==supplied['left']==supplied['right']==list(RIGHT)
    assert sorted(broken(0))==supplied['broken']
    p,q,f,g=ladder_fg(0)
    assert p==supplied['p'] and q==supplied['q']
    assert f==supplied['f'] and g==supplied['g']
    assert GAMMA==Quad(F(supplied['endpoint_limit_evaluation']['limit_a']),
                       F(supplied['endpoint_limit_evaluation']['limit_b']))
    structure=structure_verify()
    pre,block,mid,rightblock,suf=(structure[k] for k in ('PRE','X','MID','Y','SUF'))
    A,B,M=prod(block),prod(rightblock),prod(mid)
    assert A==B
    u=chain(basisrow(3),prod(pre));v=chain(prod(suf),basiscol(2))
    un=matadd(u,scale(chain(basisrow(2),prod(pre[1:])),-1))
    vother=chain(prod(suf[:-2]),matadd(rowmap(suf[-2]),scale(masked(rowmap(suf[-2]),0),-1)),
                 rowmap(suf[-1]),basiscol(2))
    c=dict(structure,A=A,B=B,M=M,u=u,un=un,v=v,vother=vother)
    a2=mm(A,A)
    assert matadd(matadd(mm(a2,A),scale(a2,-164)),scale(A,27))==[[0]*6 for _ in range(6)]
    r=Quad(82,1);s=Quad(82,-1)
    P=scale(matadd(a2,scale(A,-s)),1/((r-s)*r))
    Q=scale(matadd(scale(A,r),scale(a2,-1)),1/((r-s)*r))
    assert mm(A,P)==scale(P,r) and mm(A,Q)==scale(Q,s)
    assert matadd(P,Q)==scale(A,1/r)
    assert mm(Q,Q)==scale(Q,s/r)
    assert mm(P,P)==P and mm(P,Q)==mm(Q,P)==[[0]*6 for _ in range(6)]
    # Exact leading ratio and strict comparison, without sympy or decimal tests.
    leadE=chain(u,P,M,P,v)[0][0];leadN=chain(un,P,M,P,v)[0][0]
    assert positive(leadE) and leadN/leadE==GAMMA and positive(BETA-GAMMA)
    assert positive(GAMMA-CUT) and positive(F(1,2)-GAMMA)
    assert BETA*BETA*809544811919354224074405439360075083287632-BETA*564808825770787217854020908868490571268056+98514932395229383524692744047210220411461==0
    # All-m endpoint tie: normalized count difference is a+b*x+c*x^2,
    # x=(s/r)^(m-1), m>=1. All three coefficients vanish exactly.
    def diff(a,b):return chain(un,a,M,b,v)[0][0]-chain(u,a,M,b,vother)[0][0]
    difference=[diff(P,P),diff(P,Q)+diff(Q,P),diff(Q,Q)]
    assert all(x==0 for x in difference)
    D=10**40;root=isqrt(6697*D*D)
    assert root*root<6697*D*D<(root+1)*(root+1)
    z=Interval(F(root,D),F(root+1,D));ri=82+z;si=82-z;ti=si/ri
    gamma_interval=GAMMA.a+GAMMA.b*z
    gap=BETA-GAMMA
    gap_interval=gap.a+gap.b*z
    assert gap_interval.lo>0
    assert 0<si.lo and 0<ti.lo<=ti.hi<1
    Pi=[[(x.a+x.b*z).mesh() for x in ar] for ar in P]
    Qi=[[(x.a+x.b*z).mesh() for x in ar] for ar in Q]
    eps=ti**(K-1);tail=[]
    for ar,br in zip(Pi,Qi):
        row=[]
        for x,y in zip(ar,br):
            a=(x+Interval(0,eps.hi)*y).mesh();assert a.hi>=0
            row.append(Interval(max(0,a.lo),a.hi))
        tail.append(row)
    powers={i:ibox(power(A,i)) for i in range(K)};powers['T']=tail
    checks=[]
    def verify(label,left,local,right,skip=()):
        full=chain(left,ibox(local),right)[0][0]
        assert full.lo>0,(label,'nonpositive denominator')
        for d in range(-3,4):
            if d in skip:continue
            cut=CUT
            h=chain(left,ibox(masked(local,d)),right)[0][0];p=h/full
            if p.hi<cut:side='H';bound=p.hi
            elif p.lo>1-cut:side='E-H';bound=1-p.lo
            else:raise AssertionError((label,d,p.data(),str(cut)))
            checks.append(dict(type=label,d=d,minority=side,upper=str(bound),cut=str(cut),
                               ratio=p.data(),denominator_lower=str(full.lo)))
    U=ibox(u);V=ibox(v);MB=ibox(M)
    for t in range(len(pre)):
        verify('PRE:'+str(t),ibox(chain(basisrow(3),prod(pre[:t]))),rowmap(pre[t]),
            chain(ibox(prod(pre[t+1:])),tail,MB,tail,V),skip=(0,) if t==0 else ())
    for t in range(len(mid)):
        verify('MID:'+str(t),chain(U,tail,ibox(prod(mid[:t]))),rowmap(mid[t]),
            chain(ibox(prod(mid[t+1:])),tail,V))
    for t in range(len(suf)-1):
        verify('SUF:'+str(t),chain(U,tail,MB,tail,ibox(prod(suf[:t]))),rowmap(suf[t]),
            ibox(chain(prod(suf[t+1:]),basiscol(2))),skip=(0,) if t==len(suf)-2 else ())
    regimes=[(i,'T') for i in range(K)]+[('T',i) for i in range(K)]+[('T','T')]
    for k,l in regimes:
        for t in range(5):
            verify(f'LEFT:{k}:{l}:{t}',chain(U,powers[k],ibox(prod(block[:t]))),rowmap(block[t]),
                chain(ibox(prod(block[t+1:])),powers[l],MB,tail,V))
            verify(f'RIGHT:{k}:{l}:{t}',chain(U,tail,MB,powers[k],ibox(prod(rightblock[:t]))),rowmap(rightblock[t]),
                chain(ibox(prod(rightblock[t+1:])),powers[l],V))
    expected=(len(pre)+len(mid)+len(suf)-1)*7-2+2*(2*K+1)*5*7
    assert len(checks)==expected and len({(x['type'],x['d']) for x in checks})==expected
    denominator=chain(U,tail,MB,tail,V)[0][0]
    numerator=chain(ibox(un),tail,MB,tail,V)[0][0]
    target=numerator/denominator
    assert CUT<target.lo and target.hi<F(1,2)
    finite=[finite_check(m,c) for m in range(2*K)]
    assert finite[0]['E']==supplied['extensions'] and finite[0]['N']==supplied['minority']
    assert finite[0]['ties']==[[1,1],[124,124]]
    return dict(version=2,family=dict(name='symleft',n0=248,step=20,L=100,
        left=list(LEFT),right=list(RIGHT),period=10,residues=[3,6,9]),
        dominance_certified=True,balance_ratio_limit_certified=True,
        K=K,spectral_threshold=2*K,all_m_from=0,
        target_original='a_1,b_1 and a_p,b_p (exactly two tied maximizers)',
        target_reflected='a_1,b_1 and a_p,b_p (exactly two tied maximizers)',
        ordinary_cut=str(CUT),all_other_cut=str(CUT),structure=structure,
        matrices=dict(A=A,B=B,M=M,uE=u,uN=un,v=v,vother=vother),
        spectral_P=[[x.data() for x in row] for row in P],
        spectral_Q=[[x.data() for x in row] for row in Q],
        sqrt=z.data(),t=ti.data(),tail=[[x.data() for x in row] for row in tail],
        gamma=GAMMA.data(),gamma_interval=gamma_interval.data(),
        beta=BETA.data(),beta_minus_gamma=gap.data(),
        beta_minus_gamma_interval=gap_interval.data(),
        leading_E=leadE.data(),endpoint_difference=[x.data() for x in difference],
        target_ratio=target.data(),count=len(checks),checks=checks,
        maximum_upper=str(max(F(x['upper']) for x in checks)),
        maximum_ordinary_upper=str(max(F(x['upper']) for x in checks if x['cut']==str(CUT))),
        finite_checks=finite)

def main():
    os.environ['OMP_NUM_THREADS']='1'
    # Scheduling priority is irrelevant to the mathematics. Try to lower it
    # (same behaviour as the beta checker); if that is not possible, only warn.
    try:
        cur=os.getpriority(os.PRIO_PROCESS,0)
        if cur<10:os.nice(10-cur)
    except (AttributeError,OSError) as exc:
        print('warning: could not raise process niceness:',exc,file=sys.stderr)
    started=time.process_time_ns()
    result=generate();path=ROOT/'dominance_certificate.json'
    encoded=(json.dumps(result,indent=2)+'\n').encode('utf-8')
    if '--check' in sys.argv:
        assert path.read_bytes()==encoded,'Regenerated certificate differs byte for byte'
        print('Certificate regenerated and exactly matched.')
    else:path.write_bytes(encoded)
    print('All exact rational checks passed:',result['count'])
    print('Process CPU nanoseconds:',time.process_time_ns()-started)
    print('Spectral tail covers m >=',result['spectral_threshold'])
    print('Full grids cover m=0,...,',result['spectral_threshold']-1)
    print('Exactly two tied maximizing pairs: (a_1,b_1), (a_p,b_p), all m >= 0.')
    print('Exact gamma < beta; all other cross-chain pairs <',str(CUT))

if __name__=='__main__':main()
