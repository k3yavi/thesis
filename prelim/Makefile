ALL = main.pdf
TEXFILES = main
STYFILES =
CLSFILES = main
FIGURES =
LATEXMKOPTS = -pdf -dvi-
LATEX = pdflatex
BIBFILES = main

########### Shouldn't require configuration below here ##########

# run "make CONT=1" for continuous compilation
ifdef CONT
	LATEXMKOPTS += -pvc
	FORCED = .PHONY
endif

all: $(ALL)

zip: all
	rm -rf Patro.193.tgz
	tar cvzf Patro.193.tgz \
		Patro.193.lett.pdf \
		$(ALL) \
		Patro.193.tex \
		$(BIBFILES:=.bib) \
		figs/Patro.193.fig.1.pdf  figs/Patro.193.fig.3.png  figs/Patro.193.fig.4b.pdf figs/Patro.193.fig.4d.pdf figs/Patro.193.fig.4f.pdf figs/Patro.193.fig.5b.pdf \
		figs/Patro.193.fig.2.pdf  figs/Patro.193.fig.4a.pdf figs/Patro.193.fig.4c.pdf figs/Patro.193.fig.4e.pdf figs/Patro.193.fig.5a.pdf

$(ALL): $(TEXFILES:=.tex) $(STYFILES:=.sty) $(CLSFILES:=.cls) $(FIGURES) $(BIBFILES:=.bib)



# How to compile a .tex file to a .pdf file
%.pdf: %.tex $(FORCED)
	@if (command -v latexmk > /dev/null) ; then latexmk $(LATEXMKOPTS) $< ; \
	else $(LATEX) $<; bibtex $@; $(LATEX) $<; $(LATEX) $<; fi

#
# Rules for converting various figure formats to pdf
#

%.pdf_tex: %.svg
	inkscape -A $(@:.pdf_tex=.pdf) --export-latex $<

%.pdf: %.svg
	inkscape -A $@ $<

%.pdf: %.dia
	dia --nosplash -e $(@:.pdf=.eps) $(@:.pdf=.dia)
	epstopdf $(@:.pdf=.eps)

%.pdf: %.fig
	fig2dev -L pdftex $< $@

%.pdf_t: %.fig %.pdf
	fig2dev -L pdftex_t -p $(@:.pdf_t=.pdf) $< $@

%.pstex_t: %.fig
	fig2dev -L pstex_t -p $(@:.pstex_t=.pstex) $< $@
	fig2dev -L pstex $< $(@:.pstex_t=.pstex)

.PHONY:

clean:
	latexmk -CA
	rm main-blx.bib  xmain.run.xml main.bbl
