ASSETDIR = assets
FILTERS = pandoc-crossref pandoc-citeproc
OUTFILE = out.pdf
FLAGS =

.PHONY = all clean open
open: all
	xdg-open $(OUTFILE)

all: $(OUTFILE)

clean:
	rm -rf $(OUTFILE)

$(OUTFILE): *.md
	pandoc $(addprefix -F, $(FILTERS)) -H $(ASSETDIR)/header.tex $(ASSETDIR)/preamble.yml *.md -o $(OUTFILE) $(addprefix --, $(FLAGS))
