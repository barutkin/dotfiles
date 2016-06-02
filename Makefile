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
	mv -v $(BASHRCTARGET) $(BACKUPDIR)/ && ln -s $(PWD)/bashrc $(BASHRCTARGET)
	mv -v $(INPUTRCTARGET) $(BACKUPDIR)/ && ln -s $(PWD)/inputrc $(INPUTRCTARGET)
	mv -v $(LXQTPANELTARGET) $(BACKUPDIR)/ && ln -s $(PWD)/lxqtpanel.conf $(LXQTPANELTARGET)
	mv -v $(OPENBOXRCTARGET) $(BACKUPDIR)/ && ln -s $(PWD)/openboxrc.xml $(OPENBOXRCTARGET)
	mv -v $(QTERMINALTARGET) $(BACKUPDIR)/ && ln -s $(PWD)/qterminal.ini $(QTERMINALTARGET)
	mv -v $(SCREENRCTARGET) $(BACKUPDIR)/ && ln -s $(PWD)/screenrc $(SCREENRCTARGET)
	mv -v $(TMUXCONFTARGET) $(BACKUPDIR)/ && ln -s $(PWD)/tmux.conf $(TMUXCONFTARGET)
	mv -v $(VIMRCTARGET) $(BACKUPDIR)/ && ln -s $(PWD)/vimrc $(VIMRCTARGET)

uninstall:
	unlink $(BASHRCTARGET) && mv -v $(BACKUPDIR)/`echo $(BASHRCTARGET) | awk -F'/' '{ print $$NF }' -` $(BASHRCTARGET)
	unlink $(INPUTRCTARGET) && mv -v $(BACKUPDIR)/`echo $(INPUTRCTARGET) | awk -F'/' '{ print $$NF }'` $(INPUTRCTARGET)
	unlink $(LXQTPANELTARGET) && mv -v $(BACKUPDIR)/`echo $(LXQTPANELTARGET) | awk -F'/' '{ print $$NF }'` $(LXQTPANELTARGET)
	unlink $(OPENBOXRCTARGET) && mv -v $(BACKUPDIR)/`echo $(OPENBOXRCTARGET) | awk -F'/' '{ print $$NF }'` $(OPENBOXRCTARGET)
	unlink $(QTERMINALTARGET) && mv -v $(BACKUPDIR)/`echo $(QTERMINALTARGET) | awk -F'/' '{ print $$NF }'` $(QTERMINALTARGET)
	unlink $(SCREENRCTARGET) && mv -v $(BACKUPDIR)/`echo $(SCREENRCTARGET) | awk -F'/' '{ print $$NF }'` $(SCREENRCTARGET)
	unlink $(TMUXCONFTARGET) && mv -v $(BACKUPDIR)/`echo $(TMUXCONFTARGET) | awk -F'/' '{ print $$NF }'` $(TMUXCONFTARGET)
	unlink $(VIMRCTARGET) && mv -v $(BACKUPDIR)/`echo $(VIMRCTARGET) | awk -F'/' '{ print $$NF }'` $(VIMRCTARGET)
	rm -rfv $(BACKUPDIR) 
