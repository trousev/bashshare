version=0.2
tarball:
	mkdir bashshare-$(version)
	cp -rf src bashshare-$(version)/src
	cp Makefile bashshare-$(version)
	cat bash-share-template.spec | sed s/{version}/$(version)/g > bashshare-$(version)/bash-share.spec
	tar cvzf bashshare-$(version).tar.gz bashshare-$(version)
rpm: tarball
	rpmbuild -ta bashshare-$(version).tar.gz
clean:
	rm -f bashshare-$(version).tar.gz
	rm -rf bashshare-$(version)
install:
	mkdir -p $(DESTDIR)/usr/bin
	cp src/share-smb $(DESTDIR)/usr/bin/
	cp src/share-ssh $(DESTDIR)/usr/bin/
	cp src/share-ssh-passwordless $(DESTDIR)/usr/bin/
	cp src/ssh-passwordless $(DESTDIR)/usr/bin/
	ln -s share-smb $(DESTDIR)/usr/bin/SMB
	ln -s share-ssh $(DESTDIR)/usr/bin/SSH
	ln -s share-ssh-passwordless $(DESTDIR)/usr/bin/SSHP
install-bash-completion:
	mkdir -p $(DESTDIR)/etc/bash_completion.d
	cp src/share-bash-completion $(DESTDIR)/etc/bash_completion.d/bashshare
uninstall-bash-completion:
	rm $(DESTDIR)/etc/bash_completion.d/bashshare
uninstall:
	rm $(DESTDIR)/usr/bin/share-smb
	rm $(DESTDIR)/usr/bin/share-ssh
	rm $(DESTDIR)/usr/bin/share-ssh-passwordless
	rm $(DESTDIR)/usr/bin/ssh-passwordless
	rm $(DESTDIR)/usr/bin/SSH
	rm $(DESTDIR)/usr/bin/SMB
	rm $(DESTDIR)/usr/bin/SSHP
all: install