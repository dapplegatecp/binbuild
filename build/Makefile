include /build/Makefile.config

SUBS := lib usr

default: all

all: $(SUBS)
	mkdir -p /output/bins && find /output -executable -type f -exec file {} \; | grep static-pie | cut -d":" -f1 | xargs -I{} cp {} /output/bins || true
	$(STRIP) --strip-all /output/bins/*

install: all

clean: $(SUBS:=-clean)

$(SUBS): 
	make -C $@ install

$(SUBS:=-clean):
	make -C $(@:-clean=) clean

vars:
	echo ARCH=$(ARCH)
	echo JOBS=$(JOBS)
	echo DESTDIR=$(DESTDIR)
	echo CPPFLAGS=$(CPPFLAGS)
	echo CFLAGS=$(CFLAGS)
	echo LDFLAGS=$(LDFLAGS)
	echo CC=$(CC)
	echo GPLUSGPLUS=$(GPLUSPLUS)
	echo CXX=$(CXX)
	echo AR=$(AR)
	echo LD=$(LD)
	echo NM=$(NM)
	echo RANLIB=$(RANLIB)
	echo STRIP=$(STRIP)
	echo HOST=$(HOST)
	echo PATH=$(PATH)

.PHONY: vars $(SUBS)