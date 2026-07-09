{ ... }:

{
  home.file = {
    ".config/hypr/custom/rules.lua".text = ''
      hl.window_rule({ match = { class = ".*" }, opacity = "0.95 0.90" })
    '';

    ".config/hypr/custom/variables.lua".text = ''
      browser = "zen"
      fileManager = "foot -e yazi"
    '';
  };
}
