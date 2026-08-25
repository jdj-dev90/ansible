# Workstation Setup (Arch + Ansible)

This repo builds a repeatable Arch Linux workstation setup using a small bootstrap script and Ansible roles. It also includes a runbook with clear manual steps.

## Repo layout
- `archinstall/` Arch install notes and profile placeholder
- `bootstrap/` Minimal bootstrap script for first boot
- `ansible/` Playbook and roles for full setup
- `RUNBOOK.md` Step-by-step setup guide

## Quick start
1. Follow `archinstall/README.md` to install Arch (disk selection is interactive).
2. Run the bootstrap script:
   - `bash bootstrap/arch-bootstrap.sh`
3. Run the Ansible playbook:
   - `ansible-playbook -K ansible/playbook.yml`

## Required inputs
- GPG private key exported to `~/Downloads/secret.gpg`
- Pass store repo: `git@github.com:jdj-dev90/pwd-store.git`
- Dotfiles repo: `git@github.com:jdj-dev90/.dotfiles.git`

## Notes
- SSH key setup is automated in Ansible and pauses so you can add the key to GitHub.
- Devcontainers are handled separately (not part of this repo).

## Tests (lint)
Use the lint script to validate playbooks and scripts:
- `bash scripts/lint.sh`

## Tests (wrapper)
Use the test wrapper for quick checks:
- `bash scripts/test.sh`
- `bash scripts/test.sh --check`
