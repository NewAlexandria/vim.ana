# Backup any existing files
mkdir ~/.vim.ana-repo/backups

## Link vim files
if [ -d ~/.vim ] 
then 
  mv ~/.vim ~/.vim.ana-repo/backups/.vim
fi
ln -s ~/.vim.ana-repo/.vim ~/.vim

if [ -f ~/.vimrc ]
then
  mv ~/.vimrc ~/.vim.ana-repo/backups/.vim
fi
ln -s ~/.vim.ana-repo/.vimrc ~/.vimrc

if [ -f ~/.viminfo ]
then
  mv ~/.viminfo ~/.vim.ana-repo/backups/.viminfo
fi
ln -s ~/.vim.ana-repo/.viminfo ~/.viminfo

## link the git funcs for the prompt
if [ -f ~/.git-completion.bash ]
then
  mv  ~/.git-completion.bash ~/.vim.ana-repo/backups/.git-completion.bash
fi
ln -s ~/.vim.ana-repo/.git-completion.bash  ~/.git-completion.bash

## Improve the prompt
SOURCE_LINE="source ~/.git-completion.bash"
PROFILE="$HOME/.bash_profile"

if [[ -f "$PROFILE" ]] && grep -q "$SOURCE_LINE" "$PROFILE"; then
  echo "Already added to bash profile."
else
  echo "Adding to bash profile..."
  ln -s ~/.vim.ana-repo/.bash_append ~/.bash_append
  echo "source ~/.bash_append" >> "$PROFILE"
fi

