export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"

export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nvim
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/firefox

export PATH=$HOME/.local/bin:$PATH

export TERMINAL="$HOME/.local/bin/sensible"

#enable hidpi
#export USE_HIDPI=true

if [[ $USE_HIDPI == true ]]; then
  xrdb -merge $HOME/.Xresources.d/hidpi
  export QT_AUTO_SCREEN_SCALE_FACTOR=1
  export GDK_SCALE=2
fi


