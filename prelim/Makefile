.PHONY: all main.pdf

all:  main.pdf

main.pdf: main.tex main.bib
	pdflatex main
	bibtex main
	pdflatex main
	pdflatex main

clean:
	latexmk -C main
	rm main.bbl main.run.xml main-blx.bib Chapters/*.aux Appendices/*.aux
