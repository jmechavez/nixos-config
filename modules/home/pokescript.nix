{ pkgs, ... }:
let
  pokescript = pkgs.stdenv.mkDerivation {
    pname = "pokescript";
    version = "unstable";
    src = pkgs.fetchFromGitHub {
      owner = "acxz";
      repo = "pokescript";
      rev = "master";
      sha256 = "sha256-yFgzME1KgXpPQXbyFbxeSTv/H/Yof4ICz3NZQIZdzns=";
    };
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/opt/pokemon-colorscripts
      cp -r colorscripts $out/opt/pokemon-colorscripts/
      cp nameslist.txt $out/opt/pokemon-colorscripts/
      cp pokemon-colorscripts.sh $out/opt/pokemon-colorscripts/pokemon-colorscripts
      mkdir -p $out/bin
      ln -s $out/opt/pokemon-colorscripts/pokemon-colorscripts $out/bin/pokemon-colorscripts
      chmod +x $out/opt/pokemon-colorscripts/pokemon-colorscripts
    '';
  };
in
{
  home.packages = [ pokescript ];
}
