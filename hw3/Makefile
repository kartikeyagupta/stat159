REPrmd = report/report.rmd
REPpdf = report/report.pdf
REGdata = data/regression.RData
IMAGES = images/*.png
DATA = data/Advertising.csv
REGscript = code/scripts/regression-script.R
EDAscript = code/scripts/eda-script.R
EDAtext = data/eda-output.txt


.phony: all data clean cleanall

all: $(EDAtext) $(REPpdf) $(REGdata) 

$(EDAtext): $(EDAscript) $(DATA)
	Rscript $(EDAscript) $(DATA)
	
$(REPpdf): $(REPrmd) $(REGdata) $(IMAGES) $(EDAtext)
	Rscript -e "library(rmarkdown);render('$(REPrmd)')"

$(REGdata): $(REGscript) $(DATA)
	Rscript $(REGscript) $(DATA)

data:
	curl http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv > $(DATA)

tests:
	Rscript code/test-that.r
	
clean: 
	rm $(REPpdf)

cleanall:
	rm -rf $(REPpdf)
	rm -rf $(IMAGES)
	rm -rf data/*.RData
	rm -rf $(EDAtext)