import sys

filename = sys.argv[1]
command = sys.argv[2]
f = open(filename, "r")
lines = f.readlines()
for line in lines:
    lst = line.split()
    if lst[10] == command:
        print(lst[1], end=" ")