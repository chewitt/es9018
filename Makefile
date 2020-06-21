# SPDX-License-Identifier: GPL-2.0-or-later
#
# Copyright (C) 2020 Christian Hewitt (christianshewitt@gmail.com)

KERNELRELEASE ?= $(shell uname -r)
KERNELDIR ?= /lib/modules/$(KERNELRELEASE)/build
DESTDIR ?=
SRCDIR ?= $(PWD)

PWD := $(shell pwd)

all: module

debug: module-debug

ifneq ($(V),1)
MAKEFLAGS += --no-print-directory
endif

module:
	@$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

clean:
	@$(MAKE) -C $(KERNELDIR) M=$(PWD) clean

.PHONY: all module clean
