{pkgs, ...}:
{
	home.sessionVariables = {
	        QT_QPA_PLATFORMTHEME = "qt6ct";
		   	CLUTTER_BACKEND = "wayland";
		   	WLR_RENDERER = "vulkan";
		    XDG_CURRENT_DESKTOP = "Hyprland";
		   	XDG_SESSION_DESKTOP = "Hyprland";
		   	XDG_SESSION_TYPE = "wayland";
		   	EDITOR = "micro";
	};
	
}
