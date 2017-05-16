.PHONY: image
image:
	docker build -t generativist/gmu_pandoc_phd .	

.PHONY: pdf
pdf:
	docker run \
		-e CONTENT=chapters/example.md \
		-e EXTRAS="--template=/gmu/template/gmu_thesis.tex" \
		-e APPENDICES=--include-after-body=appendices/appendix.md \
		-v `pwd`:/src --rm -it generativist/gmu_pandoc_phd

# Useful for debugging.
.PHONY: tex 
tex:
	docker run \
		-e OUTPUT_FMT=tex \
		-e CONTENT=chapters/example.md \
		-e EXTRAS="--template=/gmu/template/gmu_thesis.tex" \
		-v `pwd`:/src --rm -it generativist/gmu_pandoc_phd

.PHONY: html 
html:
	docker run \
		-e CONTENT=chapters/example.md \
		-e OUTPUT_FMT=html \
		-v `pwd`:/src --rm -it generativist/gmu_pandoc_phd

