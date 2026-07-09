{ ... }:

{
  programs.yazi = {
    enable = true;
    # Only keep the openers here. 
    # Let Yazi handle its own default open rules to avoid TOML parsing errors.
    settings = {
      opener = {
        edit = [ { run = "nvim \"$@\""; block = true; desc = "Neovim"; } ];
        open = [ { run = "xdg-open \"$@\""; desc = "Open"; } ];
      };
    };
    theme = {
      manager = {
        cwd = { fg = "#ffffff"; };
        hovered = { bg = "#444444"; fg = "#ffffff"; };
        find_keyword = { fg = "#cccccc"; };
      };
    };
  };
}
