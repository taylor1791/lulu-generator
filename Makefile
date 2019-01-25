SOURCE?=""

.PHONY : clean all

all: cover.pdf middle.pdf

clean:
	-rm *.pdf

cover.pdf: cover-page.pdf
	pdfjam -o cover.pdf \
		--papersize '{17.25in,11.25in}' \
		--noautoscale true \
		--nup 2x1 \
		cover-page.pdf '{},1'
	pdfinfo $@

cover-page.pdf:
	pdftk $(SOURCE) cat 1 output $@

middle.pdf:
	pdftk $(SOURCE) cat 2-end output $@
