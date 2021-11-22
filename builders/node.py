#!/usr/bin/env python

import os
import stat
import subprocess
from urllib.request import urlretrieve
from pathlib import Path
from zipfile import ZipFile


def build(**kwargs):
    log = kwargs.get('log', print)

    log('Starting node build using fnm')
    log('NOTE: This script uses fnm to install and manage node installs')

    log('Installing fnm')

    # download fnm zip to /tmp/__node_build/
    dl_path = '/tmp/__node_build'
    dl_link = 'https://github.com/Schniz/fnm/releases/latest/download/fnm-linux.zip'
    archive_name = 'fnm-linux.zip'
    # archive_path = '{dl_path}'

    os.makedirs(dl_path, exist_ok=True)

    archive_path = f'{dl_path}/{archive_name}'
    urlretrieve(dl_link, archive_path)

    binary_path = f"{dl_path}/fnm"

    # unzip the binary
    with ZipFile(archive_path, 'r') as z:
        z.extractall(dl_path)

    # move into bin
    binary_home_path = f"{Path.home()}/.local/bin"
    os.makedirs(binary_home_path, exist_ok=True)

    os.replace(binary_path, f"{binary_home_path}/fnm")

    # mark as executable
    os.chmod(binary_home_path, stat.S_IEXEC)

    log('Installing latest node lts')

    # install node lts
    subprocess.run([f"{binary_home_path}/fnm install --lts"], shell=True)

    print('Install run, node should be ready when we load our env')
