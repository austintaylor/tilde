export PATH="~/Library/Haskell/bin:$PATH"
export PATH=/Applications/Xcode.app/Contents/Developer/usr/bin:$PATH
export PATH="/usr/local/bin:$PATH"
export PATH=/usr/local/mysql/bin:$PATH
export PATH=/Users/austin/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/Users/austin/dev/go/bin:$PATH
export PATH=/Users/austin/.cabal/bin:$PATH
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH=/Users/austin/dev/dev_environment/bin:$PATH

# This is done later by dev_environment/profile/profile
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export EDITOR=/usr/bin/vi
export TERM=screen-256color
export PS1="[\w] "

export RUBY_GC_HEAP_INIT_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_HEAP_FREE_MIN=500000

export GOPATH=$HOME/dev/go


# this turns off 'terminal flow control'
# which means that C-q isn't eaten by bash
# which means that C-w C-q works in vim
stty -ixon

alias ll="ls -alh"
alias t=todo
alias be="bundle exec"
alias dbm="bundle exec rake db:migrate db:test:prepare"
alias pow=powder
alias br="git branch -a"
alias sgmi="script/generate migration"
alias vi=vim
alias g=git

function epoch() {
  date -j -f "%a %b %d %T %Z %Y" "`date`" "+%s"
}

export HISTFILESIZE=1000000000
export HISTSIZE=1000000

function log() {
  less -Rfn+G log/$@
}

source ~/tilde/todo.sh

function st() {
  echo ""
  todo list
  echo ""
  git status
}

function ip() {
  ifconfig | grep 'inet ' | grep -v '127.0.0.1' | awk '{ print $2 }'
}

complete -W '$(ls `pwd`/log)' log
complete -W '$(grep "Host " ~/.ssh/config  | sed -e "s/Host //")' ssh
# complete -W '$(git status --porcelain | sed "s/...//")' git add

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

function restart() {
  tmux send-keys -t dev:local.0 C-c 'CACHE_CLASSES=yes script/server thin' C-m
}

function staging-log() {
  orc ssh deployer1 'sudo cat /var/log/staging.log | grep staging1: | less +G'
}

alias done="reattach-to-user-namespace -l bash -c 'terminal-notifier -message done -sound default'"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export METROID_DB_SPEC="root@unix(/tmp/mysql.sock)/uservoice_development?charset=utf8&parseTime=true"
export DBR_TEST_DSN="root@unix(/tmp/mysql.sock)/uservoice_test?charset=utf8&parseTime=true"
export UVTEST_DSN="root@unix(/tmp/mysql.sock)/uservoice_test?charset=utf8&parseTime=true"
export METROID_TEST_DB_SPEC="root@unix(/tmp/mysql.sock)/uservoice_test?charset=utf8&parseTime=true"


export UV_DIR=$HOME/dev
source $UV_DIR/dev_environment/profile/profile

export DBR_TEST_MYSQL_DSN='root@unix(/tmp/mysql.sock)/uservoice_test?charset=utf8'
export DBR_TEST_POSTGRES_DSN='postgres://postgres@localhost:5432/uservoice_test?sslmode=disable'

# opam configuration
test -r /Users/austin/.opam/opam-init/init.sh && . /Users/austin/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
