# Steam gaming platform, with firewall ports opened for Remote Play and
# hosting dedicated game servers.
{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}

