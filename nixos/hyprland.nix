{inputs, config, pkgs, ...}:
{
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    bind =
      [
        "$mainMod, Q, exec, kitty"
        "$mainMod, C, killactive,"
        "$mainMod, F, fullscreen"
        "$mainMod, E, exec, pypr toggle term"
        "$mainMod, A, overview:toggle"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, rofi -show drun -show-icons"
        "$mainMod, S, pseudo,"
        "$mainMod, L, exec, hyprlock"
        "$mainMod, M, exit,"
        "$mainMod, J, togglesplit,"
        ", Print, exec, grimblast copy area"
	"$mainMod, left, movefocus, l"
	"$mainMod, right, movefocus, r"
	"$mainMod, up, movefocus, u"
	"$mainMod, down, movefocus, d"
	"$mainMod, mouse_down, workspace, e+1"
	"$mainMod, mouse_up, workspace, e-1"
      ]      
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mainMod, ${ws}, workspace, ${toString (x + 1)}"
              "$mainMod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );
    bindm = 
      [
      	"$mainMod, mouse:272, movewindow"
      	"$mainMod, mouse:273, resizewindow"
      ];

    decoration = {
    	rounding = "6";
    	drop_shadow = "yes";
    	shadow_range = "4";
    	shadow_render_power = "3";
    	"col.shadow" = "rgba(1a1a1aee)";
    	blur = {
    		enabled = true;
    		size = 4;
    		passes = 3;
    		};
    };

   layerrule = [
   		"blur,waybar"
   ];
    
    exec-once = [
    	"hyprpaper"
    	"mako"
	    "hypridle"
    	"pasystray"
    	"nm-applet"
    	"systemctl --user start polkit-gnome-authentication-agent-1.service"

    ];
    exec = [
    	"systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    	"dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    ];

    misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
    };
    
    animations = {
    	enabled = true;
    	"bezier" = "myBezier, 0.05, 0.9, 0.1, 1.05";
    	animation = [
         "windows, 1, 4, myBezier"
    	 "windowsOut, 1, 4, default, popin 80%"
         "border, 1, 4, default"
         "borderangle, 1, 4, default"
         "fade, 1, 4, default"
         "workspaces, 1, 4, default"
        ]; 
    };
  };
  wayland.windowManager.hyprland.plugins = [
      # ... whatever
      inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
    ];
}
