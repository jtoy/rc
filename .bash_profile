export PATH=$PATH:~/bin:/usr/local/pgsql/bin:/opt/local/bin/:/opt/local/sbin/
export EDITOR=vim

# reloads the prompt, usefull to take new modifications into account
alias reload="source ~/.bash_profile"
# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'


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


if [ -f ~/.keys ]
then
  source ~/.keys
fi

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

PS1="\u@\h:\w\$(parse_git_branch_or_tag) $ "


[[ -s ~/.autojump/etc/profile.d/autojump.bash ]] && . ~/.autojump/etc/profile.d/autojump.bash

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
