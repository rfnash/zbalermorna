#!/bin/sh

# Check input specified
if [ -z "$1" ]; then
  echo "No input file given.";
  exit 1;
fi

# Options
INFILE="src/$1.sfd"
OUTFILE="output/$1.otf"
TESTDIR="test/font"

# Generate incorporating common feature file
echo ""
echo "Building font: $INFILE -> $OUTFILE"
echo ""

fontforge -lang=ff -script unicode.pe $1

# Copy generated file to update test page
echo ""
echo "Copying generated font to test dir: $OUTFILE -> $TESTDIR/$1.otf"
echo ""
cp $OUTFILE $TESTDIR
