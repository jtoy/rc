mkdir ~/bin
mkdir downloads
cd downloads
git clone git@github.com:wting/autojump.git
cd autojump
./install.py
npm install --global git-open




curl http://beyondgrep.com/ack-2.18-single-file > ~/bin/ack && chmod 0755 ~/bin/ack


git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +PluginInstall +qall
