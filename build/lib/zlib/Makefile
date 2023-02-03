#
# usr/bird
#
# Copyright (c) 2015 CradlePoint, Inc. <www.cradlepoint.com>.
# All rights reserved.
#
# This file contains confidential information of CradlePoint, Inc. and your
# use of this file is subject to the CradlePoint Software License Agreement
# distributed with this file. Unauthorized reproduction or distribution of
# this file is subject to civil and criminal penalties.
#

ROOT ?= /build
include $(ROOT)/Makefile.config

LINK := https://www.zlib.net/

DIR := zlib-1.2.13
PACKAGE := zlib-1.2.13.tar.gz
CONFIG = $(DIR)/config.h

default: all

all: $(PACKAGE) $(DIR) $(CONFIG)
	make -C $(DIR)

$(PACKAGE):
	wget $(LINK)$(PACKAGE)
	touch $@

$(DIR):
	tar -xf $(PACKAGE)

$(CONFIG):
	cd $(DIR) && ./configure

install: all
	make -C $(DIR) install
	ldconfig -n $(DESTDIR)/usr/

clean:
	rm -rf $(DIR)
	rm -rf $(PACKAGE)

.PHONY: