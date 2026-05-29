{ config, pkgs, ... }:
{
	nixpkgs.config.cudaSupport = true;
	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = [
		(pkgs.whisper-cpp.override {
			cudaSupport = true;
			cudaPackages = pkgs.cudaPackages;
		})
	];   
}
