complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        archivos <- list.files(directory,pattern = "\\.csv$")
        ##print(archivos)
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## *Recorriendo la lista de id's para formar el data set
        for (i in id){          
                fileName <- c(directory, archivos[i])
                ##print(paste(fileName, collapse="/"))
                
                rawData <- read.csv(paste(fileName, collapse="/")) 

                temp1 <- subset(rawData,!is.na(rawData[["sulfate"]]))
                temp2 <- subset(temp1,!is.na(temp1[["nitrate"]]))

                ##print(nrow(temp2))    

                if (!exists("countVector")){
                       countVector <- nrow(temp2)
                       idVector <- i 
                }else{
                       countVector <- c( countVector, nrow(temp2) )
                       idVector <-  c( idVector, i) 
                       
                }        

                dfResult <- data.frame(idVector,countVector)               
        }
        
        colnames(dfResult) <- c("id","nobs")
        
        ## ** RESULTADO **
        dfResult
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
}