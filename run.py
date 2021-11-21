#!/usr/bin/env python
from packages import PACKAGES


class NotImplementedError(Exception):
    pass


#
# TODO create a method to run postinstall for setup
#
# Post install should be run on base system install BEFORE config bootstrap takes place
# it should:
#  - get security updates/upgrades of base system
#  - get proper drivers
#  - run os specific setups IE on my manjaro installs I want to run `install_pulse` after install
#


def setup_emacs():
    packages = ("emacs",)
    # install doom
    # move doom config
    # install language servers (should that be apart of my doom config?)
    raise NotImplementedError("emacs")


def setup_fonts():
    # TODO build nerd fonts for what's stated in the readme
    raise NotImplementedError("fonts")


def setup_i3():
    i3_packages = (
        "i3-gaps",
        "i3lock",
        "i3exit",
        "python-i3ipc",
        "autotiling",
    )
    # todo install these packages
    # for package in i3_packages:
    #   packageManager.addInstallable(package)
    #
    #
    raise NotImplementedError("i3")


def setup_DE():
    gui_packages = PACKAGES["gui"]
    # TODO setup zoom > custom build script needed
    # https://support.zoom.us/hc/en-us/articles/204206269-Installing-or-updating-Zoom-on-Linux#h_5562a050-fe90-4372-90ca-cb3bb3e8f310

    de_packages = PACKAGES["de"]

    # setup_i3()

    raise NotImplementedError("de")


# Setup Distro, DE & Essentials
def setup_distro():
    base_packages = (
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
    )

    setup_DE()


def setup_dev_env():
    # setup languages
    #
    # setup node
    #
    #
    # setup docker & docker-compose
    print("setup def env")

    # install editors


def main():
    print("Running installer")
