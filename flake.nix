{
  description = "my nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      # home-manager should track the same nixpkgs as the system
      inputs.nixpkgs.follows = "nixpkgs";
    };

		pi-src.url = "github:earendil-works/pi";
    pi-src.flake = false;
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
			pi-src,
      ...
    }:
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

				pi-pkg = pkgs.buildNpmPackage {
					pname = "pi-coding-agent";
					version = "0.73.1";
					src = pi-src;
					npmDepsHash = "sha256-...";

					buildInputs = [ pkgs.nodejs_20 ];

					buildPhase = ''
						npm run build
					'';

					installPhase = ''
						mkdir -p $out/bin
						cp -r . $out/lib/pi
						ln -s $out/lib/pi/packages/coding-agent/dist/index.js $out/bin/pi
					'';
					};
      ];


    in
    {
      nixosConfigurations = {
        gunction = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = shared ++ [
            ./hosts/gunction/configuration.nix
            ./hosts/gunction/hardware-configuration.nix
          ];
        };

        duciter = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = shared ++ [
            ./hosts/duciter/configuration.nix
            ./hosts/duciter/hardware-configuration.nix
          ];
        };
      };
    };
}
