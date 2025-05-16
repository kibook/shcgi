.PHONY: all install uninstall

prefix = /usr/local

all:

install:
	cp -t $(prefix)/bin cgi
	cp -t $(prefix)/bin cgi-cookie
	cp -t $(prefix)/bin cgi-free
	cp -t $(prefix)/bin cgi-header
	cp -t $(prefix)/bin cgi-init
	cp -t $(prefix)/bin cgi-keep-alive
	cp -t $(prefix)/bin cgi-param
	cp -t $(prefix)/bin cgi-session

uninstall:
	rm $(prefix)/bin/cgi
	rm $(prefix)/bin/cgi-cookie
	rm $(prefix)/bin/cgi-free
	rm $(prefix)/bin/cgi-header
	rm $(prefix)/bin/cgi-init
	rm $(prefix)/bin/cgi-keep-alive
	rm $(prefix)/bin/cgi-param
	rm $(prefix)/bin/cgi-session
