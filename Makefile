PREFIX = /usr
CONKYDIR = $(DESTDIR)$(PREFIX)/share/conky/naheel

binclock: bin.c
	cc bin.c -o binclock

install: binclock
	mkdir -p $(DESTDIR)$(PREFIX)/bin/
	cp -f binclock $(DESTDIR)$(PREFIX)/bin/
	mkdir -p $(CONKYDIR)
	sh ./gen-main.rc.sh > $(CONKYDIR)/main.rc
	cp ./config.rc $(CONKYDIR)/bin.rc
	cat bin.rc >> $(CONKYDIR)/bin.rc

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/binclock
	rm -fr $(CONKYDIR)

clean:
	rm -f binclock

.PHONY: clean install uninstall
