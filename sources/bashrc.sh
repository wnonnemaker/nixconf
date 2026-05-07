#
# ~/.bashrc
#

# If not running interactively, don't do anything

# Enviornment variables

export VISUAL=nvim
export EDITOR=nvim
export MANPAGER='nvim +Man!'
export BUILDKIT_HOST='unix:///run/buildkit/buildkitd.sock'
export LEDGER_FILE=~/finance/2026.journal
[[ $- != *i* ]] && return

PURPLE="\[$(tput setaf 5)\]"
BLUE="\[$(tput setaf 4)\]"
GREEN="\[$(tput setaf 2)\]"
RESET="\[$(tput sgr0)\]"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias bldinst='rm -f config.h && sudo make clean install'
alias runServer='python -m http.server 8001'
alias connlinode='ssh root@172.233.152.243'
alias fullsysbk="sudo rsync -aAXHv --exclude='/dev/*' --exclude='/proc/*' --exclude='/sys/*' --exclude='/tmp/*' --exclude='/run/*' --exclude='/mnt/*' --exclude='/media/*' --exclude='/lost+found/' / /mnt/external/archbackup/"
alias goWP="cd ~/codingProjects/TestEnvs/wordpress-test/htdocs/wordpress"
alias ccat='pygmentize -g -O linenos=1'
alias buildtex='latexmk -pdf -pvc'
alias pull="git remote update --prune && git pull --ff-only"
alias refresh="git fetch origin main:main && git rebase main"
alias ..="cd .."
alias cheatsheet="ccat ~/Documents/cmdcheatsheet.txt"
alias connlinode="ssh root@172.233.152.243"
alias connmultifamlink="ssh root@172.233.130.56"
alias docker="sudo docker"
alias docker-compose="sudo docker-compose"
alias addcheatsheet=">> ~/documents/cmdcheatsheet"
alias convwoff="sfnt2woff-zopfli"
alias willbuildx="/home/will/codingProjects/shared/buildx/bin/build/buildx"
alias godvlog="cd ~/.local/share/DaVinciResolve/logs"
alias resolve="sudo /opt/resolve/bin/resolve"
alias py="python3"
alias compose="docker-compose"
alias mountblackmagic='ifuse --documents "com.blackmagic-design.DaVinciCamera" ~/blackmagicvids/'
alias deployLadderTrack='npm run build && scp -r build/ package.json package-lock.json root@willontech.com:/var/www/laddertrack && scp scripts/fetchAttendance/fetchAttendance.js root@willontech.com:/var/www/laddertrack/scripts/fetchAttendance && ssh root@willontech.com "/var/www/laddertrack/deploy.sh"'
alias deployGoalznet='npm run build && scp -r build/ package.json package-lock.json root@willontech.com:/var/www/goalznet && ssh root@willontech.com "sudo systemctl restart goalznet"'
alias deployMultiFamlinkStaging='npm run build && scp -r build/ svelte.config.js package.json package-lock.json root@172.233.130.56:/var/www/multifamlinkstaging && ssh root@172.233.130.56 "/var/www/multifamlinkstaging/deploy.sh"'
alias pomowork='sleep 25m && paplay /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga'
alias pomoshortbreak='sleep 5m && paplay /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga'
alias pomolongbreak='sleep 15m && paplay /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga'
alias ghci='ghc --interactive'

set -o vi
bind -s 'set completion-ignore-case on'
PS1="[${BLUE}\u@${PURPLE}\h ${GREEN}\w${RESET}]\$ "

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
export PATH="$HOME/.local/bin:$PATH"

gojournaldir() {
  local dir="$HOME/Documents/writing/journal/$(date +%Y)/$(date +%b)"
  mkdir -p "$dir"
  cd "$dir"
}

