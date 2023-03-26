include /build/Makefile.config

DOWNLOAD_PATH := https://www.zlib.net/
FILE := zlib-1.2.13.tar.gz
DIRECTORY := zlib-1.2.13
CONFIG = $(DIRECTORY)/configure.log

default: all

all: $(CONFIG)
	$(MAKE) -C $(DIRECTORY)

$(CONFIG): $(DIRECTORY)
	cd $(DIRECTORY) && ./configure

$(DIRECTORY): $(FILE)
	tar -xf $(FILE)

$(FILE):
	wget $(DOWNLOAD_PATH)$(FILE)
	touch $@

install: all
	make -C $(DIRECTORY) install

clean:
	rm -rf $(DIRECTORY)
	rm -rf $(FILE)

.PHONY: