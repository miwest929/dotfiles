# For future reference. In case I ever need to start from square one. Here is a list of my brew taps
#~/paas-source [master] $ brew list
#apple-gcc42   htop-osx    mercurial   sbt
#autoconf    icu4c     mpfr2     scala
#automake    imagemagick   mysql     spidermonkey
#cloog018    isl011      node      the_silver_searcher
#codeclimate   jpeg      nspr      tmux
#couchdb     leiningen   openssl     tree
#docker      libevent    ossp-uuid   unixodbc
#erlang      libgpg-error    pcre      v8
#freetype    libksba     pig     wget
#gcc48     libmpc08    pkg-config    wxmac
#git     libpng      readline    xz
#gmp4      libtool     redis     zookeeper
#gsl     libyaml     rethinkdb

function gvim { /Applications/MacVim.app/Contents/MacOS/Vim -g $*; }

PS1="\[\e[1;34m\]\w\[\e[m\]\[\e[1;36m\] [\$(git branch 2>/dev/null | sed -n '/^\*/s/^\* //p')]\[\e[0m\] $ "

alias node-exporter='./node_exporter -collectors.enabled="mdadm,time"'

# Example pg_dump command
# pg_dump -h <host> -U <user> <database> | psql dalton_sandbox

alias be='bundle exec'
alias lsdir='ls -d */'
alias top="top -o cpu" # make CPU% the default sort field
alias weight='du -h --max-depth=1'
alias rubysrc='find . -name \*.rb'
alias ls='ls -G' # colorize the output
alias g++='g++-4.8'
alias fakeftp='python -m SimpleHTTPServer'
alias externip='curl ifconfig.me'
alias m='cd ~/paas-source/maudit'
alias mc="cd ~/paas-source/maudit_client"
alias supervisor='supervisorctl'
alias fixbundler='gem update --system && gem install bundler'
alias innodb='PGPASSWORD=Hp2198hcv psql -U mwest -h maudit-innovate-5f84a522.cbkymcm2irfk.us-east-1.rds.amazonaws.com maudit_innovate'
alias pg='postgres -D /usr/local/var/postgres'
alias diskbench='time dd if=/dev/zero of=dummy_file bs=512k count=200'
alias words='/usr/share/dict/words'
alias strace='dtruss'
alias todo='cd ~/Documents/todo'
alias fbi='bundle install --jobs 3' # Only enabled for version >1.4
alias gk='gitk 2>/dev/null &'
alias ss='./script/server'
alias sc='./script/console'
alias bi='bundle install'
alias gs='git status'
alias gb='git branch'
alias gc='git checkout'
alias db='mysql -uroot --database=imedidata_development'
alias cb="git branch --no-color | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'"
alias i='cd /Users/mwest/paas-source/imedidata'
alias am='cd /Users/mwest/Documents/authmedidata'
alias c='cd /Users/mwest/Documents/code'
alias g='grep -nr --color=always'
alias mergeit='git mergetool -t kdiff3'
alias v='vim'
alias gp='git push'
alias ed='ed -p:'
alias bundledebug='DEBUG_RESOLVER=true bundle install -VV'
alias paas='cd ~/paas-source'
alias gemsetdir='rvm gemset dir'
alias redisping='redis-cli ping'
alias diffstash='git stash show -p stash@{0}'

# cd /mnt/jenkins/jobs/
alias jenkins='ssh tps-sqa-jenkins.imedidata.net'

alias gitgc='git gc'
alias giti="git clean -X $1"
alias gitino='git clean -n -X'
alias cukepot='sudo /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args -enable-apps http://localhost:9494'
alias gl='git log'
alias gemenv='gem environment'
alias brewupdate='brew tap homebrew/versions'
alias erlang='erl'
alias elixir='iex'
alias repo='echo "`pwd` : `cb`"'
alias neo='cd /usr/local/Cellar/neo4j/community-1.9.1-unix/libexec/data/graph.db'
alias neoweb='open http://localhost:7474/webadmin'
alias mysqlh='vim ~/.mysql_history'
alias lscreate='ls -t'
alias pused="sudo lsof -i :$1"
#alias zeusget='gem install --version \'=0.13.4.pre2\' zeus'
# git push origin :refs/heads/same

alias rc='bundle exec rails console'
alias rs='bundle exec rails server'
alias cu='bundle exec cucumber features'
alias rs='bundle exec rspec'
#alias rc='zeus rails console'
#alias rs='zeus rails server'
#alias cu='zeus cucumber features'
alias code='cd $CODE_PATH'
alias githist="history | grep \"  git \" | awk '{print $1 \" \" $3}' | grep -v '|' > history.txt"

alias idistro='innotop -u imedidataa1192a -p9504b2d048593e2e1ca46c2e6cf60217 -h imedidata-distro-46256681.cz4lsbnwubdn.us-east-1.rds.amazonaws.com'

function dockerclean() {
  docker ps -a | grep "Exited" | awk '{print $1}' | xargs docker rm
  docker images | grep "<none>" | awk '{print $3}' | xargs docker rmi
}

function ctodo() {
  touch ~/Documents/todo/`date +"%m-%d-%y"`.todo.txt
  vim !:1
}

function fname() { find . -iname "*$@*"; }
function pgrep
{
  grep -nr --include=*.$1 $2 $3
}

function rvmheal
{
  rm Gemfile.lock
  bundle install
}

#kill anything like a keyword
function k {
  if [ ! -z $* ] ; then
    PRE='/\/bin\/'
    POST='/{/grep/!p;}'
    SEDARG=$PRE$*$POST
    ps aux | sed -n $SEDARG | awk '{print$2}' | xargs kill -9
  else
    echo "I'm afraid I can't do that without a process name to match, Dave"
  fi
}

