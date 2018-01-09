#!/bin/bash

set -v 
set -e

mkdir test_dir
cd test_dir
docker run --rm -v $PWD:/src generativist/gmu_pandoc_phd:latest bootstrap.sh

mkdir chapters
echo "Hello, World" >> chapters/example.md
mkdir appendices
echo "Hello" >> appendices/appendix.md
touch bibliography.bibtex

mv Makefile.example Makefile
mv meta.yaml.example meta.yaml

git init .
git add .
git commit -m 'My dissertation'

make pdf

cd ..
