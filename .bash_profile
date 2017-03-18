export PATH=$PATH:~/bin:/usr/local/pgsql/bin:/opt/local/bin/:/opt/local/sbin/:~/sandbox/somatic/packer_0.8.6_darwin_amd64/
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

function tabname {
  printf "\e]1;$1\a"
}

function winname {
  printf "\e]2;$1\a"
}

if [ -f ~/.keys ]
then
  source ~/.keys
fi

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

PS1="\u@\h:\w\$(parse_git_branch_or_tag) $ "

transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi 
  tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; } 

[[ -s ~/.autojump/etc/profile.d/autojump.bash ]] && . ~/.autojump/etc/profile.d/autojump.bash

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export BOOT_JVM_OPTIONS='
  -client
  -XX:+TieredCompilation
  -XX:TieredStopAtLevel=1
  -Xmx2g
  -XX:+UseConcMarkSweepGC
  -XX:+CMSClassUnloadingEnabled
  -Xverify:none'
source ~/.somaticenv
eval "$(rbenv init -)"

