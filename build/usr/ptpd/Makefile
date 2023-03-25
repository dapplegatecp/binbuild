include /build/Makefile.config

DOWNLOAD_PATH := https://github.com/ptpd/ptpd/archive/refs/tags/
FILE := ptpd-2.3.1.tar.gz
DIRECTORY := ptpd-ptpd-2.3.1
CONFIG_H = $(DIRECTORY)/config.h

LDFLAGS += --static #some reason --static as oppsed to -static works

default: all

all: $(FILE) $(DIRECTORY) $(CONFIG_H)
	make -C $(DIRECTORY)

$(CONFIG_H):
	# sed -i '/^AC_FUNC_MALLOC$$/d' $(DIRECTORY)/configure.ac #fix a autoconf issue
	cd $(DIRECTORY) && autoreconf -i 
	cd $(DIRECTORY) && ./configure --host=$(HOST) 

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
