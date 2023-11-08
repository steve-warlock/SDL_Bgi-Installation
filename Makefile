# Makefile for SDL_bgi
# Modified to work on M1/M2 Macs (Apple Silicon)
# Latest update: November 7, 2023

VERSION := $(shell cat ../VERSION)
NAME    = SDL_bgi
SRC     = $(NAME).c
OBJ     = $(NAME).o
HEADER1 = SDL_bgi.h
HEADER2 = graphics.h
FONTS   = bold.h euro.h goth.h lcom.h \
          litt.h sans.h scri.h simp.h \
          trip.h tscr.h
MANPAGE = ../doc/graphics.3.gz

SDLPY   = sdl_bgi.py
PYTHON  := $(shell command -v python3 2> /dev/null)
ifdef PYTHON
  PYUSERSITE := $(shell python -m site --user-site)
  $(shell mkdir -p $(PYUSERSITE))
endif

# Specify the path to SDL2 libraries and includes for M1/M2 Macs
SDL_LIB_DIR = /opt/homebrew/lib
SDL_INCLUDE_DIR = /opt/homebrew/include/SDL2

# Set the binary name
LIB = libSDL_bgi.so

# C compiler: tested with gcc, clang, and tcc
CC = clang
CFLAGS = -O2 -std=gnu99 -g -c -Wall -I$(SDL_INCLUDE_DIR)

LDFLAGS = -L$(SDL_LIB_DIR) -lSDL2

$(info *** Building on M1/M2 Mac (Apple Silicon) ***)
$(info )

.PHONY: all
all: $(LIB)

$(OBJ): $(SRC) $(FONTS) $(HEADER1)
	$(CC) $(CFLAGS) $(SRC)

$(LIB): $(OBJ)
	$(CC) -shared -o $(LIB) $(OBJ) $(LDFLAGS)

install: $(LIB) $(HEADER1)
	/usr/bin/install -m 755 $(LIB) $(LIB_DIR) ; \
	/usr/bin/install -m 644 $(HEADER1) $(SDL_INCLUDE_DIR) ; \
	/usr/bin/install $(HEADER2) $(INC_DIR) ; \
	/usr/bin/install $(MANPAGE) $(MANDIR)

# Optional: Modify for Python installation
python:  $(SDLPY)
ifdef PYTHON
	/usr/bin/install $(SDLPY) $(PYUSERSITE)
endif

uninstall:
	/bin/rm -f $(SDL_INCLUDE_DIR)/$(HEADER1) ; \
	/bin/rm -f $(INC_DIR)/$(HEADER2) ; \
	/bin/rm -f $(LIB_DIR)/$(LIB) ; \
	/bin/rm -f $(PYUSERSITE)/$(SDLPY) ; \
	/bin/rm -f $(MANDIR)/$(MANPAGE)

test: all
	cd ../test; make

clean:
	/bin/rm -f $(OBJ) $(LIB) a.out *.a *~
