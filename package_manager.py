#!/usr/bin/env python

import traceback
import subprocess
import re
from enum import Enum
from time import sleep

# This installer should scaffold packages needed for each portion of the system
#
# How should installation of packages be handled?
# 1. Create a map that determines what packages should be installed, when the bootstrap script is finished.
# This store could be managed with a class and allow packages to be added as "installable"
#
# example:
#   This will do a simple "install" on the distro in questions
#   Manjaro: `pamac install --no-confirm`
#   ubuntu/Pop: `apt install -yy`
#   packageManager.addInstallable('i3-gaps')
#
#   It should also allow for a build script to be provided.
#   Use a build script if you want to do anything outside the basic support of the package manager
#   Remember this is supposed to be simple by design, all complexity should be offloaded to a builder
#   packageManager.addInstallable('my-package-name', build_fn=my_build_fn)
#
#
#


class colors:
    HEADER = '\033[95m'
    LIGHTGREY = '\033[37m'
    DARKGREY = '\033[90m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


def every(iterable):
    for x in iterable:
        if x:
            return True
    return False


class PSearchResult(Enum):
    NOT_FOUND = "not_found",
    FOUND = 'found'


class Packager:
    packager_name = '__omg_please_dont_use_me__'

    def search(self, package_name, **kwargs):
        pass

    def install(self, package_name, **kwargs):
        pass


class ManjaroPackager(Packager):
    packager_name = "pamac"

    def __init__(self, install_options='--no-confirm', search_options="-q"):
        self.default_install_options = install_options
        self.default_search_options = search_options
        self.packager_name = self.__class__.packager_name

    def search(self, package_name, **kwargs):
        search_options = kwargs.get(
            'options_override', self.default_search_options)

        cmd = f'{self.packager_name} search'
        cmd = f'{cmd} {search_options} {package_name}'

        # make sure there's always a quiet flag
        if "-q" or "--quiet" not in search_options:
            cmd = f'{cmd} --quiet'

        # this could be smarter, support partial results? (too much?)
        # The packager might be a bad place to do that.
        # General search logic should be lifted into the PackageManager
        # If the exact match isn't found throw not found
        cmd = f'{cmd} | grep -E "^{package_name}$" || exit 127'

        try:
            subprocess.check_output(cmd, shell=True)
            return PSearchResult.FOUND
        except subprocess.CalledProcessError as err:
            if err.returncode == 127:
                return PSearchResult.NOT_FOUND
            else:
                raise Exception(f"unhandled exit code {err.returncode}")

    def install(self, pkg, **kwargs):
        install_options = kwargs.get(
            'options_override', self.default_install_options)

        cmd = [f"{self.packager_name} install {install_options} {pkg}"]

        try:
            res = subprocess.run(
                cmd, check=True, shell=True, capture_output=True)

            return res
        except subprocess.CalledProcessError as err:
            err_msg = str(err.stdout.decode('UTF-8'))

            if err_msg.startswith("Error: target not found"):
                raise Exception('package not found')
            else:
                raise Exception(f'unhandled-install-error: {err_msg}')


class PackageManager:

    def __init__(self, packager, sleep_timeout=3, log=print):

        # A install of installable packages
        # spec: List of {"name": string; "build_fn"?: (pkgName: string, packager: Packager): boolean}
        self.installable = []
        # defines class to normalize package managers
        self.packager = packager

        self.sleep = lambda: sleep(sleep_timeout)
        self.log = log

    # Get currently installable package list
    def get_installable(self):
        return self.installable

    # attempt to append a installable package to the list
    def add_installable_package(self, name, **kwargs):
        build_fn = kwargs.get("build_fn")

        pkg_is_present = every(
            x for x in self.installable if x.get('name') == name)

        if pkg_is_present:
            self.log(f'package: {name} already set as installable skipping...')
        else:
            installable = {"name": name}

            # test if build_fn is the right value
            if callable(build_fn):
                installable["build_fn"] = build_fn

            # test search result
            if self.packager.search(name) is PSearchResult.NOT_FOUND:
                raise Exception(f'{name} could not be found by packager')

            self.installable.append(installable)

            return self.installable

    def install_installable_packages(self):
        pkg_len = len(self.installable)

        if pkg_len == 0:
            self.log("no packages to install")
            return

        # these get installed first
        regular_installs = []
        # these are deferred to the end
        custom_installs = []

        for p in self.installable:
            # Will filter out bad 'build_fn' entries
            if callable(p.get("build_fn", None)):
                custom_installs.append(p)
            else:
                regular_installs.append(p)

        package_count = f"{colors.WARNING}{pkg_len}{colors.ENDC}"

        self.log(
            f"\n{colors.HEADER}Installing{colors.ENDC} {package_count} {colors.HEADER}package(s) using: {self.packager.packager_name}...{colors.ENDC}")

        pkg_names = list(map(lambda x: x.get("name"), regular_installs))

        self.sleep()

        try:
            pkgs = str(" ".join(pkg_names))

            self.packager.install(pkgs)

        except Exception as err:
            self.log("install failed")
            raise err

        self.log(f"{colors.OKGREEN}Normal installs complete{colors.ENDC}")

        if custom_installs:
            self.log(
                f"\n{colors.WARNING}!! Custom installs found, will attempt installation !!{colors.ENDC}")

            self.sleep()

            install_errors = []

            for install in custom_installs:
                name = install.get('name')

                self.log(
                    f'\n{colors.OKCYAN}Installing package {name}...{colors.ENDC}\n')

                fn = install.get('build_fn')

                try:
                    fn(pkg_name=name, log=self.log, packager=self.packager)

                    self.log(
                        f"{colors.OKGREEN}Build for package: {name} completed{colors.ENDC} \n")

                except Exception as err:
                    self.log(
                        f'{colors.FAIL}{colors.BOLD}Error {type(err)} encountered while building package: {name}{colors.ENDC}\n')

                    t = f"{colors.FAIL}{traceback.format_exc()}{colors.ENDC}"

                    self.log(t)

                    install_errors.append(
                        {"pkg_name": name, "err": str(err)})

            if install_errors:
                self.log(
                    f'{len(install_errors)} custom installs failed with errors')

                # TODO figure out if I want to handle/defer any state when custom installs fail

                # for e in install_errors:
                #     self.log(e.get('err'), file=sys.stderr)

        # clear installable after all installs finish
        self.installable = []

        return True
