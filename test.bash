#!/bin/bash

# Check if no arguments are provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 LANGUAGE_ARTS_QUESTIONS MATHEMATICS_QUESTIONS [OUTPUT_FILE_NAME]"
    exit 1
fi

# Check if less than two arguments are provided
if [ $# -lt 2 ]; then
    echo "Error: Missing arguments. Please provide at least two arguments."
    echo "Usage: $0 LANGUAGE_ARTS_QUESTIONS MATHEMATICS_QUESTIONS [OUTPUT_FILE_NAME]"
    exit 1
fi

LANGUAGE_ARTS_QUESTIONS=$1
MATHEMATICS_QUESTIONS=$2

# Compile the LaTeX document
pdflatex "\def\englishquestions{$LANGUAGE_ARTS_QUESTIONS} \def\mathquestions{$MATHEMATICS_QUESTIONS} \input{test.tex}"

# Check if a third argument is provided for the output file name
if [ $# -eq 3 ]; then
    OUTPUT_FILE_NAME=$3
    # Rename the output PDF file if test.pdf exists
    if [ -f "test.pdf" ]; then
        mv "test.pdf" "${OUTPUT_FILE_NAME}.pdf"
    else
        echo "Error: test.pdf not found."
    fi
fi
