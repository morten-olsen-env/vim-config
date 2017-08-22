if [ -f ~/.vimrc ] || [ -d ~/.vim ]; then
  read -p "a vim config is already installed, do you wish to override it? [y/N]" yn
  case $yn in
    [Yy]* );;
    * ) echo "exiting"; exit 1;;
  esac
fi

echo 'installing'
rm -f ~/.vimrc
rm -f -R ~/.vim
if [ ! -f ~/.vimrc ] && [ ! -d ~/.vim ]; then
  ln -s $(pwd)/vimrc ~/.vimrc
  ln -s $(pwd)/ ~/.vim
  if [ -f ~/.vimrc ] && [ -d ~/.vim ]; then
    echo "vim config installed"
    echo "setting up modules"
    git submodule init
    git submodule update
    pushd ~/.vim/bundle/vimproc.vim
    make
    popd
    pushd ~/.vim/bundle/YouCompleteMe.vim
    git submodule update --init --recursive
    brew install cmake
    ./install.py --tern-completer #--omnisharp-completer
    popd
    exit 0
  else
    echo "could not install the new config"
    exit 2
  fi
else
  echo 'could not remove previous vim configuration'
  exit 2
fi
