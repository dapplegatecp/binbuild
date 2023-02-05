include /build/Makefile.config

DOWNLOAD_PATH := https://curl.se/download/
FILE := curl-7.87.0.tar.gz
DIRECTORY := curl-7.87.0
CONFIG = $(DIRECTORY)/curl-config

default: all

all: $(FILE) $(DIRECTORY) $(CONFIG)
	make -C $(DIRECTORY)

$(CONFIG):
	cd $(DIRECTORY) && ./configure --host=$(HOST) --with-openssl --disable-shared --prefix=$(DESTDIR)/usr/local

$(DIRECTORY): $(FILE)
	tar -vxf $(FILE)

$(FILE):
	wget $(DOWNLOAD_PATH)$(FILE)
	touch $@

install: all
	make -C $(DIRECTORY) install DESTDIR=""

clean:
	rm -rf $(DIRECTORY)
	rm -rf $(FILE)

.PHONY: install clean
