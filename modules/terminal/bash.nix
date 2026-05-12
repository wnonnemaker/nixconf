{ pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    historyControl = [ "ignoredups" "ignorespace" ];

    shellAliases = {
      # General
      ls             = "ls --color=auto";
      grep           = "grep --color=auto";
      ".."           = "cd ..";
      py             = "python3";
      ccat           = "pygmentize -g -O linenos=1";

      # Editors / man
      #ghci           = "ghc --interactive";

      # Servers / networking
      connlinode     = "ssh root@172.233.152.243";
      connmultifamlink = "ssh root@172.233.130.56";

      # Docker
      compose        = "docker-compose";

      # Git
      pull           = "git remote update --prune && git pull --ff-only";
      refresh        = "git fetch origin main:main && git rebase main";

      # System
      fullsysbk      = "sudo rsync -aAXHv --exclude='/dev/*' --exclude='/proc/*' --exclude='/sys/*' --exclude='/tmp/*' --exclude='/run/*' --exclude='/mnt/*' --exclude='/media/*' --exclude='/lost+found/' / /mnt/external/archbackup/";

      # DaVinci Resolve
      godvlog        = "cd ~/.local/share/DaVinciResolve/logs";
      resolve        = "sudo /opt/resolve/bin/resolve";

      # Blackmagic
      mountblackmagic = ''ifuse --documents "com.blackmagic-design.DaVinciCamera" ~/blackmagicvids/'';

      # Deploy aliases
      deployLadderTrack    = "npm run build && scp -r build/ package.json package-lock.json root@willontech.com:/var/www/laddertrack && scp scripts/fetchAttendance/fetchAttendance.js root@willontech.com:/var/www/laddertrack/scripts/fetchAttendance && ssh root@willontech.com \"/var/www/laddertrack/deploy.sh\"";
      deployGoalznet       = "npm run build && scp -r build/ package.json package-lock.json root@willontech.com:/var/www/goalznet && ssh root@willontech.com \"sudo systemctl restart goalznet\"";
      deployMultiFamlinkStaging = "npm run build && scp -r build/ svelte.config.js package.json package-lock.json root@172.233.130.56:/var/www/multifamlinkstaging && ssh root@172.233.130.56 \"/var/www/multifamlinkstaging/deploy.sh\"";

      pomowork       = "sleep 25m && pw-play ${pkgs.kdePackages.ocean-sound-theme}/share/sounds/ocean/stereo/alarm-clock-elapsed.oga";
      pomoshortbreak = "sleep 5m && pw-play ${pkgs.kdePackages.ocean-sound-theme}/share/sounds/ocean/stereo/alarm-clock-elapsed.oga";
      pomolongbreak  = "sleep 15m && pw-play ${pkgs.kdePackages.ocean-sound-theme}/share/sounds/ocean/stereo/alarm-clock-elapsed.oga";
    };

    sessionVariables = {
      VISUAL      = "nvim";
      EDITOR      = "nvim";
      MANPAGER    = "nvim +Man!";
      BUILDKIT_HOST = "unix:///run/buildkit/buildkitd.sock";
      LEDGER_FILE = "/home/will/projects/finance/2026.journal";
    };

    initExtra = ''
      # Colour prompt
      PURPLE="\[$(tput setaf 5)\]"
      BLUE="\[$(tput setaf 4)\]"
      GREEN="\[$(tput setaf 2)\]"
      RESET="\[$(tput sgr0)\]"
      PS1="[''${BLUE}\u@''${PURPLE}\h ''${GREEN}\w''${RESET}]\$ "

      # Vi mode
      set -o vi
      
      export SOUND_THEME="${pkgs.kdePackages.ocean-sound-theme}/share/sounds/ocean/stereo"

      # Case-insensitive completion
      bind -s 'set completion-ignore-case on'
    '';
  };
}
