BACKUPDIR = $(HOME)/.mydotfiles.backup
BASHRCTARGET = $(HOME)/.bashrc
INPUTRCTARGET = $(HOME)/.inputrc
LXQTPANELTARGET = $(HOME)/.config/lxqt/panel.conf
OPENBOXRCTARGET = $(HOME)/.config/openbox/rc.xml
QTERMINALTARGET = $(HOME)/.config/qterminal.org/qterminal.ini
SCREENRCTARGET = $(HOME)/.screenrc
TMUXCONFTARGET = $(HOME)/.tmux.conf
VIMRCTARGET = $(HOME)/.vimrc

install:
	mkdir -p $(BACKUPDIR)
	if [ -e $(BASHRCTARGET) ]; then mv -v $(BASHRCTARGET) $(BACKUPDIR)/ && ln -s $(PWD)/bashrc $(BASHRCTARGET); fi
	if [ -e $(INPUTRCTARGET)  ]; then mv -v $(INPUTRCTARGET) $(BACKUPDIR)/ && ln -s $(PWD)/inputrc $(INPUTRCTARGET); fi
	if [ -e $(LXQTPANELTARGET) ]; then mv -v $(LXQTPANELTARGET) $(BACKUPDIR)/ && ln -s $(PWD)/lxqtpanel.conf $(LXQTPANELTARGET); fi
	if [ -e $(OPENBOXRCTARGET) ]; then mv -v $(OPENBOXRCTARGET) $(BACKUPDIR)/ && ln -s $(PWD)/openboxrc.xml $(OPENBOXRCTARGET); fi
	if [ -e $(QTERMINALTARGET) ]; then mv -v $(QTERMINALTARGET) $(BACKUPDIR)/ && ln -s $(PWD)/qterminal.ini $(QTERMINALTARGET); fi
	if [ -e $(SCREENRCTARGET) ]; then mv -v $(SCREENRCTARGET) $(BACKUPDIR)/ && ln -s $(PWD)/screenrc $(SCREENRCTARGET); fi
	if [ -e $(TMUXCONFTARGET) ]; then mv -v $(TMUXCONFTARGET) $(BACKUPDIR)/ && ln -s $(PWD)/tmux.conf $(TMUXCONFTARGET); fi
	if [ -e $(VIMRCTARGET) ]; then mv -v $(VIMRCTARGET) $(BACKUPDIR)/ && ln -s $(PWD)/vimrc $(VIMRCTARGET); fi

uninstall:
	if [ -e $(BASHRCTARGET) ]; then unlink $(BASHRCTARGET) && mv -v $(BACKUPDIR)/`echo $(BASHRCTARGET) | awk -F'/' '{ print $$NF }' -` $(BASHRCTARGET); fi
	if [ -e $(INPUTRCTARGET) ]; then unlink $(INPUTRCTARGET) && mv -v $(BACKUPDIR)/`echo $(INPUTRCTARGET) | awk -F'/' '{ print $$NF }'` $(INPUTRCTARGET); fi
	if [ -e $(LXQTPANELTARGET) ]; then unlink $(LXQTPANELTARGET) && mv -v $(BACKUPDIR)/`echo $(LXQTPANELTARGET) | awk -F'/' '{ print $$NF }'` $(LXQTPANELTARGET); fi
	if [ -e $(OPENBOXRCTARGET) ]; then unlink $(OPENBOXRCTARGET) && mv -v $(BACKUPDIR)/`echo $(OPENBOXRCTARGET) | awk -F'/' '{ print $$NF }'` $(OPENBOXRCTARGET); fi
	if [ -e $(QTERMINALTARGET) ]; then unlink $(QTERMINALTARGET) && mv -v $(BACKUPDIR)/`echo $(QTERMINALTARGET) | awk -F'/' '{ print $$NF }'` $(QTERMINALTARGET); fi
	if [ -e $(SCREENRCTARGET) ]; then unlink $(SCREENRCTARGET) && mv -v $(BACKUPDIR)/`echo $(SCREENRCTARGET) | awk -F'/' '{ print $$NF }'` $(SCREENRCTARGET); fi
	if [ -e $(TMUXCONFTARGET) ]; then unlink $(TMUXCONFTARGET) && mv -v $(BACKUPDIR)/`echo $(TMUXCONFTARGET) | awk -F'/' '{ print $$NF }'` $(TMUXCONFTARGET); fi
	if [ -e $(VIMRCTARGET) ]; then unlink $(VIMRCTARGET) && mv -v $(BACKUPDIR)/`echo $(VIMRCTARGET) | awk -F'/' '{ print $$NF }'` $(VIMRCTARGET); fi
	rm -rfv $(BACKUPDIR) 
