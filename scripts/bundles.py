'''bundles'''

import modules
from utils import is_set, is_installed

BUNDLE_DEV = [
    modules.alacritty,
    modules.zsh,
    modules.starship,
    modules.git
]
BUNDLE_ALL = \
    BUNDLE_DEV

def configure_bundle(name: str):
    '''configure a bundle of modules'''
    is_set('HOME')
    is_set('CONFIG')
    is_set('SETUP')
    is_installed('stow')

    modules_list = {
        'dev': BUNDLE_DEV,
        'all': BUNDLE_ALL
    }[name]

    for module in modules_list:
        try:
            module.configure()
        except modules.ModuleError as error:
            error.log()
