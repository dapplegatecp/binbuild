include /build/Makefile.config

DOWNLOAD_PATH := https://www.openssl.org/source/
FILE := openssl-1.1.1s.tar.gz
DIRECTORY := openssl-1.1.1s
CONFIG_H = $(DIRECTORY)/config.h

default: all

all: $(FILE) $(DIRECTORY) $(CONFIG_H)
	make -C $(DIRECTORY)

$(CONFIG_H):
	cd $(DIRECTORY) && ./Configure --prefix=$(DESTDIR) linux-aarch64 no-async

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
