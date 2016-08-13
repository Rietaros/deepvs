#Aries Fitriawan, 2016, Magister Ilmu Komputer, Universitas Indonesia
library(deepnet)

args <- commandArgs(trailingOnly=TRUE)

 
## Default setting jika tak ada argument
if(length(args) < 1) {
  args <- c("--help")
}
 
## Help section
if("--help" %in% args) {
  cat("
 
      Arguments:
      --arg1=someValue   - character, data testing
      --arg2=someValue   - character, data model
      --arg3=someValue   - character, output
      --help              - print help
 
      Example:
      ./testdbn.R 'input.csv' 'model.rData' 'output.csv' \n")
 
  q(save="no")
} else {

#fungsi utama
inputancsv <- args[1]
inputanmodel <- args[2]
outputfile <- args[3]
xtest <- read.csv(inputancsv)
xtest <- as.matrix(xtest)
modeldbn <- load(inputanmodel)
thismodel <- get(modeldbn)
hasil <- nn.predict(x=xtest, nn=thismodel)
write.table(hasil, file= outputfile, sep = ",") 
cat("Done")
q(save="no")
}