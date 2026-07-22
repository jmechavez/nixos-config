# Yazi (terminal file manager) config: openers and color theme.
{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    settings = {
      opener = {
        # Files opened with Enter/"edit" go to neovim in a blocking terminal tab
        edit = [
          { run = ''nvim "$@"''; block = true; desc = "Neovim"; }
        ];
        # Files opened with "open" (e.g. images, PDFs) go to the desktop default
        open = [
          { run = ''xdg-open "$@"''; desc = "Open"; }
        ];
      };
    };
    theme = {
      # yazi renamed the theme.toml "manager" section to "mgr" in a recent
      # release — using `manager` here writes a section current yazi ignores.
      mgr = {
        cwd = { fg = "#ffffff"; };
        hovered = { bg = "#444444"; fg = "#ffffff"; };
        find_keyword = { fg = "#cccccc"; };
      };
    };
  };
}
