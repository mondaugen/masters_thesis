#! /bin/bash

# Builds the thesis.tex file quickly for checking syntax

latex thesis/thesis.tex
dvipdf thesis.dvi
