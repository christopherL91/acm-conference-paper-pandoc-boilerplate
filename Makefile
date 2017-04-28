ID = $(shell git rev-parse --short HEAD)
TARGET = $(shell date +%d.%m.%Y)-$(ID)-report
SRC = src/introduction.md \
	  src/background.md \
	  src/methodology.md \
	  src/findings.md \
	  src/conclusions.md
TARGETDIR = build
PDFOPTIONS = --template proceedings.tex \
			 --filter pandoc-citeproc \
			 --bibliography citations.bib \
			 --csl acm-sigchi-proceedings.csl
all: pdf
	@echo "Done!"

pdf: $(TARGETDIR)
	pandoc $(SRC) -o $(TARGETDIR)/$(TARGET).pdf $(PDFOPTIONS)

.PHONY: clean
clean:
	rm -f $(TARGETDIR)/*.pdf

rebuild: clean all
