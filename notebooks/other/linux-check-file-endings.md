# Check the type of line endings of a file in Linux

## Check the type of line endings
Use the `file` utility to give the line endings indication

### In Unix:
```bash
$ file testfile1.txt
testfile1.txt: ASCII text
```

### In DOS (Windows):
```bash
$ file testfile2.txt
testfile2.txt: ASCII text, with CRLF line terminators
```

## Convert line terminators

### Convert from DOS to Unix:
```bash
$ dos2unix testfile2.txt
```

### Convert from Unix to DOS:
```bash
$ unix2dos testfile1.txt
```

