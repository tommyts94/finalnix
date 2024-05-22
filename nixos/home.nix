{ inputs, pkgs, ... }:

{

    imports = [
    ./hyprland.nix
	./gtk.nix
	./options.nix			
    ];
	home.username = "thomas";
	home.homeDirectory = "/home/thomas";

	home.packages = [
   	pkgs.htop
   	pkgs.waybar
   	pkgs.loupe
   	pkgs.resources
   	pkgs.gnome-text-editor
   	pkgs.motrix
   	pkgs.brave
   	pkgs.gnome.nautilus
   	pkgs.roboto
   	pkgs.roboto-mono
   	pkgs.atool
   	pkgs.unzip
	pkgs.qt6Packages.qt6ct
	pkgs.qt6Packages.qtstyleplugin-kvantum
    	pkgs.kitty
    	pkgs.volantes-cursors
    	pkgs.pavucontrol
    	pkgs.pyprland
    	pkgs.hypridle
    	pkgs.hyprlock
    	pkgs.hyprpaper
	pkgs.telegram-desktop
	pkgs.discord
	pkgs.mako
	pkgs.wofi
	pkgs.lutris
	pkgs.bottles
	pkgs.heroic
	pkgs.wineWowPackages.waylandFull
	pkgs.firefox
	pkgs.pasystray
	pkgs.networkmanagerapplet
	pkgs.font-awesome
	pkgs.ranger
	pkgs.micro
	pkgs.wl-clipboard
  ];
  fonts.fontconfig.enable = true;
	programs.bash = {
		enable = true;
		enableCompletion = true;
		bashrcExtra = ''
			export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
		'';
		
	};
    programs.kitty.enable = true;
    programs.kitty.theme = "Catppuccin-Macchiato";
    programs.kitty.extraConfig = "background_opacity 0.2";
	#programs.waybar = {
	#	enable = true;
	#	systemd.enable = false;
	#	package = pkgs.waybar;
	#};
       home.stateVersion = "23.11";
       programs.home-manager.enable = true;
}
