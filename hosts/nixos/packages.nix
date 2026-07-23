# System-wide package set, available to every user on this machine.
# User-specific/GUI apps that only jmech_nix needs belong in
# modules/home/apps.nix instead (home-manager scope), not here.
{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # --- Core Utilities ---
    git
    wget
    obsidian
    lazygit
    libreoffice-fresh
    nvd            # Nix version diff tool, useful after `nixos-rebuild`
    masterpdfeditor4

    # --- Password Management ---
    pass
    gnupg

    # --- Power Tools ---
    # NOTE: neovim, ripgrep, fzf, zoxide, and yazi are intentionally NOT
    # listed here. They're already provided (with actual configuration)
    # by home-manager: zoxide via programs.zoxide (home.nix), yazi via
    # programs.yazi (modules/home/yazi.nix), and neovim/ripgrep/fzf via
    # home.packages (modules/home/dev-tools.nix). Declaring them again here
    # just adds a redundant, unconfigured copy of the same binary.
    btop           # Resource monitor
    bat            # Cat clone with syntax highlighting

    # --- Archive Tools ---
    unzip          # extract .zip files
    p7zip          # extract .7z and other archive formats

    # --- Browsers ---
    brave

    # --- Development Toolchains ---
    go
    rustc
    cargo
    nodejs
    corepack       # Manages package managers (npm, yarn, pnpm)
    rustup
    python3
    devenv
    direnv

    # --- Go Development Tools (for gopher.nvim) ---
    gopls
    golangci-lint
    gomodifytags   # Required by gopher.nvim
    gotests        # Required by gopher.nvim
    impl           # Required by gopher.nvim
    iferr          # Required by gopher.nvim
    gotools        # Additional Go utilities

    # --- Other Language LSP/Formatters ---
    rust-analyzer
    pyright
    typescript-language-server
    prettierd

    # --- Productivity & Communication ---
    zoom-us
    qbittorrent

    # --- Terminal Flair ---
    pokemonsay
    cbonsai
    cmatrix
    lolcat
    pokeget-rs

    # --- System Info & Diagnostics ---
    fastfetch
    onefetch
    tldr
    duf
    dust
    procs
    gping

    # Custom package from the `kiru` flake input (see flake.nix)
    inputs.kiru.packages.x86_64-linux.kiru
  ];

  # --- System Typography ---
  fonts.packages = with pkgs; [
    rubik
    nerd-fonts.ubuntu
    nerd-fonts.jetbrains-mono
  ];
}

