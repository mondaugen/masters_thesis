#! /bin/bash

# Builds the thesis.tex file complete with bibliography.

# Convert all eps files to pdf

pdflatex thesis/thesis.tex
BIBINPUTS=bib bibtex thesis.aux
pdflatex thesis/thesis.tex
pdflatex thesis/thesis.tex
#dvipdf thesis.dvi
