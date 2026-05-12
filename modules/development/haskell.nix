{ config, pkgs, ... }:
{
	home.file = {
		".haskeline".text = ''
			editMode: Vi
		'';
	};
}