# Opens the github page for the current git repository in your browser
# git@github.com:jasonneylon/dotfiles.git
# https://github.com/jasonneylon/dotfiles/
function gh() {
  giturl=$(git config --get remote.origin.url)
  if [ "$giturl" == "" ]
    then
     echo "Not a git repository or no remote.origin.url set"
     exit 1;
  fi

  giturl=${giturl/git\@github\.com\:/https://github.com/}
  giturl=${giturl/\.git/\/tree/}
  branch="$(git symbolic-ref HEAD 2>/dev/null)" ||
  branch="(unnamed branch)"     # detached HEAD
  branch=${branch##refs/heads/}
  giturl=$giturl$branch
  open $giturl
}

function gi() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}

function pull() {
  branch="$(git symbolic-ref HEAD 2>/dev/null)"
  branch=${branch##refs/heads/}
  git pull origin $branch
}

sdb() {
  case $(uname -s) in
      Darwin) timestamp=$(date -uj  -f %s $(($(date +%s) - (5 * 60)))  +"%FT%TZ" | sed s/:/%3A/g);;
      Linux)  timestamp=$(date -u +"%FT%TZ" --date='5 min ago' | sed s/:/%3A/g);;
  esac
  params="AWSAccessKeyId=$AWS_ACCESS_KEY"
  params="$params&Action=$1"
  [ -z "$2" ] || params="$params&DomainName=$2"
  params="$params&SignatureMethod=HmacSHA256"
  params="$params&SignatureVersion=2"
  params="$params&Timestamp=$timestamp"
  params="$params&Version=2009-04-15"
  payload="GET\nsdb.us-east-1.amazonaws.com\n/\n$params"
  hash=$(echo -ne $payload | openssl dgst -sha256 -hmac "$AWS_SECRET_KEY" -binary | base64)
  echo $hash
  curl "http://sdb.us-east-1.amazonaws.com/?$params&Signature=$hash"
}

netrestart() {
  sudo ifconfig en0 down
  sudo ifconfig en0 up
}

tcptune() {
  sudo sysctl -w kern.maxfilesperproc=200000
  sudo sysctl -w kern.maxfiles=200000
  sudo sysctl -w net.inet.ip.portrange.first=1024
}

portused() {
  netstat -anf inet | grep $1
}

descasg() {
  as-describe-auto-scaling-groups
}

ctunnel() {
#ssh -L 8888:ec2-50-16-158-114.compute-1.amazonaws.com:8888  ec2-50-16-158-114.compute-1.amazonaws.com
  ssh -L 8888:$1:8888  $1
}

tagrelease() {
  git checkout develop
  git pull origin develop
  git checkout master
  git merge develop
  git tag $1
  git push origin master
  git push --tags
}

source ~/git-completion.bash

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

# Get rid of the annoying 'You have new mail in /var/mail' message
unset MAILCHECK

#export HADOOP_MAPRED_HOME=/Users/mwest/paas-source/hadoop-2.3.0
#export YARN_CONF_DIR=/Users/mwest/paas-source/hadoop-2.3.0
export NEO4J_HOME=/Users/mwest/neo4j

# Set the AWS configuration (includes account credentials) as environment variables. Format of file:
#  export AWS_ACCESS_KEY_ID=".."
#  export AWS_SECRET_KEY="..."
# Make sure the file has execute permissions
source aws-keys.sh

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home"
export PATH=$PATH:$JAVA_HOME/bin 
export CODE_PATH="~/Documents/code/"
export CC=gcc-4.2
export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"
export NODE_PATH="/usr/local/lib/node"
export PATH="/usr/local/bin":$PATH
export PATH=$PATH:/opt/jruby/bin
export TERM='screen-256color-bce'
export MANPAGER="col -b | vim -c 'set ft=man ts=8 nomod nolist nonu' -c 'nnoremap i <nop>' -"
export EC2_HOME="/Users/mwest/paas-source/ec2-api-tools-1.6.11.0"
export PATH=$PATH:$EC2_HOME/bin 
export AWS_AUTO_SCALING_HOME="/Users/mwest/paas-source/autoscaling_cli"
export PATH=$PATH:$AWS_AUTO_SCALING_HOME/bin 
export PATH=$PATH:/System/Library/dsc-cassandra/bin:~/paas-source/apache-apps/kafka-0.05/bin
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
export PATH=$PATH:/Users/mwest/paas-source/apache-storm-0.9.1-incubating/bin
export PATH=$PATH:$NEO4J_HOME/bin
export GATLING_HOME=/Users/mwest/paas-source/gatling-2.0.0-M3a

export CC=/usr/local/Cellar/apple-gcc42/4.2.1-5666.3/bin/gcc-4.2
export CXX=/usr/local/Cellar/apple-gcc42/4.2.1-5666.3/bin/g++-4.2
export CPP=/usr/local/Cellar/apple-gcc42/4.2.1-5666.3/bin/cpp-4.2

# Kafka
export KAFKA_HOME=/usr/local/kafka_install/kafka-0.7.1
export KAFKA=$KAFKA_HOME/bin
export KAFKA_CONFIG=$KAFKA_HOME/config

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/mwest/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

export CLOJURESCRIPT_HOME="~/paas-source/clojurescript"

export GOPATH=~/paas-source/golang
export PATH="/usr/local/bin:/usr/local/sbin":$PATH
export PATH="$CLOJURESCRIPT_HOME/bin:$PATH"
export PATH=$PATH:$GOPATH/bin

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
