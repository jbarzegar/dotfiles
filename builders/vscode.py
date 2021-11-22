#!/usr/bin/env python3
import subprocess
from getpass import getpass

# NOTE manjaro needs to symlink /var/lib/snapd/snap before running snaps


def build(**kwargs):
    print('installing vscode via snap!')

    pw = getpass('Please provided sudo password: ')

    proc = subprocess.Popen(
        ['sudo -S /usr/bin/snap install code --classic'],
        shell=True,
        stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    try:
        outs, errs = proc.communicate(pw.encode(), timeout=15)

        err_str = str(errs)

        if "is already installed" in err_str:
            print(err_str)
        else:
            raise Exception(err_str)

    except subprocess.TimeoutExpired:
        proc.kill()
        raise Exception("build timed out")
    except Exception as err:
        raise err
