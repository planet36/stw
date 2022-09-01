# stw version
VERSION := 0.4
VERSION := $(shell git describe --tags)-planet36

# Customize below to fit your system

# paths
PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
MANDIR ?= $(PREFIX)/share/man

# includes and libs
INCS = `pkg-config --cflags fontconfig`
LIBS = `pkg-config --libs   xft xrender`

# flags
CPPFLAGS += -DVERSION=\"$(VERSION)\" $(INCS)
CFLAGS += -std=c99 -pedantic -Wall -Wno-shadow -Wno-sign-compare $(CPPFLAGS)
LDLIBS += $(LIBS)
