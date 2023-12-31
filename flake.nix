{
    inputs = {
        # nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
        # home-manager.url = "github:nix-community/home-manager/release-23.05";
        # home-manager.inputs.nixpkgs.follows = "nixpkgs";

        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    	home-manager.url = "github:nix-community/home-manager";
    	home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

	outputs = inputs@{ nixpkgs, home-manager, ... }: {
		nixosConfigurations = {
			laptop-gnome = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./hosts/laptop/configuration.nix
					./hosts/shared/gnome.nix
					home-manager.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.flo = import ./hosts/shared/home.nix;
					}
				];
			};
		};
	};
}
