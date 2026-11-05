RESUMES := resume
PDFS := $(addsuffix .pdf,$(RESUMES))
TEXTS := $(addsuffix .txt,$(RESUMES))
LATEX := xelatex
FONTS := $(wildcard fonts/*.otf)
LATEXFLAGS := -interaction=nonstopmode -halt-on-error -file-line-error
PDFTOTEXT := pdftotext

.PHONY: all text clean
all: $(PDFS)

$(PDFS): %.pdf: %.tex resume-common.tex $(FONTS) Makefile
	mkdir -p build
	$(LATEX) $(LATEXFLAGS) -output-directory=build $<
	$(LATEX) $(LATEXFLAGS) -output-directory=build $<
	cp build/$@ $@

# Optional plain-text copies for application forms and extraction checks.
text: $(TEXTS)

$(TEXTS): %.txt: %.pdf Makefile
	$(PDFTOTEXT) -enc UTF-8 -nopgbrk $< $@
	# Remove the trailing blank line added by pdftotext.
	sed -i '$${/^$$/d;}' $@

# Keep the finished PDFs; remove only reproducible LaTeX build files.
clean:
	rm -rf build
