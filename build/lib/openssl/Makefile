include /build/Makefile.config

ifeq ($(ARCH), aarch64)
 MACHINE=linux-aarch64
else ifeq ($(ARCH), x86_64)
 MACHINE=linux-x86_64
else
 MACHINE=linux-generic32
endif

DOWNLOAD_PATH := https://www.openssl.org/source/
FILE := openssl-1.1.1s.tar.gz
DIRECTORY := openssl-1.1.1s
MAKEFILE = $(DIRECTORY)/Makefile

default: all

all: $(MAKEFILE)
	make -C $(DIRECTORY)

$(MAKEFILE): $(DIRECTORY)
	cd $(DIRECTORY) && ./Configure --prefix=$(DESTDIR) $(MACHINE) no-async no-shared no-ssl2 no-pic

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
