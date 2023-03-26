include /build/Makefile.config

DOWNLOAD_PATH := https://github.com/json-c/json-c/archive/refs/tags/
FILE := json-c-0.16-20220414.tar.gz
DIRECTORY := json-c-json-c-0.16-20220414
BUILD_DIR = json-c-build

# LDFLAGS += -static

default: all

all: $(BUILD_DIR)
	$(MAKE) -C $(BUILD_DIR)

$(BUILD_DIR): $(DIRECTORY)
	mkdir -p $(BUILD_DIR) && cd $(BUILD_DIR) && cmake ../$(DIRECTORY) 

$(DIRECTORY): $(FILE)
	tar -vxf $(FILE)

$(FILE):
	wget $(DOWNLOAD_PATH)$(FILE)
	touch $@

install: all
	make -C $(BUILD_DIR) install
	ln -sf $(DESTDIR)/usr/local/include/json-c $(DESTDIR)/usr/local/include/json
	ln -sf $(DESTDIR)/usr/local/lib/libjson-c.a $(DESTDIR)/usr/local/lib/libjson.a

clean:
	rm -rf $(DIRECTORY)
	rm -rf $(FILE)
	rm -rf $(BUILD_DIR)

.PHONY: install clean
