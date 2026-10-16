"""Diagnostic only; exact ranks and endpoint signed spectral coefficients."""
from family import masks,ladder_fg
from arithmetic import *
from decimal import Decimal,localcontext

def data():
    w=masks(0);w1=masks(1)
    pre,mid,suf=w[:53],w[53:64],w[64:]
    x,y=w1[53:58],w1[69:74]
    assert x==y
    return pre,x,mid,y,suf

def spectral(A):
    a2=mm(A,A);r=Quad(82,1);s=Quad(82,-1)
    return (scale(matadd(a2,scale(A,-s)),1/((r-s)*r)),
            scale(matadd(scale(A,r),scale(a2,-1)),1/((r-s)*r)))

if __name__=='__main__':
    pre,x,mid,y,suf=data();print('lengths',list(map(len,data())))
    u=mm(basisrow(3),prod(pre));un=matadd(u,scale(mm(basisrow(2),prod(pre[1:])),-1))
    v=mm(prod(suf),basiscol(2));vs=mm(prod(suf[:-2]),mm(matadd(rowmap(suf[-2]),scale(masked(rowmap(suf[-2]),0),-1)),mm(rowmap(suf[-1]),basiscol(2))))
    pa,qa=spectral(prod(x));pb,qb=spectral(prod(y));M=prod(mid)
    def diff(a,b):
        return mm(mm(mm(mm(un,a),M),b),v)[0][0]-mm(mm(mm(mm(u,a),M),b),vs)[0][0]
    coeff=[diff(pa,pb),diff(pa,qb)+diff(qa,pb),diff(qa,qb)]
    print('endpoint difference coefficients',[z.data() for z in coeff])
    with localcontext() as ctx:
        ctx.prec=70
        zz=Decimal(6697).sqrt()
        for z in coeff:print(Decimal(z.a.numerator)/z.a.denominator+zz*Decimal(z.b.numerator)/z.b.denominator)
    p,q,f,g=ladder_fg(0,True)
    from bisect import bisect_right
    lo=[bisect_right(g,i) for i in range(p+1)];hi=[z-1 for z in f]+[q]
    valid=lambda i,j:lo[i]<=j<=hi[i]
    ff=[[0]*(q+1) for _ in range(p+1)];gg=[[0]*(q+1) for _ in range(p+1)]
    for i in range(p+1):
        for j in range(q+1):
            if valid(i,j):ff[i][j]=1 if i+j==0 else (ff[i-1][j] if i else 0)+(ff[i][j-1] if j else 0)
    for i in range(p,-1,-1):
        for j in range(q,-1,-1):
            if valid(i,j):gg[i][j]=1 if (i,j)==(p,q) else (gg[i+1][j] if i<p else 0)+(gg[i][j+1] if j<q else 0)
    E=ff[p][q];rank=[]
    for i in range(1,p+1):
        h=0
        for j in range(1,q+1):
            h+=ff[i-1][j-1]*gg[i][j-1];rank.append((min(h,E-h),i,j))
    for v,i,j in sorted(rank,reverse=True)[:12]:print(i,j,str(F(v,E)),float(F(v,E)))
