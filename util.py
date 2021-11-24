#!/usr/bin/env python3
from enum import Enum

def noop(*args, **kwargs):
    return None


def yell(name):
    raise Exception(name)


def every(iterable):
    for x in iterable:
        if x:
            return True
    return False


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



class PSearchResult(Enum):
    NOT_FOUND = "not_found",
    FOUND = 'found'


class Packager:
    packager_name = '__omg_please_dont_use_me__'

    def search(self, package_name, **kwargs):
        pass

    def install(self, package_name, **kwargs):
        pass
