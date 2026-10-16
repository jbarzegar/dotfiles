#!/bin/bash
#
if command -v brew &> /dev/null; then
  echo "doing a brew cleanup"
  brew bundle cleanup
  brew cleanup
fi
