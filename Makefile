SHELL := bash

.PHONY: all configs scripts

all: configs scripts

configs:
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git" -not -name ".*.swp" -not -name ".gnupg"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done; \
	git update-index --skip-worktree $(CURDIR)/.gitconfig;

scripts:
	for file in $(shell find $(CURDIR)/bin); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/.local/bin/$$f; \
	done; \
