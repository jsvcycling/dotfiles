SHELL := bash

.PHONY: all configs scripts

all: configs scripts

configs:
	@printf "Linking configuration files..."
	@for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git" -not -name ".*.swp" -not -name ".gnupg"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done;
	@for dir in $(shell find $(CURDIR)/.config -type d); do \
		d=$$(basename $$dir); \
		ln -sfn $$dir $(HOME)/.config/$$d; \
	done;
	@git update-index --skip-worktree $(CURDIR)/.gitconfig;
	@printf "Done.\n"

scripts:
	@printf "Linking custom scripts..."
	@for file in $(shell find $(CURDIR)/bin -not -name "bin"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/.local/bin/$$f; \
	done;
	@printf "Done.\n"
