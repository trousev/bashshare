include Meta.Makefile
BUILDROOT=tmp/bashshare_$(VERSION)-1
deb:
	mkdir -p $(BUILDROOT)/usr/share/bashshare
	mkdir -p $(BUILDROOT)/usr/bin
	cp -r src/* $(BUILDROOT)/usr/share/bashshare
	cp src/share $(BUILDROOT)/usr/bin/share
	mkdir -p $(BUILDROOT)/etc/bash_completion.d
	cp src/share-completion $(BUILDROOT)/etc/bash_completion.d/bashshare
	cp res/sharerc $(BUILDROOT)/etc/sharerc
	mkdir -p $(BUILDROOT)/DEBIAN
	cat res/control | sed s/{VERSION}/$(VERSION)/g > $(BUILDROOT)/DEBIAN/control
	cd tmp && dpkg-deb --build bashshare_$(VERSION)-1



