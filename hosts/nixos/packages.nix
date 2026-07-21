{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # --- Core Utilities ---
    git
    wget
    neovim
    obsidian
    lazygit
    libreoffice-fresh
    nvd

    # --- Password Management ---
    pass
    gnupg

    # --- Power Tools ---
    fzf            # Fuzzy finder
    zoxide         # Smarter 'cd'
    ripgrep        # Fast recursive search
    yazi           # Terminal file manager
    btop           # Resource monitor
    bat            # Cat clone with syntax highlighting

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

    inputs.kiru.packages.x86_64-linux.kiru
  ];

  # --- System Typography ---
  fonts.packages = with pkgs; [
    rubik
    nerd-fonts.ubuntu
    nerd-fonts.jetbrains-mono
  ];
}
