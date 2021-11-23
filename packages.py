#!/usr/bin/env python
#
import builders.node
import builders.zoom
import builders.vscode
# TODO build slack

PACKAGES = {
    "base": (
        "cmake",
        "curl",
        "curlie",
        "fd",
        "fzf",
        "git",
        "glances",
        "htop",
        "jq",
        "less",
        "lesspipe",
        "neovim",
        "ripgrep",
        "speedtest-cli",
        "sqlite",
        "tldr",
        "tmux",
        "tree",
        "unzip",
        "wget",
        "xclip",
        "xdotool",
        "xorg-xev",
        "xorg-xwininfo",
        "zsh"
    ),
    "de": (
        "alacritty",
        "rofi",
        "rofi-emoji",
        "polybar",
        "picom",
        "nitrogen",
        "playerctl",
        # everything i3 related
        "i3-gaps",
        "xss-lock",
        "i3lock",
        "i3exit",
        "python-i3ipc",
        "autotiling",
    ),
    "langs": (
        ("node", builders.node.build),
         "docker",
         "docker-compose",
    ),
    "editor": (
        "emacs",
        ("vscode", builders.vscode.build)
    ),
    "fonts": (
        "font-manager",
        "ttf-hack",
        "ttf-bitstream-vera",
        "ttf-dejavu",
        "ttf-droid",
        "ttf-fira-code",
        "ttf-font-icons",
        "ttf-hack",
        "ttf-ibm-plex",
        "ttf-inconsolata",
        "ttf-indic-otf",
        "ttf-liberation",
        "ttf-montserrat",
        "ttf-nerd-fonts-symbols",
        "ttf-opensans",
        "noto-fonts",

    ),
    "gui": (
        "firefox",
        "font-manager",
        "gparted",
        "pcmanfm",
        ('zoom', builders.zoom.build)
    ),
}
