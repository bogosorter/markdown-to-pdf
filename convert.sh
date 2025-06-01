#!/bin/bash

# Check arguments
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <input.md> <output.pdf>"
  exit 1
fi

INPUT_MD="$1"
OUTPUT_PDF="$2"
TEMP_HTML="temp_$(basename "$INPUT_MD" .md).html"

# Convert markdown to HTML
pandoc "$INPUT_MD" -o "$TEMP_HTML" --template=template.html --self-contained

# Convert HTML to PDF
wkhtmltopdf "$TEMP_HTML" "$OUTPUT_PDF"

# Clean up
rm "$TEMP_HTML"
