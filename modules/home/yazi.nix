# Yazi (terminal file manager) config: openers, color theme (flavor +
# manual overrides), and default file-manager association (so "Show in
# Folder" in apps like Zen launches yazi instead of a GTK file manager).
{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    settings = {
      opener = {
        edit = [
          { run = ''nvim "$@"''; block = true; desc = "Neovim"; }
        ];
        open = [
          { run = ''xdg-open "$@"''; desc = "Open"; }
        ];
      };
    };

    # Local copy of the flavor, checked into this repo under
    # ./yazi-flavors/flexoki-dark.yazi (copied from
    # ~/.config/yazi/flavors/flexoki-dark.yazi) so the config is fully
    # reproducible without depending on network access at build time.
    flavors = {
      flexoki-dark = ./yazi-flavors/flexoki-dark.yazi;
    };

    theme = {
      flavor = {
        dark = "flexoki-dark";
        light = "flexoki-dark";
      };

      # Manual overrides on top of the flavor above.
      mgr = {
        cwd = { fg = "#ffffff"; };
        hovered = { bg = "#444444"; fg = "#ffffff"; };
        find_keyword = { fg = "#cccccc"; };
      };
    };
  };

  # Registers yazi (running inside foot) as the system's default handler
  # for opening directories, so things like a browser's "Show in Folder"
  # or a file dialog's "Open Containing Folder" launch it.
  xdg.desktopEntries.yazi-foot = {
    name = "Yazi (foot)";
    genericName = "File Manager";
    exec = "foot -e yazi %U";
    terminal = false;
    categories = [ "System" "FileTools" ];
    mimeType = [ "inode/directory" ];
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = "yazi-foot.desktop";
      "application/pdf" = "masterpdfeditor4.desktop";
    };
  };
}
