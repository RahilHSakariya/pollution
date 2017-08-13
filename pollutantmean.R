pollutantmean <- function(directory, pollutant, id = 1:332) {
    files <-  paste(directory, '/', formatC(id, width = 3, format = "d", flag = "0"), '.csv', sep="")
    tables <- lapply(files, read.csv, header = TRUE)
    data <- do.call(rbind , tables)
    mean(data[[pollutant]], na.rm = TRUE)
}