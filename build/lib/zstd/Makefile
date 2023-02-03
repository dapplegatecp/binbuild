include /build/Makefile.config

DOWNLOAD_PATH := https://github.com/facebook/zstd/archive/refs/tags/
FILE := v1.5.2.tar.gz
DIRECTORY := zstd-1.5.2

default: all

all: $(FILE) $(DIRECTORY)
	make -C $(DIRECTORY) lib-release

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