#!/bin/bash

packages=(
  curl
  git
  neovim
  ranger
  ripgrep
  zsh
  fzf
  jq
)

linux_packages=(
  xsel
)


UNAME=`uname`


INSTALL_BIN=""


# find install bin
if [ $UNAME = "Darwin" ]; then
  INSTALL_BIN="brew install"
elif command -v apt-get &> /dev/null; 
then
  INSTALL_BIN="apt-get install -ys"
  echo "may require sudo"
elif command -v pacman &> /dev/null;
then
  INSTALL_BIN="pacman -S"
  echo "may require sudo"
else
  echo "cannot get install bin"
  exit 1
fi


echo "$INSTALL_BIN ${packages[@]}"
