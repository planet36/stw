# stw - simple X text window
# See LICENSE file for copyright and license details.

include config.mk

BIN = stw

all: $(BIN)

.c.o:
	$(CC) $(STWCFLAGS) -c $<

$(BIN): stw.o
	$(CC) $^ $(STWLDFLAGS) -o $@

stw.o: arg.h config.h config.mk

clean:
	rm -f $(BIN) stw.o

install: $(BIN)
	mkdir -p $(DESTDIR)$(BINDIR)
	cp -f $(BIN) $(DESTDIR)$(BINDIR)
	chmod 755 $(DESTDIR)$(BINDIR)/$(BIN)
	mkdir -p $(DESTDIR)$(MANDIR)/man1
	sed "s/VERSION/$(VERSION)/g" < $(BIN).1 > $(DESTDIR)$(MANDIR)/man1/$(BIN).1
	chmod 644 $(DESTDIR)$(MANDIR)/man1/$(BIN).1

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/$(BIN) \
		$(DESTDIR)$(MANDIR)/man1/$(BIN).1

.PHONY: all clean install uninstall
