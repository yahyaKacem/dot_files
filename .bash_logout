# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console clear the screen to increase privacy

if [ "$SHLVL" = 1 ]
then
  [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
## save changes to $PATH and aliases during previous session in files and notify
## user about them
alias | md5sum > "/tmp/bash_tmp/aliases2"
echo $PATH | md5sum > "/tmp/bash_tmp/path2"
newpath="`diff "/tmp/bash_tmp/path1" "/tmp/bash_tmp/path2"`"
newalaises="`diff "/tmp/bash_tmp/aliases1" "/tmp/bash_tmp/aliases2"`"
if [ $newpath != "" ]
then
  echo $PATH > "/temp/new_path_here"
fi
if [ $newalaises != "" ]
then
  alias > "/temp/new_aliases_here"
fi
