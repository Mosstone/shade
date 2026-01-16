#!/usr/bin/env make

# Variables
INSTALL   ?= install -m 755
PREFIX    ?= $(HOME)/.local
DESTDIR   ?=
DIRECT    := $(DESTDIR)$(PREFIX)

BINDIR    := $(DIRECT)/bin
LIBDIR    := $(DIRECT)/lib
SYSCONFDIR:= $(DIRECT)/etc
DATADIR   := $(DIRECT)/share
MANDIR    := $(DATADIR)/man

EXECDIR     := config
SRCCDIR     := prompt
TARBALL     := null # tarball.tar.gz
DISTDIR     := Application
COMMAND     := shade

.PHONY: all unpack link run clean

all: run






unpack:
# 	mkdir -p $(DISTDIR)
# 	tar -xzf $(TARBALL) -C $(DISTDIR)

#<	Source Files

#<	Nim
# 	cd $(DISTDIR) && \
# 		CC=musl-gcc nim c -d:release --opt:speed --mm:orc --passC:-flto --passL:-flto --passL:-static .nim

#<	Go
# 	cd $(DISTDIR)/src/ && \
# 		GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -ldflags='-s -w' .go

#<	Elixir
# 	cd $(DISTDIR)/src/.modules && \
# 		elixirc elixirtest.ex 2> /dev/null .ex

link: unpack

	@chmod +x $(EXECDIR)
	@chmod +x $(SRCCDIR)
	@mkdir -p $(PREFIX)/bin/
	@ln -sf $(CURDIR)/$(EXECDIR) $(PREFIX)/bin/$(COMMAND)
	@grep -qxF 'source ~/shade/prompt' ~/.bashrc || echo -e '\n# >>> Shade Initialize >>>\n\n# !! Contents within this block are managed by Shade !!\n\n#   Modifies the PS1 with output from Shade\n#   https://github.com/Mosstone/Shade\n\nsource ~/shade/prompt\n\n# <<< Shade Initialize <<<\n' >> ~/.bashrc

run: link

	$(COMMAND) --version

clean:
	rm $(PREFIX)/bin/$(COMMAND)
