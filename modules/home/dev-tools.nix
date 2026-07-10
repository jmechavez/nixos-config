{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    gnumake
    gcc
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
    shellAliases = {
      lg = "lazygit";
      v = "sudoedit";
      vim = "nvim";
      cat = "bat";
      nr = "sudo nixos-rebuild switch --flake /etc/nixos/#nixos";
      nup = "nix flake update /etc/nixos && sudo nixos-rebuild switch --flake /etc/nixos/#nixos";
      clean = "sudo nix-collect-garbage -d";
    };
    shellAbbrs = {
      cls = "clear";
    };
  };
}
