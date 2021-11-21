#!/usr/bin/env python
from packages import PACKAGES
from package_manager import PackageManager, ManjaroPackager

packager = ManjaroPackager(install_options='-d')
manager = PackageManager(packager)


def stage_packages_for_install(pkg_list):
    for x in pkg_list:
        pkg_type = type(x)

        if pkg_type is tuple and len(x) == 2:
            (name, build_fn) = x
            manager.add_installable_package(name, build_fn=build_fn)
        elif pkg_type is str:
            manager.add_installable_package(x)
        else:
            raise Exception(f'package entry: {x} could not be handled')


def install_staged_packages():
    manager.install_installable_packages()


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
#
def setup_emacs():
    # install doom
    # move doom config
    # install language servers (should that be apart of my doom config?)
    raise NotImplementedError("emacs")


def setup_fonts():
    stage_packages_for_install(PACKAGES["fonts"])

    # TODO build nerd fonts for what's stated in the readme
    install_staged_packages()


def setup_editors():
    editor_packages = PACKAGES["editor"]

    stage_packages_for_install(editor_packages)

    install_staged_packages()

    setup_emacs()


def setup_de():
    de_packages = PACKAGES["de"]

    stage_packages_for_install(de_packages)

    install_staged_packages()

    gui_packages = PACKAGES["gui"]

    stage_packages_for_install(gui_packages)

    install_staged_packages()

    setup_fonts()

    raise NotImplementedError("de")


# Setup Distro, DE & Essentials
def setup_essential():
    base_packages = PACKAGES['base']

    print('installing base packages')

    stage_packages_for_install(base_packages)

    install_staged_packages()
    # TODO mv home folders to $HOME in this function?


def setup_prog_langs():
    l_packages = PACKAGES["langs"]
    print("setup langs")

    stage_packages_for_install(l_packages)

    install_staged_packages()


def main():
    print("Running installer")

    print('This installer will prompt you for your sudo password on occasion')

    print('setting up essentials')
    setup_essential()
    print('setting up programming languages and runtimes')
    setup_prog_langs()
    print('setting up DE and other gui related packages')
    setup_de()
    print('setting up editors')
    setup_editors()
