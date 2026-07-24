# btop (resource monitor) config: disables btop's own background so the
# terminal's background (and Hyprland's window opacity rules) show through
# instead of a solid color.
{ ... }:
{
  programs.btop = {
    enable = true;
    settings = {
      theme_background = false;
    };
  };
}
