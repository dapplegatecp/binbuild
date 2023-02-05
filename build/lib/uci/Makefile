include /build/Makefile.config

DOWNLOAD_PATH := git://nbd.name/uci.git
DIRECTORY := uci
CONFIG_H = $(DIRECTORY)/config.h

LDFLAGS += -static

default: all

all: $(DIRECTORY) $(CONFIG_H)
	make -C $(DIRECTORY)

$(CONFIG_H):
	sed -i 's/ADD_LIBRARY(uci SHARED/ADD_LIBRARY(uci STATIC/' $(DIRECTORY)/CMakeLists.txt
	cd $(DIRECTORY) && cmake CMakeLists.txt -DBUILD_LUA=OFF -DCMAKE_C_FLAGS="$(CPPFLAGS)"

$(DIRECTORY):
	git clone $(DOWNLOAD_PATH)

install: all
	make -C $(DIRECTORY) install

clean:
	rm -rf $(DIRECTORY)

.PHONY: install clean
