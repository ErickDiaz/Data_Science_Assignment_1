corr <- function(directory, threshold = 0 ) {		
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        archivos <- list.files(directory,pattern = "\\.csv$")
        

        matixNobs <- complete("specdata", 1:length(archivos))

		## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        matrixTemp <-  matixNobs[ matixNobs[,"nobs"] > threshold, ]

        

        for ( i in matrixTemp[,"id"] ){
        	fileName <- c(directory, archivos[i])
        	

			rawData <- read.csv(paste(fileName, collapse="/"))

			temp1 <- subset(rawData,!is.na(rawData[["sulfate"]]))
            temp2 <- subset(temp1,!is.na(temp1[["nitrate"]]))

			sulfateVector = temp2[['sulfate']] 
            nitrateVector = temp2[['nitrate']] 

            if (!exists("corVectorResult")){
            	corVectorResult <- cor(sulfateVector,nitrateVector)
            }else{
            	corVectorResult <- c( corVectorResult, cor(sulfateVector,nitrateVector))
            }	

        }  

        print(corVectorResult)
        ## Return a numeric vector of correlations
}