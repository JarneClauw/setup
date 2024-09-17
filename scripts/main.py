'''main'''

import bundles
from utils import Parser

def main():
    '''configure a bundle of modules'''
    parser = Parser()
    parser.add_argument(
        '-b', '--bundle',
        help='bundle of modules to configure',
        type=str, default='all'
    )
    args = parser.parse_args()

    bundle = args.bundle
    bundles.configure_bundle(bundle)

if __name__ == '__main__':
    main()
