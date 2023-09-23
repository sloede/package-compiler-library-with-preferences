PREFIX = $(PWD)/build
MPI_PREFIX = /usr/lib/x86_64-linux-gnu/openmpi

CC ?= gcc
CPPFLAGS ?= -I$(PREFIX)/include
CFLAGS ?= -Wall -Wextra -Werror -O0 -g2 -std=gnu11
LDFLAGS ?= -L$(PREFIX)/lib -Wl,-rpath,$(PREFIX)/lib
LIBS ?= -lmwe

CFLAGS_FPIC := $(CFLAGS) -fPIC
CPPFLAGS_MPI := $(CPPFLAGS) -I$(MPI_PREFIX)/include
LDFLAGS_MPI := $(LDFLAGS) -L$(MPI_PREFIX)/lib -Wl,-rpath,$(MPI_PREFIX)/lib
LIBS_MPI := $(LIBS) -lmpi

all: mwe

mwe: mwe.c
	$(CC) $^ -o $@ $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $(LIBS)

mwe-mpi-fpic: mwe-mpi.c
	$(CC) $^ -o $@ $(CPPFLAGS_MPI) $(CFLAGS_FPIC) $(LDFLAGS_MPI) $(LIBS_MPI)

mwe-mpi-no-fpic: mwe-mpi.c
	$(CC) $^ -o $@ $(CPPFLAGS_MPI) $(CFLAGS) $(LDFLAGS_MPI) $(LIBS_MPI)

lib:
	julia --project=. -e 'using Pkg; Pkg.instantiate(); include("build.jl")'

set-runtime-prefs:
	cp runtime-prefs/Project.toml build/share/julia/Project.toml
	cp runtime-prefs/LocalPreferences.toml build/share/julia/LocalPreferences.toml

clean:
	rm -f mwe
	rm -f mwe-mpi-fpic
	rm -f mwe-mpi-no-fpic

.PHONY: mwe clean all lib set-runtime-prefs
