version=0.4.3
all: help
tarball:
	rm -rf bashshare-$(version)
	mkdir -p output/bashshare-$(version)
	cp -rf src output/bashshare-$(version)/src
	cp Makefile output/bashshare-$(version)
	cat bash-share-template.spec | sed s/{version}/$(version)/g > output/bashshare-$(version)/bash-share.spec
	cd output && tar cvzf bashshare-$(version).tar.gz bashshare-$(version)
rpm: tarball
	cd output && rpmbuild --define "_sourcedir ." --define "_rpmdir ." --define "_buildir ." --define "_srcrpmdir ." --define "_speccdir ." -ta bashshare-$(version).tar.gz
deb: rpm
	cd output/noarch && fakeroot -- alien *.rpm
clean:
	rm -rf output
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
version: rpm deb
	cd output && rm -rf $(version)
	cd output && cp -rf noarch $(version)
	cd output && cp *.src.rpm $(version)
	cd output && cp *.tar.gz $(version)
push: version
	cd output && rsync -r -e ssh $(version) trousev@frs.sourceforge.net:/home/frs/project/bashshare/
help:
	echo "This is no help here"
