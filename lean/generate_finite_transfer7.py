"""Bind result4 finite DP events to transfer crossings by kernel decide proofs.
All inputs are existing public Lean tables; this generator is not trusted.
Run from anywhere: python3 lean/generate_finite_transfer7.py (rewrites
lean/OneThird/FiniteTransferData7_*.lean and FiniteTransferVerified7.lean).
"""
from pathlib import Path
import re
ROOT=Path(__file__).resolve().parent.parent  # repository root
for m in range(8):
    old=(ROOT/f'lean/OneThird/GridData4_{m}.lean').read_text()
    fpart=old.split('def f :',1)[1].split('def g :',1)[0]
    gpart=old.split('def g :',1)[1].split('theorem fr0',1)[0]
    def parse(s): return [[int(x) for x in row.split(',')] for row in re.findall(r'!\[([\d, ]+)\]',s)]
    f,g=parse(fpart),parse(gpart)
    p=54+10*m
    assert len(f)==len(g)==p+1
    pref=[[0,0,0,1,0,0]]+[r[1:]+[0] for r in f[:p]]
    suff=g+[[0,0,1,0,0,0]]
    def vec(r):return '!['+', '.join(map(str,r))+']'
    s=f'''module
public import OneThird.FiniteTransfer7
@[expose] public section
namespace OneThird.FiniteTransferData7_{m}
open Matrix Structure FiniteGrid4 FiniteTransfer7
set_option maxHeartbeats 0
set_option maxRecDepth 100000
'''
    for r in range(p+1):s+=f'def p{r} : Matrix (Fin 1) (Fin 6) ℤ := fun _ => {vec(pref[r])}\n'
    for r in range(p+2):s+=f'def g{r} : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => {vec(suff[r])} d\n'
    for r in range(p):s+=f'theorem fr{r} : p{r+1}=p{r}*rowMatrix (rowMask {m} {r}) := by decide\n'
    for r in range(p+1):s+=f'theorem br{r} : g{r}=rowMatrix (rowMask {m} {r})*g{r+1} := by decide\n'
    for r in range(p):s+=f'''theorem ev{r} : ∀d : Fin 7,
    (p{r}*eventRow (rowMask {m} {r}) ((d.val : ℤ)-3)*g{r+1}) 0 0=
      (eventCount GridData4_{m}.f GridData4_{m}.g {r+1} d : ℤ) := by
  intro d; fin_cases d <;> decide
'''
    s+=f'''def checked : FiniteTransfer7.Checked ⟨{m},by decide⟩ where
  pref := fun r => ![{', '.join('p'+str(r) for r in range(p+1))}] r
  suff := fun r => ![{', '.join('g'+str(r) for r in range(p+2))}] r
  initial := by decide
  terminal := by decide
  forward := by
    intro r
    fin_cases r
'''+''.join(f'    exact fr{r}\n' for r in range(p))
    s+='  backward := by\n    intro r\n    fin_cases r\n'+''.join(f'    exact br{r}\n' for r in range(p+1))
    s+='  event := by\n    intro r\n    fin_cases r\n'+''.join(f'    exact ev{r}\n' for r in range(p))
    s+=f'end OneThird.FiniteTransferData7_{m}\n'
    (ROOT/f'lean/OneThird/FiniteTransferData7_{m}.lean').write_text(s)
s='module\n'+''.join(f'public import OneThird.FiniteTransferData7_{m}\n' for m in range(8))
s+='@[expose] public section\nnamespace OneThird.FiniteTransfer7\ndef verified : (m : Fin 8) → Checked m\n'
s+=''.join(f'  | ⟨{m},_⟩ => FiniteTransferData7_{m}.checked\n' for m in range(8))
s+='  | ⟨n+8,h⟩ => False.elim (by omega)\nend OneThird.FiniteTransfer7\n'
(ROOT/'lean/OneThird/FiniteTransferVerified7.lean').write_text(s)
