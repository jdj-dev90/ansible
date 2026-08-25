# Runbook

This runbook highlights each step and calls out when manual input is required.

## Phase 1: Arch install (manual)
You do:
1. Boot Arch ISO and connect to the network.
2. Run `archinstall`.
3. Set these values:
   - Hostname: `jordan-work`
   - User: `jordan`
   - Timezone: `Australia/Brisbane`
   - Locale: `en_AU.UTF-8`
   - Bootloader: `systemd-boot`
   - Disk encryption: LUKS2 full-disk encryption
4. Choose the target disk interactively.
5. Complete the install and reboot.

What happens:
- Base Arch system is installed with encrypted disk and systemd-boot.

## Phase 2: Bootstrap (manual)
You do:
1. Clone this repo into `code/playbooks/workstation-setup`.
2. Run `bash bootstrap/arch-bootstrap.sh`.

What happens:
- Installs `git`, `python`, `ansible`, `stow`, `docker`, `docker-compose`, and `yay`.
- Enables Docker and adds you to the `docker` group.

## Phase 3: Ansible (automated with a manual pause)
You do:
- Run `ansible-playbook -K ansible/playbook.yml`.

What happens:
1. Ansible generates an SSH key (if missing) and prints the public key.
2. It pauses so you can add the key to GitHub.
3. It continues with dotfiles, packages, pass setup, and tools.

When it pauses:
- Copy the printed key into GitHub.
- Press Enter to continue.

## Phase 4: Pass store setup
You do:
- Ensure your GPG private key is at `~/Downloads/secret.gpg` before running Ansible.

What happens:
- Imports the key if missing.
- Clones `git@github.com:jdj-dev90/pwd-store.git` into `~/.password-store`.
- Validates `.gpg-id` matches the expected fingerprint.

## Phase 5: Validation (manual)
You do:
- `git --version`
- `docker info`
- `docker compose version`
- Launch `zsh`, `tmux`, and run `pass ls`
