#!/usr/bin/env make

# Variables
PREFIX    ?= $(HOME)/.local

EXECDIR     := config
SRCCDIR     := prompt
COMMAND     := shade

.PHONY: all link run uninstall

all: run






link: unpack

	@chmod +x $(EXECDIR)
	@chmod +x $(SRCCDIR)
	@mkdir -p $(PREFIX)/bin/
	@ln -sf $(CURDIR)/$(EXECDIR) $(PREFIX)/bin/$(COMMAND)
	@grep -qxF 'source ~/shade/prompt' ~/.bashrc || echo -e '\n# >>> Shade Initialize >>>\n\n# !! Contents within this block are managed by Shade !!\n\n#   Modifies the PS1 with output from Shade\n#   https://github.com/Mosstone/Shade\n\nsource ~/shade/prompt\n\n# <<< Shade Initialize <<<\n' >> ~/.bashrc

run: link

	$(COMMAND) --version
	@echo -e "\e[34m    Source ~/.bashrc or open a new terminal for changes to take effect\e[0m"
	@source ~/.bashrc

uninstall:
	@sed -i '/# >>> Shade Initialize >>>/,/# <<< Shade Initialize <<</d' ~/.bashrc && echo "Removed from ~/.bashrc" || echo "Not found in ~/.bashrc"
	rm $(PREFIX)/bin/$(COMMAND)
