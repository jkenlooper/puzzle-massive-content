MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := all
.DELETE_ON_ERROR:
.SUFFIXES:

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
project_dir := $(dir $(mkfile_path))

# Set to development or production
ENVIRONMENT := development

# Set to tmp/ when debugging the install
# make PATH_TO_PUZZLEMASSIVE_PROJECT_DIR=tmp/ install
PATH_TO_PUZZLEMASSIVE_PROJECT_DIR := ../

# For debugging what is set in variables
inspect.%:
	@echo $($*)

# Always run.  Useful when target is like targetname.% .
# Use $* to get the stem
FORCE:

emoji_list := $(patsubst emoji_list/%.txt, .emoji_list.%.txt, $(wildcard emoji_list/*.txt))

.emoji_list.%.txt : emoji_list/%.txt
	./create-text-bit-icons-from-list.sh $< emoji_$*
	touch $@

.text_list.txt : text-list.txt
	./create-text-bit-icons-from-list.sh $< text
	touch $@

objects := $(emoji_list) .text_list.txt

######

.PHONY: all
all: $(objects)

.PHONY: install
install:
	./create-links-in-parent-dir.sh $(PATH_TO_PUZZLEMASSIVE_PROJECT_DIR)

# Remove any created files in the src directory which were created by the
# `make all` recipe.
.PHONY: clean
clean:
	echo $(objects) | xargs rm -f

# Remove files placed outside of project directory
.PHONY: uninstall
uninstall:
	./remove-links-in-parent-dir.sh $(PATH_TO_PUZZLEMASSIVE_PROJECT_DIR)
