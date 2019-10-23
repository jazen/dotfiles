# Path to your oh-my-zsh and custom configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Locale
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -c -a ''"
# export EDITOR="~/dotfiles/emascclient-start.sh"

# Stack and pp are put here
export PATH=$PATH:~/.local/bin
export PATH=$(npm-run-path)

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Use `brew install keychain` as nicer frontend to ssh-agent.
eval `keychain --eval --agents ssh --inherit any jazen`

source $ZSH/oh-my-zsh.sh

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

setopt extendedglob

# Emulate bash's behaviour when using !! to run the last command again
# without the need to press <enter> twice.
setopt NO_HIST_VERIFY

# Don't share history across panes
setopt nosharehistory

# Allow [ or ] whereever you want
unsetopt nomatch

# Add tab-completion for teamocil & git
compctl -g '~/.teamocil/*(:t:r)' teamocil
compdef g=git

[ -f ~/git/zaw/zaw.zsh ] && source ~/git/zaw/zaw.zsh

# Short of learning how to actually configure OSX, here's a hacky way to use
# GNU manpages for programs that are GNU ones, and fallback to OSX manpages otherwise
#alias man='_() { echo $1; man -M $(brew --prefix coreutils)/libexec/gnuman $1 1>/dev/null 2>&1; if [ "$?" -eq 0 ]; then man -M $(brew --prefix coreutils)/libexec/gnuman $1; else man $1; fi }; _'

# Add support for tracking time spent in the shell (Timing app)
PROMPT_TITLE='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
export PROMPT_COMMAND="${PROMPT_COMMAND} ${PROMPT_TITLE}; "

# Enable support for `brew install thefuck`
eval "$(thefuck --alias)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# https://github.com/dickeyxxx/gh#installation-for-oh-my-zsh
typeset +gx -A GITHUB
GITHUB[user]=jazen

alias magit='emacsclient -n -e "(magit-status)"'

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew docker git nvm gh zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Deep shell integration via https://github.com/creationix/nvm#zsh
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Load all files from .zsh.d/ directory
if [ -d $HOME/.zsh.d ]; then
  for file in $HOME/.zsh.d/*.zsh; do
    # echo $file
    source $file
  done
fi

# Run `ls -la` automatically after each `cd`
function chpwd() {
    emulate -L zsh
    ls -la
}

source /usr/local/share/zsh/site-functions/_awless

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
# [[ -f /Users/sschubert/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/sschubert/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
# [[ -f /Users/sschubert/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/sschubert/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh

# Setup `fzf` --
# `brew install fzf`
# To install useful key bindings and fuzzy completion:
# `$(brew --prefix)/opt/fzf/install`
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Setup `enhancd`
# `git clone https://github.com/b4b4r07/enhancd ~/git/enhancd`
[ -f ~/git/enhancd/init.sh ] && source ~/git/enhancd/init.sh

# Setup syntax highlighting
# `git clone git@github.com:zsh-users/zsh-syntax-highlighting.git ~/git/zsh-syntax-highlighting`
[ -f ~/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source ~/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# https://github.com/cantino/mcfly#installation
if [ -f $(brew --prefix)/opt/mcfly/mcfly.bash ]; then
  . $(brew --prefix)/opt/mcfly/mcfly.bash
fi

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/sschubert/git/hydra/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/sschubert/git/hydra/node_modules/tabtab/.completions/slss.zsh

  # Set Spaceship ZSH as a prompt
  autoload -U promptinit; promptinit
  prompt spaceship
