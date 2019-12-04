# .bash_profile

# homebrew tweak to work on 42 session
if [ "$(uname)" == "Darwin" ]; then
	user42=rjeraldi
	uid42=10657
	source $HOME/.macrc
	source $HOME/.brewconfig.zsh
	find $HOME/ -name "*42_cache_bak*" -exec rm -rv {} >> $HOME/$user42.cacheclean.log 2>&1 \;
	find $HOME/ -name ".DS_Store"  -exec rm {} 2>/dev/null \;
	backup () {
		rsync -avP -e 'ssh -p 6522' --exclude-from=$HOME/rsync.exclude --delete-after --exclude="Library" $HOME/ barutkin@109.202.17.2:/home/edu/IT/21-school/$user42.backup/ >> $HOME/$user42.backup.log 2>&1
		rsync -aLvP -e 'ssh -p 6522' --delete-after $HOME/Library barutkin@109.202.17.2:/home/edu/IT/21-school/$user42.backup/ >> $HOME/$user42.backup.log 2>&1 ;
	}
	logout () {
		backup;
		launchctl bootout user/$uid42;
	}
f

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

