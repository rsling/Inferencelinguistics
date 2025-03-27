#!/bin/bash

p="$(gs -o - -sDEVICE=inkcov main.pdf | grep 'CMYK OK' | wc -l | xargs)"
cp=$(gs -o - -sDEVICE=inkcov main.pdf | grep 'CMYK OK' | grep -v '0.00000  0.00000  0.00000' | wc -l | xargs)

price=$(bc <<< "scale=2; ((300 + ${p}*7 + ${cp}*20)/(500+1))*5")

echo -e "\n********************************************************************************\n"
echo "This book has ${p} pages, ${cp} of them in color."
echo "This book will be priced at ${price} €."
echo -e "\n********************************************************************************\n"
