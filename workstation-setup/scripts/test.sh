#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
cd "$repo_root"

if [[ ${1:-} == "--check" ]]; then
  ansible-playbook --check --diff ansible/playbook.yml
  exit 0
fi

bash scripts/lint.sh
