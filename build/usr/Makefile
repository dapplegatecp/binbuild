include /build/Makefile.config

SUBS := hello rsync socat ssh ptpd easycwmp

default: all

all: $(SUBS)

install: all

clean: $(SUBS:=-clean)

$(SUBS): 
	make -C $@ install

$(SUBS:=-clean):
	make -C $(@:-clean=) clean

.PHONY: $(SUBS) 