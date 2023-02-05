include /build/Makefile.config

DOWNLOAD_PATH := git://nbd.name/luci2/libubox.git
DIRECTORY := libubox
CONFIG_H = $(DIRECTORY)/config.h

LDFLAGS += -static

default: all

all: $(DIRECTORY) $(CONFIG_H)
	make -C $(DIRECTORY) ubox-static

$(CONFIG_H):
	sed -i 's/-Werror//' $(DIRECTORY)/CMakeLists.txt # turn off warnings as errors
	sed -i '/^ADD_LIBRARY(ubox SHARED $${SOURCES})$$/d' $(DIRECTORY)/CMakeLists.txt # disable shared library
	sed -i 's/INSTALL(TARGETS ubox ubox-static/INSTALL(TARGETS ubox-static/' $(DIRECTORY)/CMakeLists.txt
	cd $(DIRECTORY) && cmake CMakeLists.txt -DBUILD_LUA=OFF -Wno-error

$(DIRECTORY):
	git clone $(DOWNLOAD_PATH)

install: all
	make -C $(DIRECTORY) install

clean:
	rm -rf $(DIRECTORY)

.PHONY: install clean
