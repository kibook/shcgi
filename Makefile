.PHONY: all install uninstall

PREFIX=/usr/local

all:

install:
	cp cgi-cookie $(PREFIX)/bin
	cp cgi-free $(PREFIX)/bin
	cp cgi-header $(PREFIX)/bin
	cp cgi-init $(PREFIX)/bin
	cp cgi-param $(PREFIX)/bin
	cp cgi-session $(PREFIX)/bin

uninstall:
	rm $(PREFIX)/bin/cgi-cookie
	rm $(PREFIX)/bin/cgi-free
	rm $(PREFIX)/bin/cgi-header
	rm $(PREFIX)/bin/cgi-init
	rm $(PREFIX)/bin/cgi-param
	rm $(PREFIX/bin/cgi-session
