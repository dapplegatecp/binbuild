include /build/Makefile.config

DOWNLOAD_PATH := https://github.com/lz4/lz4/archive/refs/tags/
FILE := v1.9.4.tar.gz
DIRECTORY := lz4-1.9.4

default: all

all: $(FILE) $(DIRECTORY)
	$(MAKE) -C $(DIRECTORY)

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
