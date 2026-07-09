# NixOS Configuration

My personal NixOS configuration, managed via Nix Flakes. This setup serves as my stable baseline for system automation and development.

## System Overview
- **OS:** NixOS
- **Environment:** Linux (via WSL2 / Bare Metal)
- **Window Manager:** Hyprland (initialized with [end4 dotfiles](https://github.com/end-4/dots-hyprland))
- **Primary Language:** Go (Golang)

## Key Features & Structure
- **Modular Design:** Uses a modular configuration structure (Apps, Dev-tools, Yazi, Hyprland custom) for clean, maintainable code.
- **Reproducibility:** Fully managed via Nix Flakes to ensure consistent environments.
- **Git Workflow:** Integrated version control for rapid configuration management.
- **Automation:** Includes custom scripts for system monitoring, such as automated battery notifications.
- **Aesthetics:** Minimalist, polished design influenced by the end4 ecosystem.

## Dev Environment
This configuration is optimized for a backend web developer workflow, featuring:
- **Languages/Tools:** Go, PostgreSQL, npm, Git, and various database utilities (sqlx/sqlc).
- **Environment:** WSL2 optimized setup with seamless port binding and Linux utilities.

## Usage
To apply these configurations to your system:
```bash
sudo nixos-rebuild switch --flake .#default
