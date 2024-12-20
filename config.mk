# stw version
VERSION := 0.4

VERSION := $(shell git describe --tags --abbrev=0)-planet36

# Customize below to fit your system

# paths
PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
MANDIR ?= $(PREFIX)/share/man

# includes and libs
INCS = `pkg-config --cflags fontconfig`
LIBS = `pkg-config --libs   xft xrender xfixes`

# flags
CPPFLAGS += -DVERSION=\"$(VERSION)\" $(INCS)
CPPFLAGS += -MMD -MP
CFLAGS += -O2 \
		  -Wno-shadow \
		  -Wno-sign-compare
LDLIBS += $(LIBS)
