tarball:
	mkdir bashshare-0.1
	cp -rf src bashshare-0.1/src
	cp Makefile bashshare-0.1
	cp bash-share.spec bashshare-0.1
	tar cvzf bashshare-0.1.tar.gz bashshare-0.1
rpm: tarball
	rpmbuild -ta bashshare-0.1.tar.gz
clean:
	rm -f bashshare-0.1.tar.gz
	rm -rf bashshare-0.1
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