# handy aliases for files and directory management
alias lh="ls -alFh"
alias dirsizes='du -ks * | sort -n -b | column -t'
alias dircounts='for dp in *; do [ -d $dp ] && echo $(find $dp|wc -l) $dp; done | sort -n -b | column -t'

# git aliases
alias gl="git log"
alias ga="git add ."
alias gs="git status"
alias gb="git branch"
alias gc="git commit -m"
alias gck="git checkout "
alias gckb="git checkout -b "
alias gp="git push origin master"
alias gch="git config --global credential.helper cache"
alias gct="git config --global credential.helper 'cache --timeout=3600'"

# bower aliases
alias br='bower'
alias bls='bower ls'
alias bs='bower search'
alias bi='bower install'
alias bui='bower uninstall'
alias bis='bower install --save'

# httpster alias
alias httpster='/usr/local/lib/node_modules/httpster/bin/httpster'

# adding alias for mkdir all rights make parent if not
alias mkdirall='mkdir -p -m a=rwx'

# adding an alias for aria2c and axel
alias fetch='axel -a -n 10 -U "`get_random_browser`" '
alias get='aria2c -c -x15 -k1M -U "`get_random_browser`" '

# adding aliases for youtube-dl
alias yd='youtube-dl --user-agent "`get_random_browser`" -R 50 --restrict-filenames -ci -o "%(upload_date)s_%(uploader)s_%(title)s-%(id)s.%(ext)s" '

# Mongodb courses downloader
alias mongoedu="mongo-edu --cw --co --hq -u fuj.tyoli@gmail.com -d "

# coursera courses downloader
alias courseradl='coursera-dl --aria2 --formats="mp4 pdf" --username="fuj.tyoli@gmail.com"'

#teamviewer aliases
alias teamviewerstop='sudo teamviewer --daemon stop'
alias teamviewerstart='sudo teamviewer --daemon start'
alias teamviewerenable='sudo teamviewer --daemon enable'
alias teamviewerstatus='sudo teamviewer --daemon status'
alias teamviewerdisable='sudo teamviewer --daemon disable'
alias teamviewerrestart='sudo teamviewer --daemon restart'

# gedit aliases
alias bashrc='sudo gedit ~/bashrc_yk'
alias bashlogout='sudo gedit ~/bash_logout'
alias bashaliases='sudo gedit ~/bash_aliases'
