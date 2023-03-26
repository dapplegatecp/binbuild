include /build/Makefile.config

DOWNLOAD_PATH := https://github.com/wojtekka/6tunnel/releases/download/0.13/
FILE := 6tunnel-0.13.tar.gz
DIRECTORY := 6tunnel-0.13
MAKEFILE := $(DIRECTORY)/Makefile

LDFLAGS+=-static

default: all

all: $(MAKEFILE)
	$(MAKE) -C $(DIRECTORY)

$(MAKEFILE): $(DIRECTORY)
	cd $(DIRECTORY) && ./configure --host=$(HOST) 

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