#!/bin/bash

###############################################################################
# $OUTPUT_DIR: Where to write the compiled dissertation.
# $OUTPUT_NAME: The name of your document.
# $OUTPUT_FMT: The file format.
# $META_FILE: The path to the meta.yml frontmatter.
# $CONTENT: Which files go into building.
# $APPENDICES: --include-after-body=path commands
# $FILTERS: pandoc filters.
###############################################################################

###############################################################################
# This is for a draft page that conveys good information. If you are not 
# using git, the `BUILD_REVISION` is empty. 
###############################################################################

BUILD_DATE_TIME=`date -u +"%Y-%m-%dT%H:%M:%SZ"`
BUILD_REVISION=`git rev-parse --short HEAD`
BUILD_META="--variable build_date_time=$BUILD_DATE_TIME --variable commit=$BUILD_REVISION"

mkdir -p $OUTPUT_DIR

pandoc \
	$META_FILE $BUILD_META \
	--listings \
	$CONTENT $APPENDICES $FILTERS $EXTRAS \
	-s -o $OUTPUT_DIR/$OUTPUT_NAME.$OUTPUT_FMT
