# -*- coding: utf-8 -*-
import os


def grabFiles(path):
    l = []
    for root, dirs, files in os.walk(path):
        for file in files:
            # get file extension
            ext = os.path.splitext(file)[1]
            if ext != '.md':
                continue
            # replace string
            t_path = os.path.join(root, file).replace(root + '/', '')
            # get name from path
            name = os.path.basename(t_path)
            l.append(name + "," + t_path + '\n')
    # write to file
    with open(os.path.join(path, "..", "note_paths.txt"), "w") as f:
        for item in l:
            f.write(item)


if __name__ == '__main__':
    # folder from argument
    import sys

    if len(sys.argv) < 2:
        path = '/home/lizhe/OriNote/notes/Ori'
    else:
        path = sys.argv[1]
    grabFiles(path)
