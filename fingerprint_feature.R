Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_77')
library(rJava)
library(rcdk)

fingerprintkr <- function(file1, file2)
{
  data3 <- readLines(file1)
  mols1 <- parse.smiles(data3)
  bit<-NA
  for(i in 1:length(mols1))
  {
    fp1 <- get.fingerprint(mols1[[i]], type='kr', fp.mode='bit')
    bit[i] <- as.character(fp1)
  }
  bit1<-as.matrix(bit)
  n<-strsplit(bit1,"")
  hasilbit<-matrix(nrow=nrow(bit1),ncol=4860,NA)
  for( i in 1:nrow(bit1))
  {
    a<-n[[i]]
    hasilbit[i,]<-t(as.matrix(as.numeric(a)))
  }
  write.table(hasilbit, file= file2, sep = ",") 
}

fingerprintpc <- function(file1, file2)
{
  data3 <- readLines(file1)
  mols1 <- parse.smiles(data3)
  bit<-NA
  for(i in 1:length(mols1))
  {
    fp1 <- get.fingerprint(mols1[[i]], type='pubchem', fp.mode='bit')
    bit[i] <- as.character(fp1)
  }
  bit1<-as.matrix(bit)
  n<-strsplit(bit1,"")
  hasilbit<-matrix(nrow=nrow(bit1),ncol=881,NA)
  for( i in 1:nrow(bit1))
  {
    a<-n[[i]]
    hasilbit[i,]<-t(as.matrix(as.numeric(a)))
  }
  write.table(hasilbit, file= file2, sep = ",") 
}

args <- commandArgs(trailingOnly=TRUE)


##Collect arguments


## Default setting when no arguments passed
if(length(args) < 1) {
  args <- c("--help")
}

## Help section
if("--help" %in% args) {
  cat("
      The R Script
      
      Arguments:
      --arg1=someValue   - input smiles
      --arg2=someValue   - output name
      --numeric         - type of fingerprint 1=PubChem, 2=Klekota-Roth
      --help            - print this text
      
      Example:
      ./test1.R 'input.smi/input.txt' 'fingerprint.csv' \n")
 
  q(save="no")
} else {
  inputsmi <- args[1]
  outputcsv <- args[2]
  fingerprinttype <- args[3]
  
  if(fingerprinttype ==1){
    fingerprintpc(inputsmi, outputcsv)
  }
  else{
    fingerprintkr(inputsmi, outputcsv)
  }

cat("Done")
q(save="no")
}