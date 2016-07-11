all:  Avi.RPE.pdf

Avi.RPE.pdf: Avi.RPE.tex Avi.RPE.bib
	pdflatex Avi.RPE
	bibtex Avi.RPE
	pdflatex Avi.RPE
	pdflatex Avi.RPE

clean:
	latexmk -C Avi.RPE
	rm Avi.RPE.bbl Avi.RPE.run.xml Avi.RPE-blx.bib Chapters/*.aux Appendices/*.aux
