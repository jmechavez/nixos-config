# Custom Hyprland/illogical-impulse config files, dropped in as plain text.
{ ... }:

{
  home.file = {
    # Slight transparency on all windows (active/inactive opacity)
    ".config/hypr/custom/rules.lua".text = ''
      hl.window_rule({ match = { class = ".*" }, opacity = "0.95 0.93" })
    '';

    # Default app bindings used elsewhere in the Hyprland config.
    # NOTE: "browser = zen" requires the zen-browser package to actually be
    # installed — see modules/home/apps.nix, which now installs it.
    # NOTE: taskManager is a *separate* variable from `terminal` — the
    # dots-hyprland default hardcodes it to kitty specifically
    # (`kitty -1 fish -c btop`), so it must be overridden on its own here
    # too, or btop keeps opening in kitty even with terminal = "foot".
    ".config/hypr/custom/variables.lua".text = ''
      browser = "zen"
      fileManager = "foot -e yazi"
      terminal = "foot"
      taskManager = "foot fish -c btop"
    '';
  };
}
