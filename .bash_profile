export PATH=$PATH:~/bin:/usr/local/pgsql/bin
export EDITOR=vim

# reloads the prompt, usefull to take new modifications into account
alias reload="source ~/.bash_profile"


parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

parse_git_tag () {
  git describe --tags 2> /dev/null
}

parse_git_branch_or_tag() {
  local OUT="$(parse_git_branch)"
  if [ "$OUT" == " ((no branch))" ]; then
    OUT="($(parse_git_tag))";
  fi
  echo $OUT
}


PS1="\u@\h:\w\$(parse_git_branch_or_tag) $ "


[[ -s ~/.autojump/etc/profile.d/autojump.bash ]] && . ~/.autojump/etc/profile.d/autojump.bash