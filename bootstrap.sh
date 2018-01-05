#!/bin/bash

set -e
set -v

# Copy the template files.
mkdir /src/template
cp -r /gmu/template /src/template

# Copy the meta.yaml file
cp /gmu/meta.yaml.example /src/
cp /gmu/Makefile.example /src/Makefile.example
