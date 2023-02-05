include /build/Makefile.config

DOWNLOAD_PATH := git://nbd.name/luci2/ubus.git
DIRECTORY := ubus
MAKEFILE = $(DIRECTORY)/Makefile

default: all

all: $(DIRECTORY) $(MAKEFILE)
	make -C $(DIRECTORY) ubus

$(MAKEFILE):
	sed -i 's/ADD_LIBRARY(ubus SHARED/ADD_LIBRARY(ubus STATIC/' $(DIRECTORY)/CMakeLists.txt
	sed -i 's/INSTALL(TARGETS ubus cli/INSTALL(TARGETS ubus/' $(DIRECTORY)/CMakeLists.txt
	cd $(DIRECTORY) && cmake CMakeLists.txt -DBUILD_LUA=OFF -DBUILD_EXAMPLES=OFF -DENABLE_SYSTEMD=OFF -DCMAKE_C_FLAGS="$(CPPFLAGS)" || true

$(DIRECTORY):
	git clone $(DOWNLOAD_PATH)

install: all
	cp $(DIRECTORY)/ubusmsg.h $(DESTDIR)/usr/local/include
	cp $(DIRECTORY)/ubus_common.h $(DESTDIR)/usr/local/include
	cp $(DIRECTORY)/libubus.h $(DESTDIR)/usr/local/include
	cp $(DIRECTORY)/libubus.a $(DESTDIR)/usr/local/lib

clean:
	rm -rf $(DIRECTORY)

.PHONY: install clean
