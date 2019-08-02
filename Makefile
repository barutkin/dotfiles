backupDir = $(HOME)/.mydotfiles.backup
bashrcTarget = $(HOME)/.bashrc
bashprofileTarget = $(HOME)/.bash_profile
bashaliasesTarget = $(HOME)/.bash_aliases
inputrcTarget = $(HOME)/.inputrc
xkbmapTarget = $(HOME)/.Xkbmap
lxqtpanelTarget = $(HOME)/.config/lxqt/panel.conf
openboxrcTarget = $(HOME)/.config/openbox/rc.xml
qterminalTarget = $(HOME)/.config/qterminal.org/qterminal.ini
screenrcTarget = $(HOME)/.screenrc
tmuxconfTarget = $(HOME)/.tmux.conf
vimrcTarget = $(HOME)/.vimrc

install:
	mkdir -p $(backupDir)
	if [ -e $(bashrcTarget) ]; then mv -v $(bashrcTarget) $(backupDir)/ && ln -s $(PWD)/bashrc $(bashrcTarget); fi
	if [ -e $(bashprofileTarget) ]; then mv -v $(bashprofileTarget) $(backupDir)/ && ln -s $(PWD)/bashrc $(bashprofileTarget); fi
	if [ -e $(bashaliasesTarget) ]; then mv -v $(bashaliasesTarget) $(backupDir)/ && ln -s $(PWD)/bash_aliases $(bashprofileTarget); fi
	if [ -e $(inputrcTarget)  ]; then mv -v $(inputrcTarget) $(backupDir)/ && ln -s $(PWD)/inputrc $(inputrcTarget); fi
	if [ -e $(xkbmapTarget)  ]; then mv -v $(xkbmapTarget) $(backupDir)/ && ln -s $(PWD)/Xkbmap $(xkbmapTarget); fi
	if [ -e $(lxqtpanelTarget) ]; then mv -v $(lxqtpanelTarget) $(backupDir)/ && ln -s $(PWD)/lxqtpanel.conf $(lxqtpanelTarget); fi
	if [ -e $(openboxrcTarget) ]; then mv -v $(openboxrcTarget) $(backupDir)/ && ln -s $(PWD)/openboxrc.xml $(openboxrcTarget); fi
	if [ -e $(qterminalTarget) ]; then mv -v $(qterminalTarget) $(backupDir)/ && ln -s $(PWD)/qterminal.ini $(qterminalTarget); fi
	if [ -e $(screenrcTarget) ]; then mv -v $(screenrcTarget) $(backupDir)/ && ln -s $(PWD)/screenrc $(screenrcTarget); fi
	if [ -e $(tmuxconfTarget) ]; then mv -v $(tmuxconfTarget) $(backupDir)/ && ln -s $(PWD)/tmux.conf $(tmuxconfTarget); fi
	if [ -e $(vimrcTarget) ]; then mv -v $(vimrcTarget) $(backupDir)/ && ln -s $(PWD)/vimrc $(vimrcTarget); fi

uninstall:
	if [ -e $(bashrcTarget) ]; then unlink $(bashrcTarget) && mv -v $(backupDir)/`echo $(bashrcTarget) | awk -F'/' '{ print $$NF }' -` $(bashrcTarget); fi
	if [ -e $(bashprofileTarget) ]; then unlink $(bashprofileTarget) && mv -v $(backupDir)/`echo $(bashprofileTarget) | awk -F'/' '{ print $$NF }' -` $(bashprofileTarget); fi
	if [ -e $(bashaliasesTarget) ]; then unlink $(bashaliasesTarget) && mv -v $(backupDir)/`echo $(bashaliasesTarget) | awk -F'/' '{ print $$NF }' -` $(bashaliasesTarget); fi
	if [ -e $(inputrcTarget) ]; then unlink $(inputrcTarget) && mv -v $(backupDir)/`echo $(inputrcTarget) | awk -F'/' '{ print $$NF }'` $(inputrcTarget); fi
	if [ -e $(xkbmapTarget) ]; then unlink $(xkbmapTarget) && mv -v $(backupDir)/`echo $(xkbmapTarget) | awk -F'/' '{ print $$NF }'` $(xkbmapTarget); fi
	if [ -e $(lxqtpanelTarget) ]; then unlink $(lxqtpanelTarget) && mv -v $(backupDir)/`echo $(lxqtpanelTarget) | awk -F'/' '{ print $$NF }'` $(lxqtpanelTarget); fi
	if [ -e $(openboxrcTarget) ]; then unlink $(openboxrcTarget) && mv -v $(backupDir)/`echo $(openboxrcTarget) | awk -F'/' '{ print $$NF }'` $(openboxrcTarget); fi
	if [ -e $(qterminalTarget) ]; then unlink $(qterminalTarget) && mv -v $(backupDir)/`echo $(qterminalTarget) | awk -F'/' '{ print $$NF }'` $(qterminalTarget); fi
	if [ -e $(screenrcTarget) ]; then unlink $(screenrcTarget) && mv -v $(backupDir)/`echo $(screenrcTarget) | awk -F'/' '{ print $$NF }'` $(screenrcTarget); fi
	if [ -e $(tmuxconfTarget) ]; then unlink $(tmuxconfTarget) && mv -v $(backupDir)/`echo $(tmuxconfTarget) | awk -F'/' '{ print $$NF }'` $(tmuxconfTarget); fi
	if [ -e $(vimrcTarget) ]; then unlink $(vimrcTarget) && mv -v $(backupDir)/`echo $(vimrcTarget) | awk -f'/' '{ print $$NF }'` $(vimrcTarget); fi
	rm -rfv $(backupDir) 
