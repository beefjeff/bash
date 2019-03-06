
export PATH=$PATH:$HOME/.config/composer/vendor/bin:/opt/atom-1.20.0-amd64:/opt/:/opt/sqlite:$HOME/Github_Clones/envoy


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
