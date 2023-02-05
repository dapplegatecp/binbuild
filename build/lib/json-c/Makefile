include /build/Makefile.config

DOWNLOAD_PATH := https://github.com/json-c/json-c/archive/refs/tags/
FILE := json-c-0.16-20220414.tar.gz
DIRECTORY := json-c-json-c-0.16-20220414
CONFIG_H = $(DIRECTORY)/config.h

# LDFLAGS += -static

default: all

all: $(FILE) $(DIRECTORY) $(CONFIG_H)
	make -C json-c-build

$(CONFIG_H):
	mkdir -p json-c-build && cd json-c-build && cmake ../$(DIRECTORY) 

$(DIRECTORY): $(FILE)
	tar -vxf $(FILE)

$(FILE):
	wget $(DOWNLOAD_PATH)$(FILE)
	touch $@

install: all
	make -C json-c-build install
	ln -sf $(DESTDIR)/usr/local/include/json-c $(DESTDIR)/usr/local/include/json
	ln -sf $(DESTDIR)/usr/local/lib/libjson-c.a $(DESTDIR)/usr/local/lib/libjson.a

clean:
	rm -rf $(DIRECTORY)
	rm -rf $(FILE)
	rm -rf json-c-build

.PHONY: install clean
