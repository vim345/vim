# I don't maintain this repo anymore. The new version of this repo is: https://github.com/vim345/nvim

vim
===

This is just my vim configurations and settings. You're welcome to use it.

I have tested this on Arch Linux, Ubuntu 19.04, and Mac.

You need to add the following to your ~/.bashrc:

```
export VIMDIR=$HOME/.vim/

export VIMRC=$VIMDIR/vimrc

export CUSTOM_VIMRC=$VIMDIR/personal.vim

And then run the following to get dependencies as well:

git submodule update --init --recursive
```
