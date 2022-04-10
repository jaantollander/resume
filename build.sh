#!/usr/bin/env sh
. ./source.sh

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
    "$*"
elif test "$1" = "html"; then
    "$*"
else
    help
fi
