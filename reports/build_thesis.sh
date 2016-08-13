#! /bin/bash

# Builds the thesis.tex file complete with bibliography.

# Convert all eps files to pdf

pdflatex thesis/thesis.tex
BIBINPUTS=bib bibtex thesis.aux
pdflatex thesis/thesis.tex
pdflatex thesis/thesis.tex
mv thesis.pdf 260218793_Esterer_Nicholas_Music_Technology_thesis.pdf
#dvipdf thesis.dvi
