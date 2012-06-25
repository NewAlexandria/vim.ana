# Vim Configs #

Vim Configs aims to make a 2-command install of a full vim harnass and CLI conveniences.  The focus of this repo is to deliver a Vim & related environment that can be dropped into any unix-flavor box, and without disruption to existing production configs.

## Features ##
*  Pathogen project and a set of related repos.
  Loaders
  *  [pathogen](https://github.com/tpope/vim-pathogen)
  *  [fugitive](https://github.com/tpope/vim-fugitive)
  
  IDE
  *  [surround](https://github.com/tpope/vim-surround)
	*  [bundler](https://github.com/tpope/vim-bundler)
	*  [gem-ctags](https://github.com/tpope/gem-ctags)
	*  [taglist](https://github.com/thisivan/vim-taglist)
  
  Formatting
  *  [align](https://github.com/jezcope/vim-align) ([docs here](http://www.drchip.org/astronaut/vim/doc/Align.txt.html))
  *  [NerdCommenter](https://github.com/scrooloose/nerdcommenter) 
  
  Syntax Colors
  *  [Solarized color scheme](git://github.com/altercation/vim-colors-solarized.git)
  *  [haml](https://github.com/tpope/vim-haml)
  *  [rails](https://github.com/tpope/vim-rails)
  *  [markdown](https://github.com/tpope/vim-markdown)
  *  [nginx](https://github.com/vim-scripts/nginx.vim)

*  Colorizes and formats the prompt to ` user@host /path (git branch) $ ` 
*  Sets up some common git aliases

## Install ##
Download and unpack to a `.`directory in your home, e.g.:

` cd ~; git clone git://github.com/NewAlexandria/vim.ana.git .vim.ana `

then link files into your home

` .vim.ana/install.sh `

The installer responsibily makes backups of your original .vim files to ~/.vim.ana/backups/  I thought this was better than to `cp -R` the lot of files into your existing .vim   

After installing links, the submodule bundles are pulled down.

You'll want to remember to install [the *ctags* library](http://ctags.sourceforge.net/).  Installation strategies differ per-platform, and I wante dthe `install.sh` to be robust.  If you're on OS X, you can ``brew isntall ctags``

That's it for now.

## Mañana ##

The following Vim plugins are under review

* [PowerLine](https://github.com/Lokaltog/vim-powerline)
* [AlignMaps](http://www.drchip.org/astronaut/vim/align.html)

# Спасибо #

Thanks for experimenting with this repo. **Architectural** suggestions welcomed. I'm particularly interested in how this can more-safely integrate with your existing environment practices.
