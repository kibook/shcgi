.PHONY: all install uninstall

PREFIX=/usr/local

all:

install:
	cp -t $(PREFIX)/bin cgi
	cp -t $(PREFIX)/bin cgi-cookie
	cp -t $(PREFIX)/bin cgi-free
	cp -t $(PREFIX)/bin cgi-header
	cp -t $(PREFIX)/bin cgi-init
	cp -t $(PREFIX)/bin cgi-keep-alive
	cp -t $(PREFIX)/bin cgi-param
	cp -t $(PREFIX)/bin cgi-session

uninstall:
	rm $(PREFIX)/bin/cgi
	rm $(PREFIX)/bin/cgi-cookie
	rm $(PREFIX)/bin/cgi-free
	rm $(PREFIX)/bin/cgi-header
	rm $(PREFIX)/bin/cgi-init
	rm $(PREFIX)/bin/cgi-keep-alive
	rm $(PREFIX)/bin/cgi-param
	rm $(PREFIX)/bin/cgi-session
