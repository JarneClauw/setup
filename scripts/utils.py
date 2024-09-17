"""utils"""

import argparse
import os
from pathlib import Path
import sys
from typing import Sequence
from log import log, LogLevel

#### PARSER ####
class HelpFormatter(
    argparse.RawDescriptionHelpFormatter,
    argparse.ArgumentDefaultsHelpFormatter
):
    '''formatter that does not change the whitespace and adds the default values for options'''

class Parser(argparse.ArgumentParser):
    '''parser based on the argparser module'''
    def __init__(self,
        prog: str | None = None,
        usage: str | None = None,
        description: str | None = None,
        epilog: str | None = None
    ):
        super().__init__(
            prog=prog,
            usage=usage,
            description=description,
            epilog=epilog,
            formatter_class=HelpFormatter,
            allow_abbrev=False,
            exit_on_error=False
        )

    def parse_args(
        self,
        args: Sequence[str] | None = None,
        namespace: None = None
    ) -> argparse.Namespace:
        try:
            return super().parse_args(args, namespace)
        except argparse.ArgumentError as error:
            log(error, LogLevel.ERROR)
            sys.exit()

#### IS_SET ####
def is_set(variable: str):
    '''exit the program if the given environment variable is not set'''
    if variable not in os.environ:
        log(f'{variable} environment variable is not set', LogLevel.ERROR)
        sys.exit()

#### IS_INSTALLED ####
def is_installed(program: str):
    '''exit the program if the given program is not installed'''
    installed = os.system(f'{program} --version &> /dev/null') == 0
    installed = installed or os.system(f'{program} -h &> /dev/null') == 0
    installed = installed or os.system(f'{program} --help &> /dev/null') == 0

    if not installed:
        log(f'the \'{program}\' package is not installed', LogLevel.ERROR)
        sys.exit()

#### MODULES ####
def cleanup(paths: list[str]) -> bool:
    '''remove files and make directories empty'''
    ok = True
    paths_expanded = [Path(os.path.expandvars(path)) for path in paths]
    for path in paths_expanded:
        if not path.exists():
            continue

        path = path.absolute()
        command = f'rm -rf {path}; mkdir -p {path}' if path.is_dir() else f'rm -f {path}'
        ok = os.system(command) == 0
        if not ok:
            break
    return ok

def link(name: str, target: str, ignore: str = '') -> bool:
    '''link module files to the target location'''
    ignore_option = f'--ignore \"{ignore}\"' if ignore != '' else ignore
    target_option = f'--target {target}'
    status = os.system(f'cd $SETUP/dotfiles; stow {ignore_option} {target_option} {name}')
    return status == 0

def execute(command: str) -> bool:
    '''execute a command'''
    return os.system(command) == 0
