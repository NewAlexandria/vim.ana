# Vim Configs #

Vim Configs aims to make a 2-command install of a full vim harnass and CLI conveniences.  The focus of this repo is to deliver a Vim & related environment that can be dropped into any unix-flavor box, and without disruption to existing production configs.

## Features ##
*  Pathogen project and a set of related repos.
  Loaders
  *  [pathogen](https://github.com/tpope/vim-pathogen)
  *  [fugitive](https://github.com/tpope/vim-fugitive)
  
  IDE
  *  [rails](https://github.com/tpope/vim-rails)
  *  [surround](https://github.com/tpope/vim-surround)
	*  [bundler](https://github.com/tpope/vim-bundler)
	*  [gem-ctags](https://github.com/tpope/gem-ctags)
	*  [taglist](https://github.com/thisivan/vim-taglist)
	*  [unite](https://github.com/Shougo/unite.vim)

  'Windowing'
  * [NERDTree](https://github.com/scrooloose/nerdtree)
  * [buffergator](https://github.com/jeetsukumaran/vim-buffergator/)
  * (and some custom config to make these work together)
  
  Formatting
  *  [align](https://github.com/jezcope/vim-align) ([docs here](http://www.drchip.org/astronaut/vim/doc/Align.txt.html))
  *  [NerdCommenter](https://github.com/scrooloose/nerdcommenter) 
  
  Syntax Colors
  *  [Solarized color scheme](git://github.com/altercation/vim-colors-solarized.git)
  *  [haml](https://github.com/tpope/vim-haml)
  *  [markdown](https://github.com/tpope/vim-markdown)
  *  [javascript](https://github.com/jelera/vim-javascript-syntax)
  *  [scss](https://github.com/cakebaker/scss-syntax.vim)
  *  [nginx](https://github.com/vim-scripts/nginx.vim)

*  Colorizes and formats the prompt to ` user@host /path (git branch) $ ` 
*  Sets up some (perhaps) git aliases

## Install ##
**Vim 7.2 is recommended.  Some version greater than 7.0.23 is required for buffergator, and possibly others.**

Download and unpack to a `.`directory in your home, e.g.:

` cd ~; git clone git://github.com/NewAlexandria/vim.ana.git .vim.ana `

then link files into your home

` .vim.ana/install.sh `

The installer responsibily makes backups of your original .vim files to ~/.vim.ana/backups/  I thought this was better than to `cp -R` the lot of files into your existing .vim   

After installing links, the submodule bundles are pulled down.

You'll want to remember to install [the *ctags* library](http://ctags.sourceforge.net/).  Installation strategies differ per-platform, and I wanted the `install.sh` to be robust.  If you're on OS X, you can ``brew install ctags``

That's it for now.

## Customization ##

If you want to add your own plugins, note that this repo uses git submodules:

Additions: `cd ~/.vim.ana; git submodule add git-repo-address .vim/bundles/name-of-repo`
Removals:  [Follow these instructions](http://stackoverflow.com/questions/1260748/how-do-i-remove-a-git-submodule)

There is one other step: youu will need o comment out the `.vim/bundle/` line in the `.gitignore` *prior to adding the submodule*.  Then, *uncomment it* after it is added.  This is done because many of the plugins will modify their own files, and create commit noise.

## Mañana ##

The following Vim plugins are under review

* [PowerLine](https://github.com/Lokaltog/vim-powerline)
* [AlignMaps](http://www.drchip.org/astronaut/vim/align.html)

# Спасибо #

Thanks for experimenting with this repo. **Architectural** suggestions highly welcome. I'm particularly interested in 

* How this can more-safely integrate with your existing environment practices
* How to lower the version dependecy with Vim
* How to integrate with windowing apps on all platforms

## Sauce ##

![The awesomeness you'll get with this repo](http://i.imgur.com/p262L.png)
