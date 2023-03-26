include /build/Makefile.config

DOWNLOAD_PATH := https://github.com/pivasoftware/microxml.git
DIRECTORY := microxml
CONFIG_H = $(DIRECTORY)/config.h

# LDFLAGS += -static

default: all

all: $(CONFIG_H)
	$(MAKE) -C $(DIRECTORY)

$(CONFIG_H): $(DIRECTORY)
	cd $(DIRECTORY) && autoreconf -i || true
	cd $(DIRECTORY) && ./configure --host=$(HOST) --prefix=$(DESTDIR)/usr/local --disable-shared

$(DIRECTORY):
	git clone $(DOWNLOAD_PATH)

install: all
	make -C $(DIRECTORY) install

clean:
	rm -rf $(DIRECTORY)

.PHONY: install clean
