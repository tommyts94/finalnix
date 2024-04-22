{ inputs, pkgs, config, ...}:
{  
   boot.kernelPackages = pkgs.linuxPackages_latest;

   xdg.portal.enable = true;
   xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
   services.gvfs.enable = true;
   programs.steam.enable = true;
   virtualisation.waydroid.enable = true;
   hardware.opengl.enable = true;
   hardware.opengl.driSupport32Bit = true;  
   hardware.opengl.driSupport = true;
   hardware.opengl.extraPackages = with pkgs; [vulkan-loader libva vaapiVdpau libdrm];
   hardware.opengl.extraPackages32 = with pkgs; [vulkan-loader libva vaapiVdpau libdrm];
   #chaotic.mesa-git.enable = true;
   #chaotic.mesa-git.extraPackages = with pkgs; [ mesa_git vulkan-loader libva vaapiVdpau libdrm];
   #chaotic.mesa-git.extraPackages32 = with pkgs.pkgsi686Linux; [mesa32_git vulkan-loader libva vaapiVdpau libdrm];
   #chaotic.mesa-git.fallbackSpecialisation = true;
   # Misc
   zramSwap.enable = true;
   hardware.cpu.amd.updateMicrocode = true;

   # Virtualization
   virtualisation.libvirtd.enable = true;
   programs.dconf.enable = true; # virt-manager requires dconf to remember settings
   users.users.thomas.extraGroups = [ "libvirtd" ];

   virtualisation.podman.enable = true;
   nix.settings.auto-optimise-store = true;
   nix.gc = {
    automatic = true;
    dates = "weekly";
  };
}
