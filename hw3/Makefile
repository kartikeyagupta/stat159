REPrmd = report/report.rmd
REPpdf = report/report.pdf
REGdata = data/regression.RData
IMAGES = images/*.png
DATA = data/Advertising.csv
REGscript = code/regression-script.R



.phony: all data clean

all: $(REPpdf) data/eda-output.txt $(REGdata)

$(REPpdf): $(REPrmd) $(REGdata) $(IMAGES)
	Rscript -e "library(rmarkdown);render('$(REPrmd)')"

$(REGdata): $(REGscript) $(DATA)
	Rscript $(REGscript) $(DATA)

data/eda-output.txt: code/eda-script.R $(DATA)
	Rscript code/eda-script.r $(DATA)

data:
	curl http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv > $(DATA)

tests:
	Rscript code/test-that.r
	
clean: 
	rm report/report.pdf