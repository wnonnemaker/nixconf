{ config, pkgs, ... }:
{

	environment.systemPackages = [
		(pkgs.whisper-cpp.override {
			cudaSupport = true;
			cudaPackages = pkgs.cudaPackages;
		})
	];   
}
