#!/usr/bin/env python
#
import os
from urllib.request import urlretrieve

# Install zoom
# This only works on Arch/ManjaroBTW
# As far as I know anyway


def build(**kwargs):
    log = kwargs.get('log', print)
    packager = kwargs.get('packager')

    dl_link = "https://zoom.us/client/latest/zoom_x86_64.pkg.tar.xz"
    dl_path = '/tmp/__zoom'

    os.makedirs(dl_path, exist_ok=True)

    log(f'Downloading zoom from \n {dl_path}')
    pkg_path = f"{dl_path}/zoom_x86_64.pkg.tar.xz"

    urlretrieve(dl_link, pkg_path)

    log(f'Installing via {packager.packager_name}')

    packager.install(pkg_path)
