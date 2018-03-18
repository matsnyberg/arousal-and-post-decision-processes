
FILES = $(shell ls *.tex *.sty *.bib)
GENFILES = $(wildcard *.aux *.bbl *.dvi *.out *.fls *.fdb_latexmk *.xdv *.bcf *.blg *.fff *.log *.pdf *.run.xml *.ttt *.csv)
LATEX=xelatex
LATEXMK=latexmk



all: arousal.pdf arousal-manuscript.pdf

clean:
	rm $(GENFILES)



%.pdf : %.tex HeartMeans.csv MoodMeans.csv Consolidation.csv
	$(LATEX) $<
	biber $*.bcf
	$(LATEX) $<
	$(LATEX) $<


HeartMeans.csv: csv/HeartRateT.csv
	R/heartmeans.r

MoodMeans.csv: csv/MoodTableT.csv
	R/moodMeans.r

Consolidation.csv: csv/RawData.csv 
	R/consolidation.r
