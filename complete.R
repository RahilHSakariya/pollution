complete <- function(directory, id = 1:332) {
    files <-  paste(directory, '/', formatC(id, width = 3, format = "d", flag = "0"), '.csv', sep="")
    tables <- lapply(files, read.csv, header = TRUE)
    data <- do.call(rbind , tables)
    
    data.complete = data[!(is.na(data$nitrate) | is.na(data$sulfate)), ]
    result <- aggregate(Date~ID, data.complete, FUN=NROW)
    names(result) <- c("id","nobs")
    result
}