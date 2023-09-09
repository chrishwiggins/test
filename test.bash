#!/bin/bash

ENGLISH_QUESTIONS=$1
MATH_QUESTIONS=$2

pdflatex "\def\englishquestions{$ENGLISH_QUESTIONS} \def\mathquestions{$MATH_QUESTIONS} \input{test.tex}"
