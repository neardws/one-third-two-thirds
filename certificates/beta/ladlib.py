def ladder(n,broken):
    el=list(range(n));R={(i,i+2) for i in range(n-2)}|{(i,i+3) for i in range(n-3) if i not in broken}
    return el,R
