#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)

if ! command -v ansible-lint >/dev/null 2>&1; then
  echo "ansible-lint is not installed."
  exit 1
fi

if ! command -v shellcheck >/dev/null 2>&1; then
  echo "shellcheck is not installed."
  exit 1
fi

cd "$repo_root"

ansible-lint ansible/playbook.yml
shellcheck bootstrap/arch-bootstrap.sh
