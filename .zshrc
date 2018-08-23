export ZSH=/Users/frank/.oh-my-zsh
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/frank/.rbenv/shims:${PATH}"
eval "$(rbenv init -)"

# Source Files
typeset -a secret_files
secret_files+=~/.tunecorerc

for file in $secret_files[@]; do
  source "$file"
done

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=red
# Themes
ZSH_THEME="cobalt2"
HYPHEN_INSENSITIVE="true"

plugins=(git)

export EDITOR='vim'

bindkey -e

# Refresh Zsh
alias rz="source $ZSH/oh-my-zsh.sh"

# Config Files
alias vcon="vim ~/.vimrc"
alias zcon="vim ~/.zshrc"
alias bcon="vim ~/.bash_profile"
alias tcon='vim ~/.tunecorerc'
alias mcon='vim ~/.tmux.conf'
alias ncon='vim ~/.config/nvim/init.vim'
alias omz="vim ~/.oh-my-zsh"
alias gcon='vim ~/.gitconfig'

# Directories
alias dev='cd /Users/frank/Development'
alias investr='cd /Users/frank/Development/elixir/investr'
alias book='cd /Users/frank/Development/projects/bookworm/bookworm-react'
alias cism="cd /Users/frank/exercism/elixir"

# Commands
alias @='whereami'
alias caller="caller.select { |file| file.include?('tc-www/app') }"
alias be='bundle exec'
alias pryr="prybaby -r"
alias econ="iex -S mix"
alias estart="mix phx.server"
alias ors='lsof -wni tcp:3000'
alias osp='ps -ef | grep spring'
alias ngr='sudo pkill nginx;sudo nginx'
alias tags="bundle exec rake db:migrate && ctags -R ."
alias kside="ps -ef | grep sidekiq | grep -v grep | awk '{print $2}' | xargs kill - -ef | grep sidekiq | grep -v grep | awk '{print $2}' | xargs kill -9"
alias tkill="killall tmux"
alias tnew="tmux new -s "

# Git
alias diff='git diff --name-only --diff-filter=U'
alias master='git co master && git pull origin master && git fetch'
alias amend='git commit --amend --no-edit'
alias push='git push -f origin HEAD'
alias c="clear"

# Docker
alias docker_start='docker-sync-stack start'
alias dup='docker-compose up'
alias dcon='docker-compose exec puma bundle exec spring rails console'
alias drspec='docker-compose exec test bundle exec rspec'
alias dspec='docker-compose exec test bundle exec spring rspec'
alias docker_stop='docker-compose down'
alias docker_destroy='docker rmi -f `docker images -q -a`' #run docker down before
alias docker_sidekiq="ssh -i ~/.ssh/tunecore1.pem centos@ec2-35-153-109-45.compute-1.amazonaws.com"
alias brew_start="brew services start mariadb; brew services start postgresql; brew services start redis; sudo brew services start nginx"
alias brew_stop="brew services stop mariadb; brew services stop postgresql; brew services stop redis; sudo brew services stop nginx"
alias dload_test="docker-compose exec test bundle exec rake db:load"
alias tmux="TERM=screen-256color-bce tmux"

Terminate () {
  lsof -i TCP:$1 | grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn} IPv4 | awk '{print $2}' | xargs kill -9
}

dpry () {
  web_pid=$(docker ps | grep tc-www_puma | awk '{print $1}')
  docker attach $web_pid
}

dstart () {
  docker_stop;
  docker-sync clean;
  docker_start;
}

docker_refresh () {
  docker_stop;
  docker_destroy;
  docker_start;
}

dcopy () {
  docker cp $(docker ps -qf "name=puma"):app/$1 $1
}

drake () {
  commands_array=($@)
  len=${#commands_array[@]}
  other_commands=${commands_array[@]:2:$len-1}
  docker-compose exec $1 rake $2 $other_commands
}

dbash () {
  docker-compose exec $1 bash
}

github () {
  if [ ! -d .git ]
  then
    echo "ERROR: This isnt a git directory" && return false
  fi
  base_url="https://github.com/tunecore/"
  url=$base_url$(git_repo)
  open $url
}

git_repo () {
  if [ ! -d .git ]
  then
    echo "ERROR: This isnt a git directory" && return false
  fi
  git config --get remote.origin.url | regex "\/(.*)\.git" 1
}

regex () {
    gawk 'match($0,/'$1'/, ary) {print ary['${2:-'0'}']}'
}

stty -ixon -ixoff
source $ZSH/oh-my-zsh.sh
