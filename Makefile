# Makefile for compiling a C program with SDL2 on M1/M2 Mac (Apple Silicon)
# Latest update: November 7, 2023

# Compiler and compiler flags
CC = clang
CFLAGS = -O2 -std=c11 -Wall -Wextra -fPIC

# Source files and output library name
SRC = SDL_bgi.c
LIB = libSDL_bgi.so

# Header file
HEADER = SDL_bgi.h

# Installation directories
LIB_DIR = /opt/homebrew/lib
INC_DIR = /opt/homebrew/include

# Default target (all)
all: $(LIB)

# Compile the source files into a shared library
$(LIB): $(SRC)
	$(CC) $(CFLAGS) $(shell pkg-config --cflags sdl2) -shared -o $(LIB) $(SRC) $(shell pkg-config --libs sdl2)

# Copy the library and header files to installation directories
install: $(LIB) $(HEADER)
	/usr/bin/install -m 755 $(LIB) $(LIB_DIR) ; \
	/usr/bin/install -m 644 $(HEADER) $(INC_DIR)

# Clean up the generated library
clean:
	rm -f $(LIB)

# PHONY targets (targets that don't represent files)
.PHONY: all install clean
