# .bash_profile

# homebrew tweak to work on 42 session
if [ "$(uname)" == "Darwin" ]; then
	source $HOME/.brewconfig.zsh
fi
# 42_cache clean
rm -rf ~/Library/*42_cache_bak*
rm -rf ~/*42_cache_bak*

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
