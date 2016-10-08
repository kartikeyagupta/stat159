.phony: all data clean

all: report/report.pdf data/eda-output.txt data/regression.RData

report/report.pdf: report/report.rmd data/regression.RData images/scatterplot-tv-sales.png
	Rscript -e "library(rmarkdown);render('report/report.rmd')" images/scatterplot-tv-sales.png

data/regression.RData: code/regression-script.R data/Advertising.csv
	Rscript code/regression-script.R data/Advertising.csv

data/eda-output.txt: code/eda-script.R data/Advertising.csv
	Rscript code/eda-script.r data/Advertising.csv

data:
	curl http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv > data/Advertising.csv

clean: 
	rm report/report.pdf