{ pkgs, ...}:
{
    home.pointerCursor.package = pkgs.volantes-cursors;
    home.pointerCursor.name = "volantes_cursors";
    gtk = {
      enable = true;
      font.name = "Roboto 11";
      theme = {
        name = "adw-gtk3-dark";
        package = pkgs.adw-gtk3;
      };
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
      cursorTheme = {
          name = "volantes_cursors";
          package = pkgs.volantes-cursors;
        };

      gtk3.extraConfig = { 
      Settings = ''
        gtk-application-prefer-dark-theme=1
        gtk-cursor-theme-name=volantes_cursors
      '';
      };

      gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
        gtk-cursor-theme-name=volantes_cursors
      '';
      };
   };
     programs.rofi = {
    package = pkgs.rofi-wayland;
    enable = true;
    plugins = [pkgs.rofi-emoji];
    configPath = ".config/rofi/config.rasi";
    theme = "rounded-blue-dark.rasi"; 
  };
}
