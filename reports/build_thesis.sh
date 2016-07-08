#! /bin/bash

# Builds the thesis.tex file complete with bibliography.

pdflatex thesis/thesis.tex
BIBINPUTS=bib bibtex thesis.aux
pdflatex thesis/thesis.tex
pdflatex thesis/thesis.tex
#dvipdf thesis.dvi
