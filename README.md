# Vim Configs #

Vim Configs aims to make a 2-command install of a full vim harnass and CLI conveniences.

## Features ##
*  Pathogen project and a set of related repos.
  *  [https://github.com/tpope/vim-pathogen](pathogen)
  *  [https://github.com/tpope/vim-fugitive](fugitive)
  *  [https://github.com/tpope/vim-haml](haml)
  *  [https://github.com/tpope/vim-rails](rails)
  *  [https://github.com/tpope/vim-surround](surround)
*  The [git://github.com/altercation/vim-colors-solarized.git](Solarized color scheme) is also used for vim coding.
*  Colorizes and formats the prompt to ``` user@host /path (git branch) $ ``` 


## Install ##
Download and unpack to a ```.```directory in your home.

``` cd ~; git clone git://github.com/NewAlexandria/vim.ana.git .vim.ana ```

then link files into your home

``` .vim.ana/install.sh ```

The installer responsibily makes backups of your original .vim files to ~/.vim.ana/backups/  I thought this was better than to ```cp -R``` the lot of files into your existing .vim   

That's it for now.

## Mañana ##

The following Vim plugins are under review

* [https://github.com/Lokaltog/vim-powerline](PowerLine)


# Спасибо #

**Architecural** suggestions welcomed. I'm particularly interested in how this can more-safely integrate with your existing environment practices.
