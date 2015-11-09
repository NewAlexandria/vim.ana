# Vim.ana #

**Vim.ana** aims to make a 2-command install of a full vim IDE with CLI conveniences.  Think of Vim being able to do everything that can be done with IntelliJ, or similar.  

The focus of this repo is to be portable, environment-neutral, and safe for existing configs.  Vim.ana is a Vim & related environment that can be dropped into any unix-flavor box, and without disruption to existing production configs.

## Features ##
* NeoBundle for loading.
* Familiar windowing setup of File Browser + Open Files + Edit Window.
* IDE features that align with RubyMine, Eclipse, and others.
* Comprehensive file and symbol search system.
* Version control integration.
* NeoVim optimized.


## Components ##

See the [opening sections of the .vimrc](https://github.com/NewAlexandria/vim.ana/blob/master/.vimrc#L25-L112) for a structured and commented guide to what's in the box.

* Loaders
* IDE
* Text & Completions
* Frameworks
* File System
* Layout
* Windowing
* Version control
* Formatting
* Syntax Colors

The `.vimrc` is organized into logical sections, with jump-points to each area of configs and plugins.

## Mappings ##

1. To see a [list of all mappings](https://github.com/NewAlexandria/vim.ana#leader-and-unite-mappings) in the .vimrc group - type: `<leader>L` *(which should be `\L`)*
2. To see a list of all the mappings from plugings, vimrc, etc. - type: `:map`

**dbext**, the DB browser, [has a great tutorial, here](http://mutelight.org/dbext-the-last-sql-client-youll-ever-need)


## Install ##
**NeoVim is recommended.  Vim 7.3 is probably a requirement.  Some version greater than 7.0.23 is absolutely required for buffergator, unite, and possibly others.**

Download and unpack to `~/.vim.ana` (the installer will look for it here. You can move it later)

` cd ~; git clone https://github.com/NewAlexandria/vim.ana.git .vim.ana `

then link files and [do some other business](https://github.com/NewAlexandria/vim.ana/blob/master/install.sh)

` .vim.ana/install.sh `

The installer responsibily makes backups of your original .vim files to ~/.vim.ana/backups/  You can safely uninstall the files if need be (unlike if I'd `cp -R` the lot into your existing `.vim`)

NeoBundles are ***not*** automatically pulled down.

After you install, review the `.vimrc` and type  `<leader>L`, which should be `\L`, to dive in.


### Ctags ###

You'll want to remember to install [the *ctags* library](http://ctags.sourceforge.net/).  Installation strategies differ per-platform, and I wanted the `install.sh` to be robust.  If you're on OS X, you can ``brew install ctags``

* The out-of-the-box ctags installation does not seem to handle anon functions in `.js` files, and barfs to stdout.  [See my `.dotfiles` solution to this](https://github.com/NewAlexandria/dotfiles/blob/master/ctags)
* Ensure ctags reach into the gems installed in your rails app: [use Tim Pope's excellent gem-ctags](https://github.com/tpope/gem-ctags#installation)
* Also consider [ctag-indexing those Ruby stlibs](https://github.com/tpope/rbenv-ctags#installation), too.
* Be aware that, with `rspec`, your [describe blocks may not be correctly indexed](https://github.com/fishman/ctags/issues/11), even with [fishman's ctag build](https://github.com/fishman/ctags) for Ruby methods


### OSX Users ###

The pre-insintalled `Vim` does not come compiled with `lua`.  See [Chris' awesome instructions](http://www.codeography.com/2013/06/11/install-macvim-with-lua-support.html) for compiling Vim, [NeoVim](https://github.com/neovim/homebrew-neovim/blob/master/README.md) and MacVim with homebrew.

That's it for now.

## Customization ##

If you want to add your own plugins, note that this repo uses NeoBundle.  [Instructions for adding more plugins](https://github.com/Shougo/neobundle.vim#2-install-configured-bundles), to [the .vimrc list](https://github.com/NewAlexandria/vim.ana/blob/master/.vimrc).


## Mañana ##

The following directions are under review:

- [configure for Tmux](http://tilvim.com/2014/07/30/tmux-and-vim.html)
#### Searching
- adding a Unite scope for `dbext` databases (or [SQLcomplete](https://github.com/vim-scripts/SQLComplete.vim))
- VCSCommand
- netrw
#### Indexing
- a proper tag parses for ruby *and rspec* namespaces, since 'ctags' fails at this, perhaps [starscope](https://github.com/eapache/starscope/blob/master/doc/USER_GUIDE.md),  [tagfinder](http://andrewradev.com/2011/10/15/vim-and-ctags-finding-tag-definitions/), or [rdoc-tags](https://github.com/rdoc/rdoc-tags)
- A clear winner for ctag support, whether tpope's, [vim-tags](https://github.com/szw/vim-tags), or another.
#### Collab
- [floobits](https://github.com/Floobits/floobits-neovim) for SubEthnaEdit/Etherpad style collaboration.
- Install via [Vimswitch](https://priomsrb.github.io/vimswitch/)?



# Спасибо #

Thanks for experimenting with this repo.  Suggestions always welcome. I'm particularly interested in 

* A new way to onbaord people into using the features of this configuration. (Recent `LeaderMap()` function was the start)
* How this can more-safely integrate with your existing environment practices (this may be Vimswitch)
* How to lower the version dependecy with Vim
* How to integrate with windowing apps on all platforms
* How to get the lauch time near-instant (takes as much as 1.5 sec on slow slices)

## Sauce ##

#### Windowing Layout
![The awesomeness you'll get with this repo](http://imgur.com/At3ku1l.jpg)

#### Leader and Unite Mappings
![the LeaderMap() function](http://i.imgur.com/4InDFSt.png)
[See the function](https://github.com/NewAlexandria/vim.ana/blob/master/.vim/plugin/ide.rc.vim#L51)

