CC   = gcc
COPT = -g -O2 -DUNIX -I../smapi -I../fidoconfig
INSTBINDIR = /usr/local/bin
INSTMANDIR = /usr/local/man
LOPT = -L../fidoconfig -L../smapi

all : sqpack 

sqpack: sqpack.c
	$(CC) $(COPT) $(LOPT) sqpack.c -o sqpack -lsmapilnx -lfidoconfig

sqpack.1.gz : sqpack.1
	gzip -c sqpack.1 > sqpack.1.gz

install: sqpack sqpack.1.gz
	install -s sqpack $(INSTBINDIR)
	install sqpack.1.gz $(INSTMANDIR)/man1

clean: 
	-rm sqpack
	-rm sqpack.1.gz
	-rm *~


distclean: clean

