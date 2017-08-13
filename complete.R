complete <- function(directory, id = 1:332) {
    files <-  paste(directory, '/', formatC(id, width = 3, format = "d", flag = "0"), '.csv', sep="")
   
    nobs <- vector(mode = 'numeric', length = length(files))
    for (i in 1:length(files)) {
        input = read.csv(files[i])
        data <- input[!(is.na(input$nitrate) | is.na(input$sulfate)), ]
        nobs[i] <- NROW(data)
    }

    data.frame(id, nobs)
    
    # tables <- lapply(files, read.csv, header = TRUE)
    # data <- do.call(rbind , tables)
    # 
    # completes <- data[!(is.na(data$nitrate) | is.na(data$sulfate)), ]
    # result <- aggregate(Date~ID, completes, FUN=NROW)
    # names(result) <- c("id","nobs")
    # result
}
