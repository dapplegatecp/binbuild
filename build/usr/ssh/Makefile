include /build/Makefile.config

DOWNLOAD_PATH := https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/
FILE := openssh-9.1p1.tar.gz
DIRECTORY := openssh-9.1p1
CONFIG_H = $(DIRECTORY)/config.h

LDFLAGS += -static

default: all

all: $(FILE) $(DIRECTORY) $(CONFIG_H)
	make -C $(DIRECTORY) ssh scp sshd

$(CONFIG_H):
	cd $(DIRECTORY) && ./configure --host=$(HOST) --prefix=$(DESTDIR)

$(DIRECTORY):
	tar -vxf $(FILE)

$(FILE):
	wget $(DOWNLOAD_PATH)$(FILE)
	touch $@

install: all
	# just copy the ssh and scp binary
	mkdir -p $(DESTDIR)/usr/bin/
	cp $(DIRECTORY)/ssh $(DESTDIR)/usr/bin/
	cp $(DIRECTORY)/scp $(DESTDIR)/usr/bin/
	cp $(DIRECTORY)/sshd $(DESTDIR)/usr/bin/

clean:
	rm -rf $(DIRECTORY)
	rm -rf $(FILE)

.PHONY: install clean
