"""Pure definition of the symmetric-cap symleft P_m and its reflection.
No runtime dependencies outside Python's standard library.
"""
LEFT=RIGHT=(1,5,8,9,12,13,17,20,21,25,28,29,33,36,37,43,49,55,61,67,73,79,85,91,97)
OFF=tuple(range(-3,3))

def broken(m, reflected=False):
    assert isinstance(m,int) and m>=0
    n=248+20*m;h=(n-4)//2
    core={j for j in range(100,h+1) if j%10 in (3,6,9)}
    core|={n-4-j for j in core}
    br=set(LEFT)|{n-4-j for j in RIGHT}|core
    return {n-4-j for j in br} if reflected else br

def ladder_fg(m,reflected=False):
    n=248+20*m;p=n//2;br=broken(m,reflected)
    f=[p+1]*(p+1);g=[p+1]*(p+1)
    for r in range(p-1,-1,-1):
        f[r]=min(r+2 if 2*r+3<n and 2*r not in br else p+1,f[r+1])
        g[r]=min(r+3 if 2*r+4<n and 2*r+1 not in br else p+1,g[r+1])
    return p,p,f[:p],g[:p]

def masks(m,reflected=True):
    """Actual row intervals from monotone cross maps; assert the entire band."""
    from bisect import bisect_right
    p,q,f,g=ladder_fg(m,reflected)
    out=[]
    for i in range(p+1):
        lo=bisect_right(g,i);hi=f[i]-1 if i<p else q
        ds=tuple(range(lo-i,hi-i+1))
        assert all(d in OFF for d in ds),(m,i,ds)
        out.append(list(ds))
    return out
