export PATH="~/Library/Haskell/bin:$PATH"
export PATH=/Applications/Xcode.app/Contents/Developer/usr/bin:$PATH
export PATH="/usr/local/bin:$PATH"
export PATH=/usr/local/mysql/bin:$PATH
export PATH=/Users/austin/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export EDITOR=/usr/bin/vi
export TERM=screen-256color
export PS1="[\w] "

export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_HEAP_FREE_MIN=500000


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
