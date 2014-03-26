#======================================================================
# Re-make lecture materials.
#======================================================================

SITE = _site
INSTALL = $(HOME)/sites/software-carpentry.org/v5
LINKS = /tmp/bc-links
CACHED = .
INDEX = $(SITE)/index.html
CONFIG = _config.yml

all : commands

EXTRAS = \
	$(wildcard css/*.css) \
	$(wildcard css/*/*.css)

SRC = \
	index.html \
	LICENSE.md

$(INDEX) : $(SRC)
	jekyll -t build -d $(SITE)

## commands : show all commands.
commands :
	@grep -E '^##' Makefile | sed -e 's/## //g'

## site     : build the site as GitHub will see it.
site : $(INDEX)

## clean    : clean up all generated files.
clean : tidy
	rm -rf $(SITE)

## tidy     : clean up odds and ends.
tidy :
	rm -rf $$(find . -name '*~' -print)
