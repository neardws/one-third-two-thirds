"""Independent full-grid exact rechecks. Run with inherited nice>=10 from LaunchAgent; do not call nice/setpriority after searches."""
import json, os
from pathlib import Path
from fractions import Fraction
from cert.family import ladder_fg,broken,CAP
from track1_search import exact,annotation,pack,save
from w2lib import delta

def main():
    assert os.getpriority(os.PRIO_PROCESS,0)>=10
    results=[]
    for path in sorted(Path('best_families').glob('*.json')):
        d=json.loads(path.read_text())
        if not all(k in d for k in ('p','q','f','g')):continue
        p,q,f,g=(d[k] for k in ('p','q','f','g'))
        v,e,arg=delta(p,q,f,g)
        assert v==Fraction(int(d['minority']),int(d['extensions'])),str(path)
        assert e==int(d['extensions'])
        assert exact(p,q,f,g)[:2]==(int(d['minority']),e)
        results.append(dict(file=str(path),verified=True,**annotation(v.numerator,v.denominator)))
    # Several exact sizes of the existing reference family, retaining full counts.
    ref=[]
    for m in (0,1,2,4,8,16):
        n=108+20*m;p,q,f,g=ladder_fg(n,broken(n));v,e,arg=delta(p,q,f,g)
        z=pack(p,q,f,g,(v.numerator*(e//v.denominator),e,arg),n=n,m=m)
        assert not z['below_alpha'];ref.append(z)
    save('logs/verification.json',dict(candidates=results,reference=ref,
         below_alpha=[r for r in results if r['below_alpha']],complete=True))
    print('Independent exact verifications:',len(results),'reference sizes:',len(ref))
    print('Candidates below alpha:',sum(r['below_alpha'] for r in results))

if __name__=='__main__':main()
