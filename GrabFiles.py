# iterate files recursively

import os


def grabFiles(path):
    for root, dirs, files in os.walk(path):
        for file in files:
            path = os.path.join(root, file)


if __name__ == '__main__':
    # folder from argument
    import sys
    if len(sys.argv) < 2:
        path = '/home/lizhe/OriNote/notes/'
    else:
        path = sys.argv[1]
    grabFiles(path)
