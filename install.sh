# Backup any existing files
mkdir ~/.vim.ana/backups

## Link vim files
if [ -d ~/.vim ] 
then
  echo "made a backup of ~/.vim" 
  mv ~/.vim ~/.vim.ana/backups/.vim
fi
ln -s ~/.vim.ana/.vim ~/.vim

if [ -f ~/.vimrc ]
then
  echo "made a backup of ~/.vimrc" 
  mv ~/.vimrc ~/.vim.ana/backups/.vimrc
fi
ln -s ~/.vim.ana/.vimrc ~/.vimrc

## Link Neovim files
if [ -d ~/.config/nvim/.vim ] 
then
  echo "made a backup of ~/.confin/nvim/.vim" 
  mv ~/.config/nvim/.vim ~/.vim.ana/backups/.nvim
fi
ln -s ~/.vim ~/.config/nvim/.vim

if [ -f ~/.config/nvim/init.vim ]
then
  echo "made a backup of ~/.config/nvim/init.vim" 
  mv ~/.config/nvim/init.vim ~/.vim.ana/backups/init.vim
fi
ln -s ~/.vimrc ~/.config/nvim/init.vim


if [ -f ~/.viminfo ]
then
  echo "made a backup of ~/.viminfo" 
  mv ~/.viminfo ~/.vim.ana/backups/.viminfo
fi
ln -s ~/.vim.ana/.viminfo ~/.viminfo

## link the git funcs for the prompt
if [ -f ~/.git-completion.bash ]
then
  mv  ~/.git-completion.bash ~/.vim.ana/backups/.git-completion.bash
fi
echo "linking github's supported libs"
ln -s ~/.vim.ana/.git-completion.bash  ~/.git-completion.bash

## Improve the prompt
SOURCE_LINE="source ~/.bash_vim_append"
PROFILE="$HOME/.bash_profile"

if [[ -f "$PROFILE" ]] && grep -q "$SOURCE_LINE" "$PROFILE"; then
  echo "Already added to bash profile."
else
  echo "Adding .vim.ana to your ~/.bash_profile..."
  ln -s ~/.vim.ana/.bash_vim_append ~/.bash_vim_append

  echo "# .vim.ana configurations #" >> "$PROFILE"
  echo "$SOURCE_LINE" >> "$PROFILE"
fi

## prevent non-ntaive submodules from introducing wonk line endings
git config --global core.autocrlf input

## Setup Submodules
cd ~/.vim.ana
git submodule init
git submodule update

## Compile Submodule Components
### vimproc
echo 'Compiling vimproc binary into ~/.vim.ana/.vim/bundle/vimproc.vim/'
cd ~/.vim.ana/.vim/bundle/vimproc.vim/
make
### Ctags
echo "Remember to install CTAGS from http://ctags.sourceforge.net/"
echo "or `brew install ctags` on OS X"

if [ -d "$HOME/.homebrew" ]; then
  read -p "Do you want to install with brew?" yn
  case $yn in
    [Yy]* )
      brew install ctags
      gem install gem-ctags
      gem ctags
      ;;
    * )
      break;;
  esac
fi

if [ -d "~/.rbenv" ]; then
  read -p "You seem to be running rbenv, would you like to compile tags for your active ruby?" yn
  case $yn in
    [Yy]* )
      mkdir -p ~/.rbenv/plugins
      git clone https://github.com/tpope/rbenv-ctags.git  ~/.rbenv/plugins/rbenv-ctags
      rbenv ctags
      ;;
    * )
      break;;
  esac
  echo "You can run 'rbenv ctags' whenever you switch toa new ruby, to rebuild tags for its gems"
fi

echo 
echo "Done!"
