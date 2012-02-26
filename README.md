# Vim Configs #

Vim Configs aims to make a 2-command install of a full vim harnass and CLI conveniences.

## Features ##
*  Pathogen project and a set of related repos.
  *  fugitive
  *  haml
  *  pathogen
  *  rails
  *  surround
*  The Solarized color scheme is also used for vim coding.
*  Colorizes and formats the prompt to ``` user@host /path (git branch) $ ``` 


## Install ##
Download and unpack to a ```.```directory in your home.

``` cd ~; git clone git://github.com/NewAlexandria/vim.ana.git .vim.ana-repo ```

then link files into your home

``` .vim.ana-repo/install.sh ```

The installer responsibily makes backups of your original .vim files to ~/.vim.ana-repo/backups/  I thought this was better than to ```cp -R``` the lot of files into your existing .vim   

That's it for now.


# Спасибо #

**Architecural** suggestions welcomed. I'm particularly interested in how this can more-safely integrate with your existing environment practices.
