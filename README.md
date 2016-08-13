# deepvs
Deep Learning Approaches with Molecular Fingerprint features for Ligand Based Virtual Scrrening

Develop using R Language Programming



Prerequisite:
- RCDK Package for R
  download link : https://cran.rstudio.com/web/packages/rcdk/
- Deepnet Package for R
  download link : https://cran.r-project.org/web/packages/deepnet/index.html


 
 

1. fingerprint_feature.R
Use to extract the feature from SMILES file. Feature extraction are done based on Klekota-Roth or PubChem fingerprints.

      Arguments:
      
      --arg1=someValue   - input smiles
      
      --arg2=someValue   - output name
      
      --numeric         - type of fingerprint 1=PubChem, 2=Klekota-Roth
      
      --help            - print this text
      
      Example:
      
      ./fingerprint_feature.R 'input.smi/input.txt' 'fingerprint.csv' 1
 
  
  

2. testdbn.R
Use to test a set of compound to begin the virtual screening.
 
      Arguments:

      --arg1=someValue   - character, data testing
      
      --arg2=someValue   - character, data model
      
      --arg3=someValue   - character, output
      
      --help              - print help
      
      
      Example:
      ./testdbn.R 'input.csv' 'model.rData' 'output.csv'

(**A set of input compounds must be extracted first)

(***Model is output from training process)
