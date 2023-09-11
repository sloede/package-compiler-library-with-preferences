PREFIX = build

CC ?= gcc
CPPFLAGS ?= -I$(PREFIX)/include
CFLAGS ?= -Wall -Wextra -Werror -O0 -g2 -std=gnu11
LDFLAGS ?= -L$(PREFIX)/lib -Wl,-rpath,$(PREFIX)/lib
LIBS ?= -lmwe

all: mwe

mwe: mwe.c
	$(CC) $^ -o $@ $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $(LIBS)

lib:

clean:
	rm -f mwe

.PHONY: mwe clean all lib
