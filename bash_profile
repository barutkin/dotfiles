# .bash_profile

# homebrew tweak to work on 42 session
if [ "$(uname)" == "Darwin" ]; then
	source $HOME/.brewconfig.zsh
fi
# 42
rm -rf ~/Library/*42_cache_bak*
rm -rf ~/*42_cache_bak*
find ~/ -name ".DS_Store"  -exec rm {} 2>/dev/null \;

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
if [ $TERM == linux ]; then
    echo "You have to be root to remap the console keyboard"
    sudo bash -c "(dumpkeys | grep keymaps; echo 'keycode  58 = Control') | loadkeys"
    sudo bash -c "(dumpkeys | grep keymaps; echo 'keycode  29 = Caps_Lock') | loadkeys"
fi

# 42 logout with backup
backup () {
	rsync -avP -e 'ssh -p 6522' --exclude-from=/Users/rjeraldi/rsync.exclude --delete-after /Users/rjeraldi/ barutkin@109.202.17.2:/home/edu/IT/21-school/rjeraldi.backup/ >> /Users/rjeraldi/rjeraldi.backup.log 2>&1 ;
}
logout () {
	backup;
	launchctl bootout user/10657;
}
