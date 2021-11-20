#!/usr/bin/env python
#
import builders


PACKAGES = {
    "base": (
        "curl",
        "curlie",
        "fzf",
        "git",
        "glances",
        "htop",
        "jq",
        "less",
        "lesspipe",
        "neovim",
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
    "langs": (
        (("node", builders.node.build),
         "docker",
         "docker-compose"),
    ),
    "editor": (
        "emacs",
    ),
    "fonts": (),
    "gui": (
        "firefox",
        "font-manager",
        "gparted",
        "pcmanfm",
        ('zoom', builders.zoom.build)
    ),

    "de": (
        "alacritty",
        "rofi",
        "rofi-emoji",
        "polybar",
        "picom",
        "nitrogen",
        # everything i3 related
        "i3-gaps",
        "i3lock",
        "i3exit",
        "python-i3ipc",
        "autotiling",
    )
}
