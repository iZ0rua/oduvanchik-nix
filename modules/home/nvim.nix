{ pkgs, config, user, inputs, ... }:
{
  xdg.desktopEntries = {
    nvim-ghostty = {
      name = "Neovim (Ghostty)";
      genericName = "Text Editor";
      # Home Manager handles the quoting for the exec command
      exec = "ghostty -e zsh -l -c \"nvim %F\"";
      terminal = false;
      type = "Application";
      icon = "nvim";
      categories = [ "Utility" "TextEditor" ];
      mimeType = [ "text/plain" ];
    };
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    defaultEditor = true;
  };
}
