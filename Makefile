
FILES = $(shell ls *.tex *.sty *.bib)
GENFILES = $(wildcard *.aux *.bbl *.bcf *.blg *.fff *.log *.pdf *.run.xml *.ttt)
LATEX=pdflatex




all: arousal.pdf arousal-manuscript.pdf

clean:
	rm $(GENFILES)



%.pdf : %.tex HeartMeans.csv MoodMeans.csv
	$(LATEX) $<
	biber $*.bcf
	$(LATEX) $<
	$(LATEX) $<


HeartMeans.csv: csv/HeartRateT.csv
	R/heartmeans.r

MoodMeans.csv: csv/MoodTableT.csv
	R/moodMeans.r
