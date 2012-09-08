PROJECT=ramdisk-devtools
REVISION = 0.0.3
BUILD=$(PROJECT)_$(REVISION)
TARGET = $(BUILD).deb

SRC = src
TMPDIR = .build
MAKEDIR = $(TMPDIR)/$(BUILD)
DEBIAN = $(MAKEDIR)/DEBIAN
CONTROL = $(DEBIAN)/control
MD5SUMS = $(DEBIAN)/md5sums

build: clean
	mkdir -p $(MAKEDIR)
	cp -pr $(SRC)/* $(MAKEDIR)
	gzip --best $(MAKEDIR)/usr/share/doc/$(PROJECT)/changelog
	find $(MAKEDIR) -type d -name '.svn' -print0 | xargs -0 -I {} rm -fr {}
	find $(MAKEDIR) -type f -not -regex '.*/DEBIAN/.*' -print0 | xargs -0 -I {} md5sum {} | sed -e 's#$(MAKEDIR)/##' > $(MD5SUMS)
	sed -i 's/^Package:.*/Package: $(PROJECT)/' $(CONTROL)
	sed -i 's/^Version:.*/Version: $(REVISION)/' $(CONTROL)
	fakeroot dpkg-deb --build $(MAKEDIR)

release: build
	#debsigs -sign=origin $(TMPDIR)/$(TARGET)
	cp -p ${TMPDIR}/$(TARGET) $(TARGET)

clean:
	rm -fr $(TMPDIR)
