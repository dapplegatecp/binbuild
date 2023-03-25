include /build/Makefile.config

CFLAGS += 
LDFLAGS += -static

EXEC = hello
OBJS = hello.o

default: all

all: $(EXEC)

$(OBJS): hello.h

$(EXEC): $(OBJS)
	$(CC) -o $@ $(CFLAGS) $(OBJS) $(LDFLAGS)

install: $(EXEC)
	mkdir -p $(DESTDIR)/usr/bin/
	cp $(EXEC) $(DESTDIR)/usr/bin/

clean:
	rm -f $(EXEC) *.o hello