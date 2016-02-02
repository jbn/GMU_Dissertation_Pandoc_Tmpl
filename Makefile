OUTPUT_NAME=can_i_haz_phd
OUTPUT_DIR=target/
DROPBOX_DIR=~/Dropbox/PHD_CI/

# This is for a draft page that conveys good information. If you are not 
# using git, the `BUILD_REVISION` is empty. 
BUILD_DATE_TIME=`date -u +"%Y-%m-%dT%H:%M:%SZ"`
BUILD_REVISION=`git rev-parse --short HEAD`
BUILD_META=--variable build_date_time=$(BUILD_DATE_TIME) --variable commit=$(BUILD_REVISION)

CONTENT=chapters/*.md
APPENDICES=--include-after-body=appendices/appendix.md
FILTERS=--filter=./pandoc-svg.py --filter pandoc-citeproc

# Notice: I ammend the TEXINPUTS so that the `sty` file doesn't have to be
# a sibling file relative to root. This may break some versions of latex,
# I think...
.PHONY: pdf
pdf: $(CONTENT)
	@mkdir -p $(OUTPUT_DIR)

	TEXINPUTS=$(TEXINPUTS):./template pandoc meta.yaml $(BUILD_META) --template=template/gmu_thesis.tex $(CONTENT) $(APPENDICES) $(FILTERS) --smart -s -o $(OUTPUT_DIR)$(OUTPUT_NAME).pdf

# Useful for debugging.
.PHONY: tex 
tex: $(CONTENT)
	@mkdir -p $(OUTPUT_DIR)

	TEXINPUTS=$(TEXINPUTS):./template pandoc meta.yaml $(BUILD_META) --template=template/gmu_thesis.tex $(CONTENT) $(APPENDICES) $(FILTERS) --smart -s -o $(OUTPUT_DIR)$(OUTPUT_NAME).tex

.PHONY: distribute
distribute: pdf
	cp $(OUTPUT_DIR)$(OUTPUT_NAME).pdf $(DROPBOX_DIR)$(OUTPUT_NAME).pdf
