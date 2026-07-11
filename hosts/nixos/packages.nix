{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Core Utilities
    git
    wget
    neovim
    obsidian
    lazygit

    # Password Manager
    pass
    gnupg
    # pinentry-curses

    # New Power Tools
    fzf            # Fuzzy finder for files and history
    zoxide         # Smarter 'cd' command
    ripgrep        # Extremely fast recursive search (grep alternative)
    yazi
    btop
    bat

    # Browsers
    brave
    
    # Development Toolchains
    go
    rustc
    cargo
    nodejs
    corepack # Dynamically bridges global npm, yarn, and pnpm packages
    rustup
    python3

    # Essential LSP/Formatters
    gopls
    rust-analyzer
    pyright
    typescript-language-server
    prettierd
    
    # Message App
    zoom-us

    # Virtualisation Layer
    docker
    docker-compose

    # Fun / terminal flair
    pokemonsay
    cbonsai
    cmatrix
    lolcat
    pokeget-rs

    # Useful + pretty
    fastfetch
    onefetch
    tldr
    duf
    dust
    procs
    gping
  ];

  # Global System Typography Declarations
  fonts.packages = with pkgs; [
    rubik
    nerd-fonts.ubuntu
    nerd-fonts.jetbrains-mono
  ];

}
