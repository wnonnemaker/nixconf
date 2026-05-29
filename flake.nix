{
  description = "my nixos configuration";

  inputs = 
		{
			nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
			home-manager = {
				url = "github:nix-community/home-manager/master";
				# home-manager should track the same nixpkgs as the system
				inputs.nixpkgs.follows = "nixpkgs";
			};
			pi.url = "github:lukasl-dev/pi.nix";
			inputs.whisper-dictation.url = "github:jacopone/whisper-dictation";
		};

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
			pi,
      ...
    }@inputs:
    let
      shared = [
        ./modules/desktop
        ./modules/scripts
        ./modules/system
        ./modules/terminal
        ./modules/development

        # Make home-manager use system pkgs
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
        }
      ];
    in
    {
      nixosConfigurations = {
        gunction = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
					specialArgs = { inherit inputs; };
          modules = shared ++ [
            ./hosts/gunction/configuration.nix
            ./hosts/gunction/hardware-configuration.nix
          ];
        };

        duciter = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
					specialArgs = { inherit inputs; };
          modules = shared ++ [
            ./hosts/duciter/configuration.nix
            ./hosts/duciter/hardware-configuration.nix
          ];
        };
      };
    };
}
