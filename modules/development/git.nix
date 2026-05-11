{ config, pkgs, ... }:
{
programs.git = {
    enable = true;
    settings = {
      user = {
        name  = "Will Nonnemaker";
        email = "wnonnemaker@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };
}
