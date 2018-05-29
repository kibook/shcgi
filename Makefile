PREFIX=/usr/local
TOOLS=cookie extractformdata param sendheaders urlparam

all:

install:
	cp $(TOOLS) $(PREFIX)/bin
