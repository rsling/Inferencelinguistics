#!/bin/bash

set -e

p="$(pdfinfo ${1} | grep Pages | sed 's/[^0-9]*//' | xargs)"
cp=$(gs -o - -sDEVICE=inkcov ${1} | grep 'CMYK OK' | grep -v '0.00000  0.00000  0.00000' | wc -l | xargs)

price=$(bc <<< "scale=0; (((300 + ${p}*7 + ${cp}*20)/500)+1)*5")

echo -e "\nThe file ${1} has ${p} pages, ${cp} of them in colour."
echo -e "Language Science Press will price it at ${price}€.\n"
