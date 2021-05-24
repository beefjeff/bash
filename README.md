# bash
My bash aliases and helper functions
This is mainly for my own organization.\
Separates bash aliases, functions, and variables into their own files.


## install
you can easily use this by sourcing the '.bash_includes' in your '~/.bashrc' file \
`. .bash_includes`
## functions
### add-alias()
Adds an alias to the aliases.sh file
Duplicates not allowed

### remove-alias()
Deletes an alias

### change-alias()
Allows you to rename or change the command of an alias.\
It will replace the existing line in aliases.sh with a new line.

### prompt()
provides a uniform prompt in different shells\
```
prompt 'whats your name?:' YOUR_NAME
echo $YOUR_NAME
```
zsh and bash have different ways of using 'read'.  \
this simply checks if you're using zsh and uses the appropriate method to read input with a prompt

### git-done()
bundles up some commands I keep writing


```
# running 'git-done' will do the following

git add .

# ask for a commit message
git commit -m $COMMIT_MESSAGE

git push # assuming that you've set up an upstream remote

# todo - add conditionals to set up a remote of one is not already

```


