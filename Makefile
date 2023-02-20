.PHONY: all
all: build/thesis.pdf

build/:
	mkdir -p build
CHAPTERS=$(shell find chapters "*.tex")
PDFLATEX_CMD=-pdflatex="pdflatex -interaction=nonstopmode"
build/thesis.pdf: main.tex $(PARTS) | build/
	latexmk -jobname=build/thesis -quiet -bibtex $(LIVE) -f -pdf -use-make $<

.PHONY: watch
watch: LIVE=-pvc
watch: build/thesis.pdf

.PHONY: clean
clean:
	rm -rf build