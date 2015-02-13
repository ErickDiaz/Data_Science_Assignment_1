pollutantmean <- function(directory, pollutant, id ) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        archivos <- list.files(directory,pattern = "\\.csv$")
        print(archivos)
        
        for (i in id){

        	fileName <- c(directory, archivos[i])
        	print(paste(fileName, collapse="/"))

        	rawData = read.csv(paste(fileName, collapse="/"))	
        	print(rawData)
        }



		##multmerge = function(directory){
		##	filenames=list.files(path=directory, full.names=TRUE)
		##	datalist = lapply(filenames, function(x){read.csv(file=x,header=T)})
		##	Reduce(function(x,y) {merge(x,y)}, datalist)
		##}
		##print(multmerge[2,])
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)

}



