"""Finite exact checks discharging the local all-parameter word argument.

Affine expressions have independently nonnegative integer variables. Every
branch below is proved uniform by coefficient signs, never inferred from samples.
"""
from family import LEFT,RIGHT,masks,OFF,broken

def add(a,b):return tuple(x+y for x,y in zip(a,b))
def neg(a):return tuple(-x for x in a)
def sub(a,b):return add(a,neg(b))
def mul(k,a):return tuple(k*x for x in a)
def const(k,a):return (k,)+(0,)*(len(a)-1)
def nonneg(a):return all(x>=0 for x in a)
def negative(a):return a[0]<0 and all(x<=0 for x in a[1:])

def symbolic_broken(j,m):
    """Reflected family's rung bit at affine j, all variable values >=0."""
    n=add(const(248,m),mul(20,m));last=add(n,const(-4,m))
    if negative(j) or negative(sub(last,j)):return False
    assert nonneg(j) and nonneg(sub(last,j)),('source bounds',j,m)
    if negative(sub(j,const(100,m))):
        assert not any(j[1:]);return j[0] in RIGHT
    if nonneg(sub(j,add(n,const(-103,m)))):
        reflected=sub(last,j)
        assert not any(reflected[1:]);return reflected[0] in LEFT
    assert nonneg(sub(j,const(100,m)))
    assert nonneg(sub(add(n,const(-104,m)),j))
    h=add(const(122,m),mul(10,m))
    if nonneg(sub(h,j)):v=j
    else:
        assert negative(sub(h,j)),('core seam',j,m)
        v=sub(last,j)
    assert all(x%10==0 for x in v[1:]),('phase',v)
    return v[0]%10 in (3,6,9)

def symbolic_mask(i,m):
    p=add(const(124,m),mul(10,m));out=[]
    for d in OFF:
        j=add(i,const(d,m))
        if negative(j) or negative(sub(p,j)):continue
        assert nonneg(j) and nonneg(sub(p,j)),('vertex bounds',i,m,d)
        if d==-3 and not symbolic_broken(add(mul(2,i),const(-5,m)),m):continue
        if d==2 and not symbolic_broken(mul(2,i),m):continue
        out.append(d)
    return out

def verify():
    # All-m broken-bit word, directly from the family definition:
    # LC U^m C V^m RC, lengths 100,10,45,10,100.
    # The core seam is h=122+10m; shifting by 10 preserves residues.
    # Reflection supplies the right core and cap. These are all possible joins.
    lc=[int(j in RIGHT) for j in range(100)]
    rc=[int(j in LEFT) for j in reversed(range(100))]
    u=[int(j%10 in (3,6,9)) for j in range(100,110)]
    left=[int(j%10 in (3,6,9)) for j in range(100,123)]
    middle=left+list(reversed(left[:-1]));v=list(reversed(u))
    pieces=[lc,u,middle,v,rc]
    # No pair of broken sources at distance two, including every possible join
    # with zero or positive repeat exponents and self-joins of repeat words.
    joins=[(0,1),(0,2),(1,1),(1,2),(2,3),(2,4),(3,3),(3,4)]
    for word in pieces+[pieces[a][-2:]+pieces[b][:2] for a,b in joins]:
        assert all(not(word[j] and word[j+2]) for j in range(len(word)-2))
    # The no-distance-two property ensures each two consecutive rung sources
    # of a fixed parity contain an intact rung. Thus f[r]<=r+3 and
    # g[r]<=r+4 whenever the corresponding sources exist; at the ends the
    # rectangle boundary supplies the same band. Every ideal satisfies
    # -3<=j-i<=2. Within that band offsets -2,-1,0,1 are automatic (subject
    # to rectangle bounds); -3 and 2 require exactly the source bits tested
    # in symbolic_mask. Hence checking these six offsets loses no ideals.
    # Exact source-bit check at base size (supplementary, not the all-m proof).
    bits=lc+middle+rc
    assert {j for j,b in enumerate(bits) if b}==broken(0,True)
    w=masks(0);w1=masks(1)
    pre,mid,suf=w[:53],w[53:64],w[64:]
    x,y=w1[53:58],w1[69:74]
    assert len(suf)==61 and x==y and len(mid)==11
    proofs=[]
    # Single nonnegative variable m for caps/join. Independent k,l for repeats,
    # where m=k+l+1, so every block instance in every m>=1 is covered.
    for name,word,base,slope in [('PRE',pre,0,0),('MID',mid,53,5),('SUF',suf,64,10)]:
        for t,mask in enumerate(word):
            i=(base+t,slope);m=(0,1)
            assert symbolic_mask(i,m)==mask,(name,t)
            proofs.append(dict(region=name,t=t,i=list(i),m=list(m),mask=mask))
    for name,word in [('LEFT',x),('RIGHT',y)]:
        for t,mask in enumerate(word):
            i=(53+t,5,0) if name=='LEFT' else (69+t,10,5)
            m=(1,1,1)
            assert symbolic_mask(i,m)==mask,(name,t)
            proofs.append(dict(region=name,t=t,i=list(i),m=list(m),mask=mask))
    # The above verifies the entire word symbolically, not for a finite m range.
    return dict(PRE=pre,X=x,MID=mid,Y=y,SUF=suf,
        bit_pieces=pieces,allowed_joins=[list(j) for j in joins],affine_row_cases=proofs,
        band=[-3,2],word='PRE X^m MID Y^m SUF')
