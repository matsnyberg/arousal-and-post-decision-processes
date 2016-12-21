
FILES = $(shell ls *.tex *.sty *.bib)
GENFILES = $(wildcard *.aux *.bbl *.bcf *.blg *.fff *.log *.pdf *.run.xml *.ttt)





all: arousal.pdf arousal-manuscript.pdf

clean:
	rm $(GENFILES)



%.pdf : %.tex HeartMeans.csv MoodMeans.csv
	pdflatex $<
	biber $*.bcf
	pdflatex $<
	pdflatex $<


HeartMeans.csv: csv/HeartRateT.csv
	R/heartmeans.r

MoodMeans.csv: csv/MoodTableT.csv
	R/moodMeans.r
