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