# emacs
alias e='emacs-snapshot'
alias se='sudo emacs-snapshot'

# git
alias gst='git status'
alias gdf='git diff'
alias ga='git add'
alias gai='git add --interactive'
alias gc='git commit -m'
alias gca='git commit -a -m'
alias gcam='git commit --amend -C HEAD'
alias gp='git push'
alias go='git checkout'
alias gl='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'

# bundler
alias bx='bundle exec'

# ls
alias ls='ls -cG'
alias la='ls -acG'
alias ll='ls -lahG'
alias lsd='ls -d */'

# ls + grep
alias lsg='ls -G | g'
alias lag='ls -aG | g'
alias llg='ls -lahG | g'

# ruby/rails
alias rc='ruby script/console'
alias rcp='ruby script/console production'
alias rs='ruby script/server'
alias td='tail -f log/development.log'
alias tp='tail -f log/production.log'

# Colorize grep
alias g='grep --color=always'
alias gi='grep -i --color=always'

# Master chief
alias psa='ps auxf'
alias psg='ps aux | g'

# Move multiple files
autoload -U zmv
alias mmv='noglob zmv -W'