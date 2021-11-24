#!/usr/bin/env python
import subprocess
from util import Packager, PSearchResult

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
                cmd, check=True, shell=True)

            return res
        except subprocess.CalledProcessError as err:
            print('----\n', err)
            err_msg = str(err.stdout.decode('UTF-8'))

            if err_msg.startswith("Error: target not found"):
                raise Exception('package not found')
            else:
                raise Exception(f'unhandled-install-error: {err_msg}')
