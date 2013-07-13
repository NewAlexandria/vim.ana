# Vim.ana #

**Vim.ana** aims to make a 2-command install of a full vim IDE with CLI conveniences.  The focus of this repo is to deliver a Vim & related environment that can be dropped into any unix-flavor box, and without disruption to existing production configs.

## Features ##
* Pathogen for loading
* Familiar windowing setup of File Browser + Open Files + Edit Window
* IDE features via Unite and Fugitive
* Prompt colorization and formatting to `user@host /path (git branch) $`
* Sets up some git aliases

## Components ##

See the commented sections of [`.gitmodules`](https://github.com/NewAlexandria/vim.ana/blob/master/.gitmodules)

   Loader, IDE, 'Windowing', Formatting, Syntax Colors


## Install ##
**Vim 7.2 is recommended.  Some version greater than 7.0.23 is required for buffergator, unite, and possibly others.**

Download and unpack to `~/.vim.ana` (the installer will look for it here. You can move it later)

` cd ~; git clone git://github.com/NewAlexandria/vim.ana.git .vim.ana `

then link files and [do some other business](https://github.com/NewAlexandria/vim.ana/blob/master/install.sh)

` .vim.ana/install.sh `

The installer responsibily makes backups of your original .vim files to ~/.vim.ana/backups/  You can safely uninstall the files if need be (unlike if I'd `cp -R` the lot into your existing `.vim`)

The submodule bundles are automatically pulled down.

You'll want to remember to install [the *ctags* library](http://ctags.sourceforge.net/).  Installation strategies differ per-platform, and I wanted the `install.sh` to be robust.  If you're on OS X, you can ``brew install ctags``

That's it for now.

## Customization ##

If you want to add your own plugins, note that this repo uses git submodules:

Additions: `cd ~/.vim.ana; git submodule add git-repo-address .vim/bundles/name-of-repo`
Removals:  [Follow these instructions](http://stackoverflow.com/questions/1260748/how-do-i-remove-a-git-submodule)


## Mañana ##

The following Vim plugins are under review

* [AlignMaps](http://www.drchip.org/astronaut/vim/align.html)
* VCSCommand
* netrw

# Спасибо #

Thanks for experimenting with this repo. **Architectural** suggestions highly welcome. I'm particularly interested in 

* How this can more-safely integrate with your existing environment practices
* How to lower the version dependecy with Vim
* How to integrate with windowing apps on all platforms
* How to get the lauch time near-instant (takes as much as 1.5 sec on slow slices)

## Sauce ##

![The awesomeness you'll get with this repo](http://i.imgur.com/p262L.png)
