#!/usr/bin/python
import os
file_path = ''

# get all files recursively in Ori
def getFiles(path):
    files = []
    for root, dirs, filenames in os.walk(path):
        for f in filenames:
            files.append(os.path.join(root, f))
    return files


def getMarkdownTags(path):
    files = getFiles(path)
    tags = []
    for f in files:
        if f.endswith('.md'):
            with open(f, 'r') as f:
                for line in f:
                    # line starts with # and non-space
                    if line.startswith('#') and line[1] != ' ' and line[1] != '#':
                        try:
                            tags.append([x[1:].strip() for x in line.split(' ') if x][0])
                            break
                        except:
                            pass
    # sort and remove duplicates
    tags = list(set(tags))
    tags.sort()
    # write to file

    with open(os.path.join(file_path, '..', 'tags.txt'), 'w') as f:
        for tag in set(tags):
            f.write(tag + '\n')
    return tags


if __name__ == '__main__':
    # get directory from command line
    import sys
    path = ''
    if len(sys.argv) > 1:
        path = sys.argv[1]
        file_path = path
    getMarkdownTags(path)
