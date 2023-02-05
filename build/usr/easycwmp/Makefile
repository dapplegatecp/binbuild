include /build/Makefile.config

DOWNLOAD_PATH := https://easycwmp.org/download/
FILE := easycwmp-1.8.6.tar.gz
DIRECTORY := easycwmp-1.8.6
MAKEFILE = $(DIRECTORY)/Makefile

LDFLAGS += --static

default: all

all: $(FILE) $(DIRECTORY) $(MAKEFILE)
	make -C $(DIRECTORY)

$(MAKEFILE):
	patch -s -p0 --forward < easycwmp.patch || true
	cd $(DIRECTORY) && autoreconf -i 
	cd $(DIRECTORY) && ./configure --host=$(HOST) PKG_CONFIG_PATH=$(DESTDIR)/usr/local/lib/pkgconfig 

$(DIRECTORY): $(FILE)
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
