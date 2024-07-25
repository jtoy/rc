mkdir -p  ~/bin
cp bin/* ~/bin/
chmod +x ~/bin/*

mkdir -p downloads

if [ ! -d "downloads/autojump" ]; then
  cd downloads
  git clone git@github.com:wting/autojump.git
  cd autojump
  ./install.py
  cd ../..
fi

if ! npm list -g | grep -q 'git-open'; then
  npm install --global git-open
fi

if ! command -v ack &> /dev/null; then
  curl http://beyondgrep.com/ack-2.18-single-file > ~/bin/ack
  chmod 0755 ~/bin/ack
fi


if [ ! -d "~/.vim/bundle/vundle" ]; then
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  vim +PluginInstall +qall
fi
