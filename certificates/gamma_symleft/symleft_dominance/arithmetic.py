"""Exact rational certificate for all-pairs dominance. No floating-point decisions.
Run: python3 dominance_cert.py [--check] (writes or verifies dominance_certificate.json).
All input/output paths are relative to this workspace.
"""
from fractions import Fraction as F
from math import isqrt
from functools import lru_cache
import json
import sys

if not __debug__:
    raise RuntimeError("Run without -O: certificate checks use assertions.")

class Interval:
    __slots__ = ('lo', 'hi')
    def __init__(self, lo=0, hi=None):
        self.lo, self.hi = F(lo), F(lo if hi is None else hi)
        assert self.lo <= self.hi
    def __add__(self, other):
        other = box(other)
        return Interval(self.lo+other.lo, self.hi+other.hi)
    __radd__ = __add__
    def __neg__(self): return Interval(-self.hi, -self.lo)
    def __sub__(self, other): return self+-box(other)
    def __rsub__(self, other): return box(other)+-self
    def __mul__(self, other):
        other = box(other)
        corners = [a*b for a in (self.lo,self.hi) for b in (other.lo,other.hi)]
        return Interval(min(corners),max(corners))
    __rmul__ = __mul__
    def __truediv__(self, other):
        other = box(other)
        assert other.lo > 0
        return self*Interval(1/other.hi,1/other.lo)
    def __pow__(self, n):
        assert n >= 0
        if n == 0: return Interval(1)
        assert self.lo >= 0
        return Interval(self.lo**n,self.hi**n)
    def mesh(self):
        # Outward rational rounding; numerator // denominator is floor even if negative.
        scale=10**30
        low=self.lo*scale; high=self.hi*scale
        return Interval(F(low.numerator//low.denominator,scale),
                        F(-((-high.numerator)//high.denominator),scale))
    def data(self): return [str(self.lo),str(self.hi)]

def box(x): return x if isinstance(x,Interval) else Interval(x)
def mm(a,b):
    return [[sum((a[i][k]*b[k][j] for k in range(len(b))),0)
             for j in range(len(b[0]))] for i in range(len(a))]
def eye(n=6): return [[int(i==j) for j in range(n)] for i in range(n)]
def power(a,n):
    out=eye(len(a))
    while n:
        if n%2: out=mm(out,a)
        a=mm(a,a); n//=2
    return out
def matadd(a,b): return [[x+y for x,y in zip(ar,br)] for ar,br in zip(a,b)]
def scale(a,c): return [[c*x for x in row] for row in a]
def rowmap(mask):
    return [[int(d<=e+1<6 and all(t-3 in mask for t in range(d,e+2)))
             for e in range(6)] for d in range(6)]
def prod(word):
    out=eye()
    for mask in word: out=mm(out,rowmap(mask))
    return out
def masked(a, d):
    # At horizontal placement of a_i, h=i+e-3. a_i<b_j iff h<j.
    return [[x if e<d+3 else 0 for e,x in enumerate(row)] for row in a]
def basisrow(i): return [[int(j==i) for j in range(6)]]
def basiscol(i): return [[int(j==i)] for j in range(6)]
def ibox(a): return [[box(x) for x in row] for row in a]

# Q(sqrt(6697)), used to check the spectral identities exactly.
class Quad:
    __slots__=('a','b')
    def __init__(self,a=0,b=0): self.a,self.b=F(a),F(b)
    def __add__(self,y):
        y=q(y); return Quad(self.a+y.a,self.b+y.b)
    __radd__=__add__
    def __neg__(self): return Quad(-self.a,-self.b)
    def __sub__(self,y): return self+-q(y)
    def __rsub__(self,y): return q(y)+-self
    def __mul__(self,y):
        y=q(y); return Quad(self.a*y.a+6697*self.b*y.b,self.a*y.b+self.b*y.a)
    __rmul__=__mul__
    def __truediv__(self,y):
        y=q(y); norm=y.a*y.a-6697*y.b*y.b
        assert norm
        return self*Quad(y.a/norm,-y.b/norm)
    def __rtruediv__(self,y): return q(y)/self
    def __eq__(self,y):
        y=q(y); return self.a==y.a and self.b==y.b
    def data(self): return [str(self.a),str(self.b)]
def q(x): return x if isinstance(x,Quad) else Quad(x)


