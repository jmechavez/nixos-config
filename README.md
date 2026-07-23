# NixOS Configuration

My personal NixOS configuration, managed via Nix Flakes. This setup serves as my stable baseline for system automation and development.

## System Overview

- **OS:** NixOS (bare metal)
- **Filesystem:** btrfs, with separate subvolumes for `/`, `/home`, and `/nix`
- **Bootloader:** systemd-boot (UEFI)
- **Window Manager:** Hyprland, configured via [illogical-impulse](https://github.com/soymou/illogical-flake) (inspired by the [end-4 dotfiles](https://github.com/end-4/dots-hyprland) ecosystem)
- **Shell:** fish, with zoxide (`cd`), direnv, and a set of custom aliases/abbreviations
- **Primary Languages:** Go, with additional support for Rust, Python, and TypeScript

## Flake Structure

```
flake.nix
hosts/nixos/
  configuration.nix       # host entry point: boot, networking, locale, security, ssh
  hardware-configuration.nix
  packages.nix             # system-wide packages
  services.nix              # docker, postgresql, bluetooth, geoclue2, nix gc
home/jmech_nix/
  home.nix                  # home-manager entry point
modules/system/
  desktop.nix                # Hyprland + SDDM
  audio.nix                   # PipeWire
  users.nix                    # user account definition
  steam.nix                     # Steam + remote play
modules/home/
  apps.nix                       # user-level GUI apps (zen-browser, kate)
  dev-tools.nix                    # CLI tools + fish config
  cursor.nix                        # Bibata cursor theme
  yazi.nix                           # yazi: openers, flavor, default file-manager association
  hypr-custom.nix                     # Hyprland variables/rules (browser, terminal, opacity)
  git.nix                               # git identity
```

## Key Features

- **Modular design:** system-level config (`hosts/`, `modules/system/`) is kept separate from user-level config (`modules/home/`), so home-manager modules only ever declare home-manager options and vice versa.
- **Reproducibility:** fully pinned via `flake.lock`; `nix flake update` bumps inputs deliberately rather than silently.
- **Default apps wired up via XDG:** Zen Browser as default browser, yazi (running in `foot`) as the default directory handler (e.g. "Show in Folder" from Zen), and Master PDF Editor as the default PDF viewer — all set through `xdg.mimeApps`.
- **Custom yazi theme:** a locally-vendored [flexoki-dark](https://github.com/yazi-rs/flavors) flavor plus manual color overrides, checked into `modules/home/yazi-flavors/` for full reproducibility without a network fetch at build time.
- **Docker + PostgreSQL** for local development, `nix.gc` running weekly to keep the store from growing unbounded.

## Dev Environment

- **Go:** `go`, `gopls`, `golangci-lint`, plus the toolchain gopher.nvim expects (`gomodifytags`, `gotests`, `impl`, `iferr`, `gotools`)
- **Rust:** `rustc`, `cargo`, `rustup`, `rust-analyzer`
- **Python:** `python3`, `pyright`
- **TypeScript/Web:** `nodejs`, `typescript-language-server`, `prettierd`
- **Databases:** PostgreSQL 16 (system service), plus local dev tooling
- **Containers:** Docker with autoprune enabled

## Usage

Rebuild the system after any config change:

```bash
sudo nixos-rebuild switch --flake /etc/nixos/#nixos
```

Or via the shell alias already set up in this config:

```bash
nr
```

Update flake inputs (nixpkgs, home-manager, etc.) and rebuild in one step:

```bash
nup
```

> Note: if `/etc/nixos` is a Git repo, Nix flakes only see files that Git is tracking — new files must be `git add`-ed before a rebuild will pick them up.
