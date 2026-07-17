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

    interactiveShellInit = ''
    direnv hook fish | source
  '';

    functions = {
      fish_greeting = "pokeget random";
    };

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

    shellAbbrs = {
      cl = "clear";
      dc = "docker compose";
      dcu = "docker compose up -d";
      dcd = "docker compose down";
    };
  };
}

