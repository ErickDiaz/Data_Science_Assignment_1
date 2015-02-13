corr <- function(directory, threshold ) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        archivos <- list.files(directory,pattern = "\\.csv$")
        

        matixNobs <- complete("specdata", 1:length(archivos))

        matrixTemp <-  matixNobs[ matixNobs[,"nobs"] > threshold, ]
        print(matrixTemp)
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        #for (archivo in archivos){
        #	complete()
        #}  

        ## Return a numeric vector of correlations
}