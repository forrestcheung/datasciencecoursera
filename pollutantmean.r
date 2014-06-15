pollutantmean <- function(directory, pollutant, id = 1:332) {    
    #filelist<-list.files(path=directory, pattern = NULL, all.files = FALSE, full.names = TRUE,recursive = FALSE,ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)
    print(paste0(getwd(),"/",directory))
    
    filelist<-list.files(path=paste0(getwd(),"/",directory), pattern = NULL, all.files = FALSE, full.names = TRUE,recursive = FALSE,ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)
    filelist[1]
    if(length(id)==1){
      tempDataFrame<-read.csv(filelist[id])
    } else{
      tempDataFrame<-read.csv(filelist[id[1]])
      for (i in id[2]:id[length(id)]) {
          tempDataFrame<-rbind(tempDataFrame,read.csv(filelist[i]))
      }
    }
    #result<-round(colMeans(tempDataFrame[pollutant], na.rm=TRUE, dims=1), 3)    
    result<-as.numeric(round(colMeans(tempDataFrame[pollutant], na.rm=TRUE, dims=1), 3))
    result
}
    
    
#pollutantmean("C:\\Users\\Sammo\\Downloads\\rprog-data-specdata\\specdata", "sulfate", 1:10)    
#pollutantmean("C:\\Users\\Sammo\\Downloads\\rprog-data-specdata\\specdata", "nitrate", 70:72)    
