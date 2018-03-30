export ZSH=/Users/frank/.oh-my-zsh
export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=red

# Themes
# #ZSH_THEME="robbyrussell"
ZSH_THEME="cobalt2"
#
HYPHEN_INSENSITIVE="true"
# #ENABLE_CORRECTION=“true”

plugins=(git)

export EDITOR='vim'

bindkey -e
bindkey '[C' forward-word
bindkey '[D' backward-word

# Refresh
alias rz="source $ZSH/oh-my-zsh.sh"
alias prodb='ssh centos@ec2-52-203-21-244.compute-1.amazonaws.com'
alias prodb3='ssh -i ~/.ssh/tunecore1.pem centos@ec2-52-203-21-244.compute-1.amazonaws.com'
alias ssh_batch="ssh -i ~/.ssh/tunecore1.pem ec2-user@ec2-34-237-114-113.compute-1.amazonaws.com"
alias studio3="ssh centos@ec2-34-192-19-31.compute-1.amazonaws.com"
alias studio4="ssh centos@ec2-52-0-169-56.compute-1.amazonaws.com"
alias open_petri="ssh -i ~/.ssh/tunecore1.pem root@"
alias vpn_petri="ssh -i ~/.ssh/tunecore1.pem ec2-user@54.172.226.164"
alias sidekiq_ssh="ssh -i ~/.ssh/tunecore1.pem centos@ec2-34-227-215-75.compute-1.amazonaws.com"

# Files
alias vcon="vim ~/.vimrc"
alias zcon="vim ~/.zshrc"
alias bcon="vim ~/.bash_profile"
alias tcon='vim ~/.tmux.conf'
alias omz="vim ~/.oh-my-zsh"
alias gcon='vim ~/.gitconfig'
alias aliases='vim ~/.bash_profile'

# Directories
alias dev='cd /Users/frank/Development'
alias book='cd /Users/frank/Development/projects/bookworm/bookworm-react'
alias dub='cd /Users/frank/Development/tunecore/tc-www'
alias social='cd /Users/frank/Projects/tc-social'
alias stats='cd /Users/frank/Projects/stats'
alias petri='cd /Users/frank/Projects/petri'
alias sip='cd /Users/frank/Projects/Sip'
alias tunecore='cd /Users/frank/Projects/tunecore/'
alias blog='cd /Users/frank/Projects/blog/'
alias cism="cd /Users/frank/exercism/elixir"
alias @='where am i'
alias be='bundle exec'
alias pryr="prybaby -r"
alias econ="iex -S mix"

alias diff='git diff --name-only --diff-filter=U'
alias master='git co master && git pull origin master && git fetch'
alias amend='git commit --amend --no-edit'
alias push='git push -f origin HEAD'

alias ors='lsof -wni tcp:3000'
alias osp='ps -ef | grep spring'
alias jenkins='ssh -i ~/.ssh/dropkloud-jenkins.pem ec2-user@ec2-54-204-17-11.compute-1.amazonaws.com'
alias jenkins2"ssh -i ~/.ssh/dropkloud-jenkins.pem ec2-user@54.204.17.11" # From Andrew
alias ngr='sudo pkill nginx;sudo nginx'
alias tags="bundle exec rake db:migrate && ctags -R ."
alias kside="ps -ef | grep sidekiq | grep -v grep | awk '{print $2}' | xargs kill - -ef | grep sidekiq | grep -v grep | awk '{print $2}' | xargs kill -9"

# Social/stats servers
alias social-up='PORT=5000 foreman start -f Procfile.development'
alias stats-up='PORT=9292 foreman s -f Procfile.development'
# Stats rake tasks
alias social-import-1='rake jgm:import_artist_content QUEUE=medium SOURCES="facebook_posts youtube soundcloud mixcloud"'
alias social-import-2='rake jgm:twitter:import_pro_tweets'
alias social-import-3='rake jgm:instagram:import_media'
alias social-import-YT='rake jgm:import_artist_content QUEUE=medium SOURCES="youtube"'
alias social-import-MC='rake jgm:import_artist_content QUEUE=medium SOURCES="mixcloud"'
alias social-import-FB='rake jgm:import_artist_content QUEUE=medium SOURCES="facebook_posts"'
alias social-import-SC='rake jgm:import_artist_content QUEUE=medium SOURCES="soundcloud"'

alias tkill="tmux kill-session -t $1"
alias tnew="tmux new -s "

#docker-compose exec test RAILS_ENV=test bin/rake db:load

source $ZSH/oh-my-zsh.sh
#source $HOME/.zshenv

Terminate () {
  lsof -i TCP:$1 | grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn} IPv4 | awk '{print $2}' | xargs kill -9
}

# Docker
alias docker_start='docker-sync-stack start'
alias docker_console='docker-compose exec web bundle exec spring rails console'
alias docker_rspec='docker-compose exec test bundle exec rspec'
alias docker_spring_rspec='docker-compose exec test bundle exec spring rspec'
alias docker_stop='docker-compose down'
alias docker_destroy='docker rmi -f `docker images -q -a`' #run docker down before
alias docker_sidekiq="ssh -i ~/.ssh/tunecore1.pem centos@ec2-35-153-109-45.compute-1.amazonaws.com"
alias brew_start="brew services start mariadb; brew services start postgresql; brew services start redis; sudo brew services start nginx"
alias brew_stop="brew services stop mariadb; brew services stop postgresql; brew services stop redis; sudo brew services stop nginx"
alias secrets="aws s3 cp s3://secrets.tunecore.com/development/tc-www/secrets.txt .env.development; aws s3 cp s3://secrets.tunecore.com/test/tc-www/secrets.txt .env.test"
alias docker_load_db="docker-compose exec web bundle exec rake db:load"
alias docker_test_load_db="docker-compose exec test bundle exec rake db:load"

alias tmux="TERM=screen-256color-bce tmux"

alias pg-start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg-stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias c="clear"

function dpry {
  web_pid=$(docker ps | grep tcwww_web | awk '{print $1}')
  docker attach $web_pid
}

function docker_restart() {
  docker_stop;
  docker-sync clean;
  docker_start;
}

function docker_refresh() {
  docker_stop;
  docker_destroy;
  docker_start;
}

function docker_copy () {
  docker cp $(docker ps -qf "name=web"):app/$1 $1
}

function docker_rake () {
  commands_array=($@)
  len=${#commands_array[@]}
  other_commands=${commands_array[@]:2:$len-1}
  docker-compose exec $1 rake $2 $other_commands
}

