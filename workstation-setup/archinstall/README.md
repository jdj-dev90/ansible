# Arch Install (Manual + Repeatable)

Disk hardware is unknown ahead of time, so disk selection and partitioning are done interactively in `archinstall`. The profile file here is a placeholder to keep the repo structure consistent.

## Install steps
1. Boot the Arch ISO and connect to the network.
2. Run `archinstall`.
3. Set these values:
   - Hostname: `jordan-work`
   - User: `jordan`
   - Timezone: `Australia/Brisbane`
   - Locale: `en_AU.UTF-8`
   - Bootloader: `systemd-boot`
   - Disk encryption: **LUKS2 full-disk encryption**
4. Choose the target disk interactively.
5. Complete installation and reboot.

## About profile.json
Use `archinstall` to generate and save a real config profile on the target machine, then replace `archinstall/profile.json` with that output if you want a committed baseline.
