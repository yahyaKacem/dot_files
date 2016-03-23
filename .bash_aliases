# handy aliases for files and directory management
alias lh="ls -alFh"
alias dirsizes='du -ks * | sort -n -b | column -t'
alias dircounts='for dp in *; do [ -d $dp ] && echo $(find $dp|wc -l) $dp; done | sort -n -b | column -t'

# git aliases
alias gl="git log"
alias gpl="git pull"
alias gs="git status"
alias gb="git branch"
alias gstsh="git stash"
alias gc="git commit -m"
alias gck="git checkout "
alias ga="git add --all ."
alias gstp="git stash pop"
alias gstl="git stash list"
alias gckb="git checkout -b "
alias gmrgd="git merge dev"
alias gmrgm="git merge master"
alias gmrgp="git merge profile"
alias gckd="git checkout dev"
alias gckm="git checkout master"
alias gckp="git checkout profile"
alias gcka="git checkout angular2"
alias gp="git push origin dev"
alias gp="git push origin master"
alias gch="git config --global credential.helper cache"
alias gct="git config --global credential.helper 'cache --timeout=3600'"
alias glp='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short'

# gulp aliases
alias gd="gulp dist"
alias gw="gulp watch"
alias gbld="gulp build"
alias gjslint="gulp jslint"
alias ghtmllint="gulp htmlhint"

# bower aliases
alias bls='bower ls'
alias bs='bower search'
alias bi='bower install'
alias bui='bower uninstall'
alias bis='bower install --save'
alias buis='bower uninstall --save'

# httpster alias
alias httpster='/usr/local/lib/node_modules/httpster/bin/httpster'

# adding alias for mkdir all rights make parent if not
alias mkdirall='mkdir -p -m a=rwx'

# adding an alias for aria2c and axel
alias get='aria2c -c -x15 -k1M -U "`get_random_browser`" '
alias fetch='axel -a -n 10 -U "`get_random_browser`" '

# adding aliases for youtube-dl
alias yd='youtube-dl --user-agent "`get_random_browser`" -R 50 --restrict-filenames -ci -o "%(upload_date)s_%(uploader)s_%(title)s-%(id)s.%(ext)s" '

# Mongodb courses downloader
alias mongoedu="mongo-edu --cw --co --hq -u fuj.tyoli@gmail.com -d "

# coursera courses downloader
alias courseradl='coursera-dl --aria2 --formats="mp4 pdf" --username="fuj.tyoli@gmail.com"'

# teamviewer aliases
alias teamviewerstop='sudo teamviewer --daemon stop'
alias teamviewerstart='sudo teamviewer --daemon start'
alias teamviewerenable='sudo teamviewer --daemon enable'
alias teamviewerstatus='sudo teamviewer --daemon status'
alias teamviewerdisable='sudo teamviewer --daemon disable'
alias teamviewerrestart='sudo teamviewer --daemon restart'

# gedit aliasses
alias bashrc='sudo gedit ~/bashrc_yk'
alias bashlogout='sudo gedit ~/bash_logout'
alias bashaliases='sudo gedit ~/bash_aliases'

# system stuff
alias rstapch='sudo service apache2 restart'
alias rstnet='sudo service network-manager restart'
