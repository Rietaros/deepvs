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
      --arg1=someValue   - character, extracted feature of active compound data in csv
      --arg2=someValue   - character, extracted feature of decoys compound data in csv
      --arg3=someValue   - int, feature type, 1=PubChem Fingerprints, 2=Klekota-Roth Fingerprints
	  --arg4=someValue   - int, number of epochs
	  --arg5=someValue   - character, dbn model variable name
	  --arg6=someValue   - character, for output file name in rData type
	  
      --help             - print help
 
      Example:
      ./train_dbn.R 'active.csv' 'decoys.csv' 1 1000 'datamodel1.rData' \n")
 
  q(save="no")
} else {
fingertype <- args[3]
if (fingertype == 1){
	hidden1 <- 440
	}
else if (fingertype == 2){
	hidden1 <- 2430
	}
	activecsv <- args[1]
	decoycsv <- args[2]
	epochsnum <- args[4]
	outputname <- args[5]
	
x1 <- read.csv(activecsv)
x2 <- read.csv(decoycsv)
x1 <- as.matrix(x1)
x2 <- as.matrix(x2)
x <- rbind(x1, x2)
#assign label for data, 1 for active, 0 for decoy
y1 <- matrix(1, ncol=1, nrow=nrow(x1))
y2 <- matrix(0, ncol=1, nrow=nrow(x2))
y <- rbind(y1, y2)
#begin train dbn model
deepvs_model = dbn.dnn.train(x, y, hidden=c(hidden1, hidden1), numepochs=epochsnum, learningrate=0.1, cd=10);
save(deepvs_model, file=outputname)

cat("Done")
q(save="no")
}