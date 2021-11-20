# Dots

## Preamble

These are my dot files. They make my computer homey.

The aim is to bring "ricer vibes" but still remain straightforward, reproducable, consistent, and maintainable

# Conventions

## Directory structure

I try my best to adhere to the [XDG Base Directory Stucture](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) for dealing with files/directories

# Setup/Stack

I'm primarly a TS/FE dev so most of my time is spend using node tools but I do dabble in other languages so I need this setup to be somewhat flexible this list will probably grow in time maybe/idk

Targeted languages/runtimes:

- NodeJS
- Python
- Docker
- Bash/Sh (native)

## Distro & Essentials

- [Manjaro i3](https://manjaro.org/download/#i3) idk if it matters persay for me tho
- lightdm w/slick-greeter (display manager)

- i3-gaps (wm)
- alacritty (term)
- polybar (status bar)
- rofi (launcher)
- picom (composer)

- pulseaudio
  - playerctl (media controls)
  - pa-applet
  - pavucontrol

TODO make the full package list somehow not sure how to do it yet

<!--
  I think it might be a little much to try and record _everything_ I install on my computers perfectly. Maybe break it into what depends on what?
  Maybe it should be broken up the same way as the readme and call a script to include installable packages in that layer
  IE when installing DOOM emacs, install emacs, and all prerequisites beforehand
  We should only support arch cuz I don't assume I'll be distrohopping I just want more consistency
  I'll need to either figure out a way of updating deps/managing them but one thing at a time-->

<!-- For a full list check the `packages.yml` file -->

### Editor(s)

- [DOOM Emacs](https://github.com/hlissner/doom-emacs)
- [VS Code](https://code.visualstudio.com/)
- neovim (sometimes)

### Wants/Needs

- URGENT: system wide emoji support!!! I can access them with rofi, but need a more elegant way of displaying them oh and emoji display is broken
- Move away from i3 to awesome(?)
- Make DOOM Emacs my true daily editor

# ✨ Aesthtics ✨

Like in the preamble, I like the idea of riced desktops, as they can blend a simplified productive one with a beautiful one.

This config should be consistent in theme and style while not getting in the devs way.

## Fonts

All fonts should support and or include powerline/emojis/nerd fonts

See [Nerd fonts](https://github.com/ryanoasis/nerd-fonts)

monospace/terminal: IBM Plex Mono (Blex)
sans serif: IBM Plex Sans
serif: IBM Plex Serif

## Styles and theming

All general colors, fonts, and sizes should be sourced from `~/.Xresources`

if the progam in question can't source it directly write a script or adapter to generate the configuration needed to read from the file. This is better in the long run as it'll allow for more consistency between different parts of the OS

# Installing

TODO But everything under `home/` represents what the user's $HOME dir should so you can either copy or symlink things as necessary.

<!-- Ideally I'd have a bootstrap script that allows for files to be distributed appropriatly and elegantly but that' a TODO -->
