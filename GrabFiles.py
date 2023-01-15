# iterate files recursively

import os


def grabFiles(path):
    for root, dirs, files in os.walk(path):
        for file in files:
            print(os.path.join(root, file))


if __name__ == '__main__':
    # folder from argument
    import sys

    grabFiles(sys.argv[1])
