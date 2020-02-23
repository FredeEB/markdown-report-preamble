SOURCEFILES := *.md
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

$(OUTFILE): $(SOURCEFILES) $(ASSETDIR)/preamble.yml
	pandoc $(addprefix -F, $(FILTERS)) $(ASSETDIR)/preamble.yml $(SOURCEFILES) -o $(OUTFILE) $(addprefix --, $(FLAGS))
