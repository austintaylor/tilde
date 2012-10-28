
function t_list() {
  awk '{ printf "%3s. %s\n", NR, $0 }' .todo
}

function t_show() {
  t_list | sed "$1p;d"
}

function t_get() {
  sed "$1p;d" .todo
}

function t_add() {
  echo $1 >> .todo
}

function t_rm() {
  sed "$1d" .todo > .todo.out
  mv .todo.out .todo
}

function t_git() {
  git $1 "`t_get $2`"
}

function todo() {
  if [[ $# -eq 0 ]]; then
    t_list
  else
    case "$1" in
    list)
      t_list
      ;;
    ci)
      t_git ci ${2:-1}
      t_rm ${2:-1}
      t_list
      ;;
    cia)
      t_git cia ${2:-1}
      t_rm ${2:-1}
      t_list
      ;;
    a)
      t_add "$2"
      t_list
      ;;
    add)
      t_add "$2"
      t_list
      ;;
    rm)
      t_rm ${2:-1}
      t_list
      ;;
    show)
      t_show ${2:-1}
      ;;
    [0-9]*)
      t_show $1
      ;;
    *)
      echo "Cannot understand command: $1"
      ;;
    esac
  fi
}
