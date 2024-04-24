# flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      # build with your own instance of nixpkgs
      inputs.nixpkgs.follows = "nixpkgs";
    };
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    Hyprspace = {
          url = "github:KZDKM/Hyprspace";
    
          # Hyprspace uses latest Hyprland. We declare this to keep them in sync.
          inputs.hyprland.follows = "hyprland";
        };
  };

  outputs = { self, nixpkgs, chaotic, home-manager, hyprland, Hyprspace, }@inputs: {

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
           specialArgs = { inherit inputs hyprland; };
           modules = [
           ./configuration.nix
           home-manager.nixosModules.home-manager
          {
            home-manager.users.thomas = import ./home.nix;
            home-manager.useGlobalPkgs = true;
            home-manager.extraSpecialArgs = {inherit inputs;};
            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
          chaotic.nixosModules.default
         ];
     };
    homeConfigurations."thomas@nixos"= home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      specialArgs = {
	inherit inputs;
      };
      modules = [
        hyprland.homeManagerModules.default
        { wayland.windowManager.hyprland.enable = true; }
        # ...
      ];
    };
  };
 }
