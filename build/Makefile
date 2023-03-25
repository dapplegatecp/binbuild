include /build/Makefile.config

SUBS := lib usr

default: all

all: $(SUBS)
	find /output -executable -type f -exec $(STRIP) --strip-all {} \;

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