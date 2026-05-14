{ config, pkgs, ... }:
{
	services.ollama = {
		enable = true;
		loadModels = [ "llama3.2:3b" "deepseek-r1:1.5b" "llama3.1:8b" "qwen2.5:7b"];
		package = pkgs.ollama-cuda;
	};
}
