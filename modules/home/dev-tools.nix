# User-level dev CLI tools, shell (fish) config, aliases, and abbreviations.
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    gnumake
    gcc
    glibc
    pkg-config
    ripgrep
    fd
    fzf
    xclip
    wl-clipboard
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.fish = {
    enable = true;

    # Wire up direnv so `.envrc` files auto-load per project directory
    interactiveShellInit = ''
    direnv hook fish | source
  '';

    functions = {
      fish_greeting = "pokeget random"; # random Pokémon ASCII art on shell start
    };

    # Full command replacements
    shellAliases = {
      lg = "lazygit";
      v = "sudoedit";
      vim = "nvim";
      cat = "bat";
      nr = "sudo nixos-rebuild switch --flake /etc/nixos/#nixos";
      nup = "nix flake update /etc/nixos && sudo nixos-rebuild switch --flake /etc/nixos/#nixos";
      clean = "sudo nix-collect-garbage -d";

      ports = "sudo ss -tulpn";
      ip = "ip -c a";
      df = "duf";
      du = "dust";
      ps = "procs";
    };

    # Abbreviations expand inline as you type (visible before you hit enter)
    shellAbbrs = {
      cl = "clear";
      dc = "docker compose";
      dcu = "docker compose up -d";
      dcd = "docker compose down";
    };
  };
}

