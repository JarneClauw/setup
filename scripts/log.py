'''log'''

from enum import Enum

ANSI_RESET = '\x1b[0m'

ANSI_BOLD_ON = '\x1b[1m'
ANSI_BOLD_OFF = '\x1b[22m'

ANSI_BLUE = '\x1b[34m'
ANSI_GREEN = '\x1b[32m'
ANSI_YELLOW = '\x1b[33m'
ANSI_RED = '\x1b[31m'

LogLevel = Enum('LogLevel', ['NORMAL', 'INFO', 'SUCCESS', 'WARNING', 'ERROR'])

def log(message: str, level: LogLevel = LogLevel.NORMAL, tags: list[str] | None = None):
    '''log a message to the terminal'''
    tags = [] if tags is None else tags

    tag_level = {
        LogLevel.NORMAL: '',
        LogLevel.INFO: '[INFO]',
        LogLevel.SUCCESS: '[SUCCESS]',
        LogLevel.WARNING: '[WARNING]',
        LogLevel.ERROR: '[ERROR]'
    }[level]
    tags_extra = '' if tags == [] else '[' + ']['.join([tag.upper() for tag in tags]) + ']'
    tags_all = f'{ANSI_BOLD_ON}{tag_level}{tags_extra}{ANSI_BOLD_OFF}'

    message_color = {
        LogLevel.NORMAL: ANSI_RESET,
        LogLevel.INFO: ANSI_BLUE,
        LogLevel.SUCCESS: ANSI_GREEN,
        LogLevel.WARNING: ANSI_YELLOW,
        LogLevel.ERROR: ANSI_RED
    }[level]

    print(f'{message_color}{tags_all} {message}{ANSI_RESET}')
