# Backup any existing files
mkdir ~/.vim.ana-repo/backups

## Link vim files
if [ -d ~/.vim ] 
then
  echo "made a backup of ~/.vim" 
  mv ~/.vim ~/.vim.ana-repo/backups/.vim
fi
ln -s ~/.vim.ana-repo/.vim ~/.vim

if [ -f ~/.vimrc ]
then
  echo "made a backup of ~/.vimrc" 
  mv ~/.vimrc ~/.vim.ana-repo/backups/.vimrc
fi
ln -s ~/.vim.ana-repo/.vimrc ~/.vimrc

if [ -f ~/.viminfo ]
then
  echo "made a backup of ~/.viminfo" 
  mv ~/.viminfo ~/.vim.ana-repo/backups/.viminfo
fi
ln -s ~/.vim.ana-repo/.viminfo ~/.viminfo

## link the git funcs for the prompt
if [ -f ~/.git-completion.bash ]
then
  mv  ~/.git-completion.bash ~/.vim.ana-repo/backups/.git-completion.bash
fi
echo "linking github's supported libs"
ln -s ~/.vim.ana-repo/.git-completion.bash  ~/.git-completion.bash

## Improve the prompt
SOURCE_LINE="source ~/.bash_vim_append"
PROFILE="$HOME/.bash_profile"

if [[ -f "$PROFILE" ]] && grep -q "$SOURCE_LINE" "$PROFILE"; then
  echo "Already added to bash profile."
else
  echo "Adding .vim.ana to your bash profile..."
  ln -s ~/.vim.ana-repo/.bash_vim_append ~/.bash_vim_append

  echo "# .vim.ana configurations #" >> "$PROFILE"
  echo "$SOURCE_LINE" >> "$PROFILE"
fi

echo 
echo "Done!"
