# Colors: https://wiki.contextgarden.net/Color
# Latex templates: https://www.latextemplates.com/
# Paper sizes: https://wiki.contextgarden.net/Paper_sizes

# General headers, should be added before specific headers
HEADERS := $(wildcard headers/*.tex)
# Specific headers for print
HEADERS_PRINT := $(wildcard headers/print/*.tex)
# Specific headers for digital
HEADERS_DIG := $(wildcard headers/digital/*.tex)

LUA_FILTERS := $(wildcard filters/*.lua)
HIGHLIGHT_ARGS = --syntax-highlighting=$(HIGHLIGHT) $(addprefix --syntax-definition=,$(wildcard highlight/*.xml))
COVER_IMAGE := images/color/book_cover.jpg
HIGHLIGHT := highlight/pygments.theme
CSS_FILE = styles.css
HTML_CSS_FILE = styles_html.css

# Files
CHAPTERS := $(wildcard chapters/*.md)
EXERCISES := $(wildcard exercises/book/*.md)

# Directory
OUTPUT := output

# ARGS
ARGS = --from=markdown \
		--toc \
		--toc-depth=4 \
		--top-level-division=part \
		--lua-filter=filters/include-files.lua \
		--lua-filter=filters/new_command.lua \
		--lua-filter=filters/list_table.lua \
		--lua-filter=filters/not_in_format.lua \
		--lua-filter=filters/pagebreak.lua \
		--lua-filter=filters/image_path.lua \
		--metadata-file=metadata.yml

# see https://pandoc.org/MANUAL.html#variables-for-html
HTML_ARGS = $(ARGS) \
			$(HIGHLIGHT_ARGS) \
			-M image_dir:images/bw/ \
			--lua-filter=filters/cursor_html.lua \
			--lua-filter=filters/index.lua \
			--lua-filter=filters/align.lua \
			--css=$(HTML_CSS_FILE) \
			--template template/default \
			--embed-resources \
			--standalone \
			--top-level-division=chapter \
			-V endnotes


LATEX_ARGS = $(ARGS) \
			--lua-filter=filters/align.lua \
			--lua-filter=filters/minted.lua \
			--lua-filter=filters/latex_environment.lua \
			--lua-filter=filters/needspace.lua \
			--to latex \
			-V monofont="Inconsolata" \
			-V titlepage \
			-V copyrightpage \
			--syntax-highlighting=none \
			--template template/default \
			$(addprefix --include-in-header=,$(HEADERS))

PDF_ARGS = $(LATEX_ARGS) \
			   -V digitalmode \
			   -V coverimage=$(COVER_IMAGE) \
			   -V mainfont="Merriweather" \
			   -V sansfont="Merriweather Sans" \
			   -V geometry:"margin=1in" \
			   -V fontsize=11pt \
			   -V linestretch=1.15 \
			   -V documentclass=book \
			   -V classoption=oneside \
			   -V geometry="a4paper, top=2cm, bottom=2.5cm, left=2.5cm, right=2.5cm" \
			   -V colorlinks \
			   -V linkcolor=linkblue \
			   -V urlcolor=urlblue \
			   -V citecolor=urlblue \
			   -M table-left-margin=12.75pt \
			   -M table-left-margin-1=27.75pt \
			   -M table-left-margin-2=52.75pt \
			   $(addprefix --include-in-header=,$(HEADERS_DIG))

PRINT_ARGS = $(LATEX_ARGS) \
			-M image_dir:images/bw/ \
			-V mainfont="EB Garamond" \
			-V sansfont="Alegreya Sans" \
			-M skip-includes=false \
			-V linestretch=1.05  \
			-V printmode \
			-V geometry:"paperwidth=178mm, paperheight=254mm, inner=0.75in, outer=0.5in, top=0.5in, bottom=0.5in" \
			-V fontsize=10pt \
			-V pdfa=1a:2001 \
			-V documentclass=scrbook \
			-V headings=small \
			--lua-filter=filters/footnote_link.lua \
			-M table-left-margin=12.75pt \
			-M table-left-margin-1=24.75pt \
			-M table-left-margin-2=48.75pt \
			$(addprefix --include-in-header=,$(HEADERS_PRINT))
			# -V links-as-notes
			# -F filters/footnotify.py

PDF_ARGS_NO_SOLUTION = $(PDF_ARGS) \
					    -V nosolution

PRINT_ARGS_NO_SOLUTION = $(PRINT_ARGS) \
					      -V nosolution

HTML_ARGS_NO_SOLUTION = $(HTML_ARGS) \
					      -V nosolution

# Without digitalmode variable
EXERCISES_ARGS = $(PDF_ARGS) \
			-V exercises

# Targets

.PHONY: phony all build

all: $(OUTPUT) book.pdf print.pdf style.pdf style.epub book.epub book.html booknosol.pdf booknosol.epub printnosol.pdf

$(OUTPUT):
	@mkdir -p ./$(OUTPUT)

final:
	@mkdir -p final/separate_solutions

open-%.pdf: phony
	zathura $(OUTPUT)/$*.pdf &

open-%.epub: phony
	MESA_LOADER_DRIVER_OVERRIDE="llvmpipe" ebook-viewer $(OUTPUT)/$*.epub &

open-%.tex: phony
	nvim $(OUTPUT)/$*.tex &

# Seems that it doesn't really search
# for existing blocs for internal links;
# For that use okular on the epub instead...
check-%.epub: phony
	epubcheck $(OUTPUT)/$*.epub

# Target specific variables
book.tex booknosol.tex print.tex printnosol.tex book.html book.epub booknosol.html booknosol.epub: FILES := $(CHAPTERS)
exercises.tex: FILES := chapters/000_headers.md $(EXERCISES)
style.tex: FILES := chapters/000_headers.md styleguide/styles.md
# Minted can compile for a long time, this allow compiling only one chapter.
# For example: `make chapter=chapters/060_rank_iii.md chapter.{pdf,epub} chapter-print.{pdf,epub}`
#
# See vimrc in this project for the Vim mapping
chapter.tex chapter-print.tex chapter.html chapter-print.html: FILES := chapters/000_headers.md $(chapter)

book.tex style.tex chapter.tex: ARGS := $(PDF_ARGS)
booknosol.tex: ARGS := $(PDF_ARGS_NO_SOLUTION)
exercises.tex: ARGS := $(EXERCISES_ARGS)

print.tex chapter-print.tex: ARGS := $(PRINT_ARGS)
printnosol.tex: ARGS := $(PRINT_ARGS_NO_SOLUTION)

booknosol.epub: ARGS := $(HTML_ARGS_NO_SOLUTION)

%.tex: Makefile $(FILES) $(EXERCISES) $(COVER_IMAGE) $(LUA_FILTERS) | $(OUTPUT)
	pandoc $(FILES) $(ARGS) -o $(OUTPUT)/$@

%.pdf: Makefile %.tex | $(OUTPUT)
	@cp -r fonts $(OUTPUT)/fonts
	FONTCONFIG_FILE=$(abspath fonts/fonts.conf) latexmk -output-directory=$(OUTPUT) -xelatex -shell-escape -pdfxe -jobname=$* $*.tex
	awk '/^(LaTeX (Font )?(Warning|Error)|Package .* (Warning|Error)|! )/{p=1} p&&/^$$/{p=0} p' $(OUTPUT)/$*.log > output/warnings.txt



%.html: Makefile $(FILES) $(EXERCISES) $(LUA_FILTERS) | $(OUTPUT)
	pandoc $(FILES) $(HTML_ARGS) -s -o $(OUTPUT)/$@

%.epub: Makefile %.html $(CSS_FILE) $(COVER_IMAGE) | $(OUTPUT)
	FONTCONFIG_FILE=$(abspath fonts/fonts.conf)  ebook-convert $(OUTPUT)/$*.html \
	$(OUTPUT)/$@ \
	--embed-all-fonts \
	--extra-css $(CSS_FILE) \
	--cover $(COVER_IMAGE) \
	--level1-toc //h:h1 --level2-toc //h:h2 --level3-toc //h:h3

clean: phony
	@find $(OUTPUT) -type f ! -iname "*.pdf" -delete
	@rm -rf $(OUTPUT)/_minted*
	@rm -rf final
	@echo "$(OUTPUT) cleaned"

wipe: phony
	@rm -rf $(OUTPUT)/*
	@echo "$(OUTPUT) nuked"

# Zip files have the "final" directory in it. Shouldn't be the case
build: clean book.epub book.pdf booknosol.pdf booknosol.epub exercises.pdf | final
	@echo "Copy files to build directory..."
	@cp $(OUTPUT)/book.epub final/learning_to_play_vim.epub
	@cp $(OUTPUT)/book.pdf final/learning_to_play_vim.pdf
	@cp $(OUTPUT)/booknosol.epub final/separate_solutions/learning_to_play_vim.epub
	@cp $(OUTPUT)/booknosol.pdf final/separate_solutions/learning_to_play_vim.pdf
	@cp $(OUTPUT)/exercises.pdf final/separate_solutions/solutions.pdf
	@echo "Create the zip..."
	@cd final && zip -r ../build/learning_to_play_vim.zip . && cd ..
	@echo "Create the archive..."
	@cp build/learning_to_play_vim.zip build/archives/$(shell date "+%Y%m%d%H%M")_learning_to_play_vim.zip
	@echo "build done"
