export PATH=$PATH:$HOME/.config/composer/vendor/bin:/opt/atom-1.20.0-amd64:/opt/:/opt/sqlite


DIR='di=34';  # directory
FILE='fi=0';  # file
SYM='ln=94';  # symbolic link
FIFO='pi=5';  # fifo file
SOCK='so=5';  # socket file
BLOCK='bd=5'; # block (buffered) special file
CHAR='cd=5';  # character (unbuffered) special file
ORPH='or=31'; # symbolic link pointing to a non-existent file (orphan)
MI='mi=0';    # non-existent file pointed to by a symbolic link (visible when you type ls -l)
EXE='ex=32';  # file which is executable (ie. has 'x' set in permissions).
export LS_COLORS=$DIR:$FILE:$SYM:$FIFO:$SOCK:$BLOCK:$CHAR:$ORPH:$MI:$EXE #:*.rpm=90

### decoration
# 0   = default colour
# 1   = bold
# 4   = underlined
# 5   = flashing text
# 7   = reverse field

### colors
# 31  = red
# 32  = green
# 33  = orange
# 34  = blue
# 35  = purple
# 36  = cyan
# 37  = grey
# 90  = dark grey
# 91  = light red
# 92  = light green
# 93  = yellow
# 94  = light blue
# 95  = light purple
# 96  = turquoise

### background colors
# 40  = black background
# 41  = red background
# 42  = green background
# 43  = orange background
# 44  = blue background
# 45  = purple background
# 46  = cyan background
# 47  = grey background
# 100 = dark grey background
# 101 = light red background
# 102 = light green background
# 103 = yellow background
# 104 = light blue background
# 105 = light purple background
# 106 = turquoise background
#
# These can even be combined, so that a parameter like:
# di=5;31;42
