PREFIX=/usr/local
TOOLS=cookie extractformdata param header urlparam

all:

install:
	cp $(TOOLS) $(PREFIX)/bin
