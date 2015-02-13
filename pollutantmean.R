pollutantmean <- function(directory, pollutant, id ) {

        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        archivos <- list.files(directory,pattern = "\\.csv$")
        print(archivos)
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## *Recorriendo la lista de id's para formar el data set
        for (i in id){        	
        	fileName <- c(directory, archivos[i])
        	print(paste(fileName, collapse="/"))
        	
        	if (!exists("df_joined")){
			   df_joined <- read.csv(paste(fileName, collapse="/"))
			}else{
				df_joined <- merge(df_joined, read.csv(paste(fileName, collapse="/")) , all=TRUE)
			}        	        
        }

        print(df_joined)
		
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        pollutantVectorRaw = df_joined[[pollutant]] 

        print( pollutantVectorRaw[!is.na(pollutantVectorRaw)] )     

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
		mean( pollutantVectorRaw[!is.na(pollutantVectorRaw)] )        

}



