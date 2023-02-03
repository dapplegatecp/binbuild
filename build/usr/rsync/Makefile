include /build/Makefile.config

DOWNLOAD_PATH := https://download.samba.org/pub/rsync/
FILE := rsync-3.2.7.tar.gz
DIRECTORY := rsync-3.2.7
CONFIG_H = $(DIRECTORY)/config.h

LDFLAGS += -static

default: all

all: $(FILE) $(DIRECTORY) $(CONFIG_H)
	make -C $(DIRECTORY)

$(CONFIG_H):
	cd $(DIRECTORY) && ./configure --host=$(HOST) --disable-md2man --disable-debug --disable-openssl

$(DIRECTORY):
	tar -vxf $(FILE)

$(FILE):
	wget $(DOWNLOAD_PATH)$(FILE)
	touch $@

install: all
	make -C $(DIRECTORY) install

clean:
	rm -rf $(DIRECTORY)
	rm -rf $(FILE)

.PHONY: install clean
