#!/bin/sh
# Run all stdlib-only certificate checks (no Lean, no sympy). From any directory.
set -eu
repo=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$repo"
python3 certificates/pdagger/verify_pdagger.py
python3 certificates/limits_and_cP.py
python3 certificates/rank_one_limits.py
python3 certificates/beta/beta_dominance/dominance_cert.py --check
python3 certificates/gamma_symleft/symleft_dominance/dominance_cert.py --check
python3 certificates/two_generator_check.py
echo "all certificate checks passed"
