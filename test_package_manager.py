import unittest
import logging
import sys

from package_manager import PackageManager, ManjaroPackager, PSearchResult


def noop(*args, **kwargs):
    return None


class MockPackager:
    packager_name = 'mock_package_manager'

    def __init__(self, search_result="found"):
        self.search_result = search_result

    def search(self, name):
        return self.search_result

    def install(self, pkgName):
        return True


class TestPackageManager(unittest.TestCase):
    def _get_packer(self, **kwargs):

        # disable anything that would make tests polute the output or slow things down
        kwargs.setdefault('log', noop)
        kwargs.setdefault('sleep_timeout', 0)

        packer = MockPackager()
        pkg_mnger = PackageManager(
            packer, **kwargs)

        return pkg_mnger

    def test_installable(self):
        pkg_mnger = self._get_packer()

        updated_packages = pkg_mnger.add_installable_package("vim")

        self.assertEqual(updated_packages, [{"name": "vim"}])

    def test_duplicate_installable(self):
        manager = self._get_packer()

        packages = ('python', 'python', 'git')

        for p in packages:
            manager.add_installable_package(p)

        self.assertEqual(manager.get_installable(), [{
                         "name": "python", }, {"name": "git"}])

    def test_installable_with_custom_builder(self):
        manager = self._get_packer()

        def build_fn(name):
            print(f'pkg name is {name}')

        pkgs = manager.add_installable_package(
            'my-cool-package-name', build_fn=build_fn)

        self.assertEqual(
            pkgs, [{"name": "my-cool-package-name", "build_fn": build_fn}])

    def test_install_installable(self):
        manager = self._get_packer()

        packages = ('python', 'git', 'curl')

        for p in packages:
            manager.add_installable_package(p)

        pkgs = manager.get_installable()

        self.assertEqual(pkgs, list(
            map(lambda x: {"name": x}, packages)))

        installed = manager.install_installable_packages()

        self.assertTrue(installed)

    def test_uncallable_build_fn(self):
        manager = self._get_packer()

        try:
            manager.add_installable_package('foo', build_fn="")
        except ValueError as err:
            self.assertEqual(str(err), "build_fn must be callable")

    def test_failed_custom_builds(self):
        def yell(name):
            raise Exception(name)

        builds = (
            ('a', lambda x: yell('package a is yelling from a test!')),
            ('b', lambda x: yell('package b is yelling from a test')),
            ('c', lambda x: yell('package c is yelling from a test')),
            ('d', lambda *x: True)

        )

        # add log=print to know what it would look like when running
        manager = self._get_packer()

        # Setup for fails
        for b in builds:
            manager.add_installable_package(b[0], build_fn=b[1])

        try:
            # testing fails
            manager.install_installable_packages()
        except Exception:
            pass
            # print(err)


class TestManjaroPackager(unittest.TestCase):
    def setup_packager(self):
        packager = ManjaroPackager(install_options="--no-confirm -d")
        return packager

    def test_manjaro_search(self):
        packager = self.setup_packager()

        result = packager.search('discord')

        self.assertEqual(result, PSearchResult.FOUND)

    def test_manjaro_search__unknown_package(self):
        packager = self.setup_packager()

        result = packager.search('some-failed-package')

        self.assertEqual(result, PSearchResult.NOT_FOUND)

    def test_manjaro_install(self):
        packager = self.setup_packager()

        result = packager.install('vi vim')

        self.assertEqual(result.returncode, 0)

    def test_manjaro_install_fail__unknown_package(self):
        packager = self.setup_packager()
        try:
            packager.install('some-failed-package')
        except Exception as error:
            self.assertEqual(str(error), "package not found")


if __name__ == '__main__':
    logging.basicConfig(stream=sys.stderr)

    unittest.main()
