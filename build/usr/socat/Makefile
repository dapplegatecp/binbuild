include /build/Makefile.config

DOWNLOAD_PATH := http://www.dest-unreach.org/socat/download/
FILE := socat-1.7.4.4.tar.gz
DIRECTORY := socat-1.7.4.4
CONFIG_H = $(DIRECTORY)/config.h

LDFLAGS += -static

default: all

all: $(FILE) $(DIRECTORY) $(CONFIG_H)
	make -C $(DIRECTORY)

$(CONFIG_H):
	cd $(DIRECTORY) && ./configure --host=$(HOST) --disable-vsock

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
