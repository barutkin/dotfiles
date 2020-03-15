# .bash_profile

export GOPATH=$HOME/.gopath
export PATH=$GOPATH:$GOPATH/bin:~/bin/:$PATH
export PATH_BACKUP=$PATH

test -s ~/.bash_aliases && . ~/.bash_aliases || true

# homebrew tweak to work on 42 session etc.
if [ "$(uname)" == "Darwin" ]; then
  usbPath='/Volumes/rjeraldiSSD/rjeraldi'
  homePath=$HOME
  chmod -R -a "everyone deny delete,write" /Volumes/rjeraldiSSD/rjeraldi/Library 2>/dev/null
  chmod -R -a "everyone deny delete,write" $HOME/Library 2>/dev/null
	for file in {'Franz','Google', 'Royal TSX','TabNine','Vivaldi','com.eltima.cloudmounter','com.lemonmojo.RoyalTSX.App'}; do
		rm -rf "$homePath/Library/Application Support/$file"
		ln -sf "$usbPath/Library/Application Support/$file" "$homePath/Library/Application Support/"
	done
  # killall Dock
	# source $HOME/.macrc

  export LC_ALL=en_US.UTF-8

	[[ -r "/Users/rjeraldi/.brew/etc/profile.d/bash_completion.sh" ]] && . "/Users/rjeraldi/.brew/etc/profile.d/bash_completion.sh"


  export PATH=$HOME/.brew/opt/ruby/bin:$HOME/.brew/lib/ruby/gems/2.6.0/bin:$PATH
  disable_brewruby () {
    export PATH=$PATH_BACKUP
  }
  # export LDFLAGS="-L$HOME/.brew/opt/ruby/lib"
  # export CPPFLAGS="-I$HOME/.brew/opt/ruby/include"
  # export PKG_CONFIG_PATH="$HOME/.brew/opt/ruby/lib/pkgconfig"

	export TMUX_TMPDIR=$HOME/tmp
	user42=rjeraldi
	uid42=10657
	source $HOME/.brewconfig.zsh
	backup () {
		rsync -avP -e 'ssh -p 6522' --delete-before --exclude-from=$HOME/rsync.exclude $HOME/ barutkin@109.202.17.2:/home/edu/IT/21-school/$user42.backup/ >> $HOME/$user42.backup.log 2>&1 ;
		rsync -avP -e 'ssh -p 6522' --delete-before --exclude-from=$HOME/rsync.exclude /Volumes/rjeraldiSSD barutkin@109.202.17.2:/home/edu/IT/21-school/ >> $HOME/$user42.backup.log 2>&1 ;
		# rsync -aLvP -e 'ssh -p 6522' --delete-before --exclude-from=$HOME/rsync.exclude $HOME/goinfre barutkin@109.202.17.2:/home/edu/IT/21-school/$user42.backup/ >> $HOME/$user42.backup.log 2>&1 ;
	}
	maclogout () {
    chmod -R +a "everyone deny delete,write" /Volumes/rjeraldiSSD/rjeraldi/Library
    chmod -R +a "everyone deny delete,write" $HOME/Library
    osascript -e 'tell application "System Events" to log out'
	}
  screensaver () {
    /System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine
  }
  # cacheclean () {
    find $HOME/ -maxdepth 1 -name "*42_cache_bak*" -exec rm -rv {} >> $HOME/$user42.cacheclean.log 2>&1 \;
    find $HOME/Library/ -name "*42_cache_bak*" -exec rm -rv {} >> $HOME/$user42.cacheclean.log 2>&1 \;
    # find $HOME/ -name ".DS_Store"  -exec rm {} 2>/dev/null \;
  # }
fi

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

# By default non-brewed cpan modules are installed to the Cellar. If you wish
# for your modules to persist across updates we recommend using `local::lib`.
# You can set that up like this:
#   PERL_MM_OPT="INSTALL_BASE=$HOME/perl5" cpan local::lib
#   echo 'eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"' >> ~/.bash_profile

# ==> python@3.8
# Python has been installed as
#  /Volumes/rjeraldiSSD/rjeraldi/.brew/opt/python@3.8/bin/python3
# You can install Python packages with
#  /Volumes/rjeraldiSSD/rjeraldi/.brew/opt/python@3.8/bin/pip3 install <package>
# They will install into the site-package directory
#  /Volumes/rjeraldiSSD/rjeraldi/.brew/opt/python@3.8/Frameworks/Python.framework/Versions/3.8/lib/python3.8/site-packages
# See: https://docs.brew.sh/Homebrew-and-Python
# python@3.8 is keg-only, which means it was not symlinked into /Volumes/rjeraldiSSD/rjeraldi/.brew,
# because this is an alternate version of another formula.
# If you need to have python@3.8 first in your PATH run:
#  echo 'export PATH="/Volumes/rjeraldiSSD/rjeraldi/.brew/opt/python@3.8/bin:$PATH"' >> ~/.bash_profile
# For compilers to find python@3.8 you may need to set:
#  export LDFLAGS="-L/Volumes/rjeraldiSSD/rjeraldi/.brew/opt/python@3.8/lib"
# For pkg-config to find python@3.8 you may need to set:
#  export PKG_CONFIG_PATH="/Volumes/rjeraldiSSD/rjeraldi/.brew/opt/python@3.8/lib/pkgconfig" 
#
# ==> openjdk
# For the system Java wrappers to find this JDK, symlink it with
#   sudo ln -sfn /Volumes/rjeraldiSSD/rjeraldi/.brew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
# openjdk is keg-only, which means it was not symlinked into /Volumes/rjeraldiSSD/rjeraldi/.brew,
# because it shadows the macOS `java` wrapper.
# If you need to have openjdk first in your PATH run:
#   echo 'export PATH="/Volumes/rjeraldiSSD/rjeraldi/.brew/opt/openjdk/bin:$PATH"' >> ~/.bash_profile
# For compilers to find openjdk you may need to set:
#   export CPPFLAGS="-I/Volumes/rjeraldiSSD/rjeraldi/.brew/opt/openjdk/include"
