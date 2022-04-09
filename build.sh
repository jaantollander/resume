#!/usr/bin/env sh
OUT_DIR=output
IN_DIR=markdown
STYLES_DIR=styles
FILTERS_DIR=filters
STYLE=chmduquesne

pdf() {
    mkdir -p "$OUT_DIR"

    for FILE in "$IN_DIR"/*.md; do
        # Extract filename from the markdown file.
        echo "Input: $FILE"
        BASENAME=$(basename "$FILE")
        FILENAME=${BASENAME%.md}

        # Use pandoc to create tex file.
        echo "Output: $OUT_DIR/$FILENAME.tex"
        pandoc "$FILE" \
            --standalone \
            --template "$STYLES_DIR/$STYLE.tex" \
            --from "markdown" \
            --to "context" \
            --variable "papersize=A4" \
            --output "$OUT_DIR/$FILENAME.tex" \
                > /dev/null

        # Create PDF file from tex file using context.
        echo "Output: $OUT_DIR/$FILENAME.pdf"
        mtxrun \
            --path="$OUT_DIR" \
            --result="$FILENAME.pdf" \
            --script context \
            "$FILENAME.tex" \
                > "$OUT_DIR/context_$FILENAME.log" 2>&1
    done
}

html() {
    mkdir -p "$OUT_DIR"

    for FILE in "$IN_DIR"/*.md; do
        # Extract filename from the markdown file.
        echo "Input: $FILE"
        BASENAME=$(basename "$FILE")
        FILENAME=${BASENAME%.md}

        echo "Output: $OUT_DIR/$FILENAME.html"
        pandoc "$FILE" \
            --standalone \
            --include-in-header "$STYLES_DIR/$STYLE.css" \
            --lua-filter="$FILTERS_DIR/pdc-links-target-blank.lua" \
            --from "markdown" \
            --to "html" \
            --output "$OUT_DIR/$FILENAME.html" \
            --metadata "pagetitle=$FILENAME"
    done
}

help() {
    echo "Build a resume of given type."
    echo ""
    echo "USAGE"
    echo "  ./build.sh <type>"
    echo ""
    echo "EXAMPLES"
    echo "  ./build.sh pdf"
    echo "  ./build.sh html"
}

if test "$1" = "pdf"; then
    $*
elif test "$1" = "html"; then
    $*
else
    help
fi
