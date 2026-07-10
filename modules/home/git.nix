# modules/home/git.nix
{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "jmechavez";
    userEmail = "jmechavez@jmechavezit.com";
  };
}
