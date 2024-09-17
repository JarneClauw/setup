'''modules'''

from log import log, LogLevel
from utils import cleanup, link, execute

class ModuleError(Exception):
    '''module error class'''
    def __init__(self, module: str, message: str):
        '''common base class for all module errors'''
        self.module = module
        self.message = message

    def log(self):
        '''log the error message'''
        log(self.message, LogLevel.ERROR, [self.module])

class Module:
    '''module class'''
    def __init__(self, name: str, configuration_function):
        self.name = name
        self.configuration_function = configuration_function

    def cleanup(self, paths: list[str], error_message: str = 'failed to clean up'):
        '''clean up the old module configuration'''
        ok = cleanup(paths)
        if not ok:
            raise ModuleError(self.name, error_message)
        return self

    def link(self, path: str, ignore_regex: str = '', error_message: str = 'failed to link'):
        '''link the new module configuration'''
        ok = link(self.name, path, ignore_regex)
        if not ok:
            raise ModuleError(self.name, error_message)
        return self

    def execute(self, command: str, error_message: str = 'failed to execute'):
        '''execute a command to set up the module'''
        ok = execute(command)
        if not ok:
            raise ModuleError(self.name, error_message)
        return self

    def configure(self):
        '''configure the module'''
        self.configuration_function(self)
        log('successfully configured', LogLevel.SUCCESS, [self.name])

alacritty = Module('alacritty', lambda self: self
    .cleanup(['$CONFIG/alacritty'])
    .link('$CONFIG/alacritty')
)
zsh = Module('zsh', lambda self: self
    .cleanup(['$HOME/.zshenv', '$CONFIG/zsh'])
    .link('$CONFIG/zsh', r'\.zshenv')
    .link('$HOME', r'\.zshrc')
    .execute('zsh -c "source $CONFIG/zsh/.zshrc"')
)
starship = Module('starship', lambda self: self
    .cleanup(['$CONFIG/starship'])
    .link('$CONFIG/starship')
)
git = Module('git', lambda self: self
    .cleanup(['$CONFIG/git'])
    .link('$CONFIG/git')
)
