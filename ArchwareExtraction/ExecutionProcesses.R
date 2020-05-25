loadPath <- function(path){
  print("LOADED")
  return(path)
}
args = commandArgs(trailingOnly = TRUE)

#Initialize the path
extractPath <- ""
if(identical(args[1],"loadPath")){
  print("Path Loading...")
  extractPath <- loadPath(args[2])
}

#print(paste(c(extractPath,"extractVAprocess.R"),collapse=""),local=TRUE)
source(paste(c(extractPath,"recursiveVAprocess.R"),collapse=""),local=TRUE)
source(paste(c(extractPath,"extractVAprocess.R"),collapse=""),local=TRUE)
source(paste(c(extractPath,"ListDesignPatternRemaining.R"),collapse=""),local=TRUE)
source(paste(c(extractPath,"generateXML.R"),collapse=""),local=TRUE)

#Execute extractVA processus :
if(length(args) == 2){
  if(identical(args[1],"extractVA") && args[2] == "0"){
    recursiveVA(getwd(),0)
    print("Extraction options effects : Only display in the terminal.")
  }else if(identical(args[1],"extractVA") && args[2] == "1"){
    print("Extraction options effects : Write in CSV file.")
    recursiveVA(getwd(),1)
  }else if(identical(args[1],"extractVA") && args[2] == "2"){
    print("Extraction options effects : Display and write in CSV file.")
    recursiveVA(getwd(),2)
  }else if(identical(args[1],"extractVA") && args[2] == "3"){
    print("Permission denied : You are not allowed to use this option.")
  }
}else if(length(args) == 1){
  if(identical(args[1],"listAttackRemaining")){
    print("Creating a text file in your current work directory.")
    listAttackRemaining(getwd())
  }else if(identical(args[1],"generateXML")){
    print("Generating XML file in your current work directory.")
    generateXML(getwd())
  }else if(identical(args[1],"help")){

    print("Welcome on ARCHWARE EXTRACTION Assistance Program.")
    print("Functions :")
    print("-extractVA [0|1|2] : Launch extraction of vulnerability assets from CAPEC.")
    print("0 option would only display results on the screen.")
    print("1 only write the results into a CSV file.")
    print("2 does both actions, display the results on screen and write into a CSV file.")
    print("-listAttackRemaining is a function which creates a text file named ListUnextractedAttacks.txt, and contains all attack design pattern not already extracted.")
    print("-generateXML is a function which creates an XML named Hierarchy_Attck_Pattrn.xml, and contains an Archware made of modified hierarchy of attacks design patterns.")
  }
}else if(length(args) == 0){
  print("Type 'archwareExtract help' to know how to use these functions.")
}

#Execute listing of attack design pattern not yet extracted in a text file
#listAttackRemaining("D:/Documents/ARCHWARE/R")

#Generate a hierarchy of attack patterns extracted before as an XML file
#generateXML("D:/Documents/ARCHWARE/R")