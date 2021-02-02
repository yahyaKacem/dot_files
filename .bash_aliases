# handy aliases for files and directory management
alias lh="ls -alFh"
alias dirsizes='du -ks * | sort -n -b | column -t'
alias dircounts='for dp in *; do [ -d $dp ] && echo $(find $dp|wc -l) $dp; done | sort -n -b | column -t'

# git aliases
alias gl="git log"
alias gpl="git pull"
alias gb="git branch"
alias gst="git status"
alias gstsh="git stash"
alias gc="git commit -m"
alias gck="git checkout "
alias ga="git add --all ."
alias gstp="git stash pop"
alias gstl="git stash list"
alias gckb="git checkout -b "
alias gmrgd="git merge dev"
alias gmrgb="git merge beta"
alias gmrgm="git merge master"
alias gmrgp="git merge migration"
alias gckd="git checkout dev"
alias gckbt="git checkout beta"
alias gckm="git checkout master"
alias gckmg="git checkout migration"
alias gpd="git push origin dev"
alias gpnu="git push -u origin "
alias gpb="git push origin beta"
alias gp="git push origin master"
alias gpm="git push origin migration"
alias gch="git config --global credential.helper cache"
alias gct="git config --global credential.helper 'cache --timeout=3600'"
alias glp='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short'

# adding alias for mkdir all rights make parent if not
alias mkdirall='mkdir -p -m a=rwx'

# adding an alias for aria2c and axel
alias get='aria2c -c -x15 -k1M -U "`get_random_browser`" '
alias fetch='axel -a -n 10 -U "`get_random_browser`" '

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

# system stuff
alias scannet='sudo iwlist wlp2s0 scanning'
alias rstapch='sudo service apache2 restart'
alias rstnet='sudo service network-manager restart'
alias showPcks='sudo dpkg -l | grep '

# byobu stuff
alias clearUpdates='rm -rf /dev/shm/byobu-yahya-*/cache.tmux/updates-available*'

# date in boxes
alias boxDate='date +"%T"| toilet | boxes -d shell'

# check language files
alias ctf='wc -l /var/www/Work/card/src/assets/i18n/* |head -n 4|cut -d\  -f 3|sort|uniq|wc -l'
