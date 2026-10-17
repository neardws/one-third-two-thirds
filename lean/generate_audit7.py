"""Inventory the compiled project environment, then audit every declaration.

Run from the repository root (after a successful `./lean/lakew build`):
  python3 -B lean/generate_audit7.py
All subprocesses use the lake wrapper lean/lakew (set ELAN_HOME to use an
existing elan installation; see REPRODUCE.md).
No Python computation is used as a mathematical proof.
"""
import json
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent  # repository root
LEAN = ROOT / 'lean'
ALLOWED = {'propext', 'Classical.choice', 'Quot.sound'}
INVENTORY = '''import OneThird
import Lean
open Lean Elab Command
run_cmd do
  let env ← getEnv
  let mut entries : Array Json := #[]
  for (name, _) in env.constants.toList do
    if let some idx := env.getModuleIdxFor? name then
      let mod := env.header.moduleNames[idx.toNat]!
      if mod.toString == "OneThird" || mod.toString.startsWith "OneThird." then
        entries := entries.push (Json.mkObj [("name",toJson name.toString),("module",toJson mod.toString)])
  let ordered := entries.qsort (fun a b => a.compress < b.compress)
  liftIO <| IO.FS.writeFile "audit_inventory7.json" (Json.pretty (Json.arr ordered))
'''


def main():
    (LEAN / 'Inventory7.lean').write_text(INVENTORY)
    subprocess.run([str(LEAN / 'lakew'), 'env', 'lean', 'Inventory7.lean'], cwd=ROOT, check=True)
    inventory = json.loads((LEAN / 'audit_inventory7.json').read_text())
    names = sorted({x['name'] for x in inventory})
    (LEAN / 'audit_names7.txt').write_text('\n'.join(names) + '\n')
    # Use mkIdent so private/auxiliary names and numbered components are exact.
    # Each command is the usual Lean #print axioms command.
    audit = 'import OneThird\nimport Lean\nopen Lean Elab Command\nset_option maxHeartbeats 0\n'
    for start in range(0, len(names), 64):
        encoded = ',\n'.join('  ' + json.dumps(n, ensure_ascii=False) for n in names[start:start+64])
        audit += '''run_cmd do
  let names : Array String := #[
''' + encoded + '''\n  ]
  for s in names do
    let n := s.toName
    let id := mkIdent n
    elabCommand (← `(#print axioms $id))
'''
    (LEAN / 'CheckAxioms.lean').write_text(audit)
    with (LEAN / 'axioms7.log').open('w') as out:
        rc = subprocess.run([str(LEAN / 'lakew'), 'env', 'lean', 'CheckAxioms.lean'],
                            cwd=ROOT, stdout=out, stderr=subprocess.STDOUT).returncode
    (LEAN / 'axioms7.exit').write_text(str(rc) + '\n')
    log = (LEAN / 'axioms7.log').read_text()
    entries = []
    pat = r"'([^']+)' (?:depends on axioms: (\[[^\]]*\])|does not depend on any axioms)"
    for match in re.finditer(pat, log):
        axs = [s.strip() for s in (match.group(2) or '[]')[1:-1].split(',') if s.strip()]
        entries.append({'name': match.group(1), 'axioms': axs})
    audited = {e['name'] for e in entries}
    missing = sorted(set(names) - audited)
    unexpected = sorted({a for e in entries for a in e['axioms']} - ALLOWED)
    baseline = set((LEAN / 'audit_names6.txt').read_text().splitlines())
    result = {'method': 'compiled environment inventory by origin module; #print axioms for each declaration',
              'inventory_count': len(names), 'audited_count': len(entries), 'exit_code': rc,
              'allowed_axioms': sorted(ALLOWED), 'unexpected_axioms': unexpected,
              'missing_declarations': missing, 'result6_inventory_missing': sorted(baseline-audited),
              'declarations': entries,
              'source_modules_missing': sorted({'OneThird.'+p.stem for p in (LEAN/'OneThird').glob('*.lean')}-{x['module'] for x in inventory})}
    (LEAN / 'audit7.json').write_text(json.dumps(result, indent=2) + '\n')
    # Scan project Lean sources (not dependency caches), independently of audit.
    token = re.compile(r'\b(sorry|admit|native_decide|axiom)\b')
    hits = []
    sources = [LEAN/'OneThird.lean', *sorted((LEAN/'OneThird').glob('*.lean'))]
    for p in sources:
        for line_no, line in enumerate(p.read_text().splitlines(), 1):
            for match in token.finditer(line):
                hits.append({'file': str(p.relative_to(ROOT)), 'line': line_no,
                             'token': match.group(1), 'text': line})
    scan = {'files_scanned': len(sources), 'forbidden_tokens': ['sorry','admit','native_decide','axiom'],
            'hits': hits}
    (LEAN / 'source_scan7.json').write_text(json.dumps(scan, indent=2) + '\n')
    print(json.dumps({k:v for k,v in result.items() if k!='declarations'}, indent=2))
    print('source scan:', len(sources), 'files;', len(hits), 'hits')
    if rc or missing or unexpected or result['result6_inventory_missing'] or result['source_modules_missing'] or hits:
        sys.exit(1)

if __name__ == '__main__':
    main()
