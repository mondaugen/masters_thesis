#! /bin/bash

# Builds the thesis.tex file complete with bibliography.

latex thesis/thesis.tex
BIBINPUTS=bib bibtex thesis.aux
latex thesis/thesis.tex
latex thesis/thesis.tex
