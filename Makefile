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
	mkdir -p $(DESTDIR)/bin
	cp src/share-smb $(DESTDIR)/bin/
	cp src/share-ssh $(DESTDIR)/bin/
	cp src/share-ssh-passwordless $(DESTDIR)/bin/
	cp src/ssh-passwordless $(DESTDIR)/bin/
	ln -s share-smb $(DESTDIR)/bin/SMB
	ln -s share-ssh $(DESTDIR)/bin/SSH
	ln -s share-ssh-passwordless $(DESTDIR)/bin/SSHP
uninstall:
	rm $(DESTDIR)/bin/share-smb
	rm $(DESTDIR)/bin/share-ssh
	rm $(DESTDIR)/bin/share-ssh-passwordless
	rm $(DESTDIR)/bin/ssh-passwordless
	rm $(DESTDIR)/bin/SSH
	rm $(DESTDIR)/bin/SMB
	rm $(DESTDIR)/bin/SSHP
all: install