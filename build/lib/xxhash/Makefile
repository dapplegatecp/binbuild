include /build/Makefile.config

DOWNLOAD_PATH := https://github.com/Cyan4973/xxHash/archive/refs/tags/
FILE := v0.8.1.tar.gz
DIRECTORY := xxHash-0.8.1

default: all

all: $(FILE) $(DIRECTORY)
	make -C $(DIRECTORY)

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