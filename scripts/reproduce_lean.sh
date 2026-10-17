#!/bin/sh
# Clean-environment build and full axiom audit of the Lean development.
#
# Usage (from a fresh clone, any directory):
#   scripts/reproduce_lean.sh
#
# Requirements: git, curl, python3 (stdlib only), ~8 GB RAM, ~6 GB disk.
# If no elan is found, the official elan installer is fetched into ./.elan.
# The toolchain (lean/lean-toolchain) and Mathlib revision (lean/lake-manifest.json)
# are pinned; `lake exe cache get` downloads prebuilt Mathlib oleans.
set -eu
repo=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$repo"

if [ -z "${ELAN_HOME:-}" ]; then
  if [ -x "$HOME/.elan/bin/lake" ]; then
    ELAN_HOME="$HOME/.elan"
  else
    ELAN_HOME="$repo/.elan"
  fi
fi
export ELAN_HOME
if [ ! -x "$ELAN_HOME/bin/lake" ]; then
  echo "== installing elan into $ELAN_HOME"
  curl -sSfL https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh \
    | sh -s -- -y --no-modify-path --default-toolchain none
fi

echo "== commit: $(git rev-parse HEAD 2>/dev/null || echo unknown)"
echo "== toolchain: $(cat lean/lean-toolchain)"
start=$(date +%s)

echo "== fetching Mathlib cache"
./lean/lakew exe cache get

echo "== lake build (log: lean/build_repro.log)"
if ./lean/lakew build > lean/build_repro.log 2>&1; then
  echo "build: OK"
else
  echo "build: FAILED (see lean/build_repro.log)"; exit 1
fi
tail -n 1 lean/build_repro.log
mid=$(date +%s)

echo "== axiom audit (regenerates lean/CheckAxioms.lean, lean/axioms7.log, lean/audit7.json)"
python3 -B lean/generate_audit7.py
end=$(date +%s)
echo "== done: build $((mid-start)) s, audit $((end-mid)) s"
echo "Expected: 10311 declarations audited; axioms only propext, Classical.choice, Quot.sound;"
echo "source scan 60 files, 0 hits. Compare with lean/BUILD_STATUS7.md."
