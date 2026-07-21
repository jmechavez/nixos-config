{ ... }:

{
  home.file = {
    ".config/hypr/custom/rules.lua".text = ''
      hl.window_rule({ match = { class = ".*" }, opacity = "0.98 0.93" })
    '';

    ".config/hypr/custom/variables.lua".text = ''
      browser = "zen"
      fileManager = "foot -e yazi"
      terminal = "foot"
    '';
  };
}
