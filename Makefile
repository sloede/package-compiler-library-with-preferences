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
	julia --project=. -e 'using Pkg; Pkg.instantiate(); include("build.jl")'

set-runtime-prefs:
	cp runtime-prefs/Project.toml build/share/julia/Project.toml
	cp runtime-prefs/LocalPreferences.toml build/share/julia/LocalPreferences.toml

clean:
	rm -f mwe

.PHONY: mwe clean all lib set-runtime-prefs
