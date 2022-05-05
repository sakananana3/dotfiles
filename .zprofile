#Read only once at login
#You should write setting when login shell.
# zshenv -> zprofile -> zshrc -> zlogin

if [ -f ~/.zshrc ] ; then
. ~/.zshrc
fi


