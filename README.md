vim
===

This is just my vim configurations and settings. You're welcome to use it.

I have tested this on Arch Linux and Ubuntu 12.04.

You need to add the following to your ~/.bashrc:

export VIMDIR=$HOME/.vim/

export VIMRC=$VIMDIR/vimrc

export CUSTOM_VIMRC=$VIMDIR/personal.vim

And then run the following to get dependencies as well:

git submodule update --init --recursive

Follow the following to install necessary fonts:

https://powerline.readthedocs.io/en/master/installation/linux.html
