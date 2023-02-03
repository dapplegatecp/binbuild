include /build/Makefile.config

SUBS := lz4 openssl xxhash zlib zstd

default: all

all: $(SUBS)

install: all

clean: $(SUBS:=-clean)

$(SUBS): 
	make -C $@ install

$(SUBS:=-clean):
	make -C $(@:-clean=) clean

.PHONY: $(SUBS) 