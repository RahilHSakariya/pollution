source("complete.R")

corr <- function(directory, treshold = 0) {
    a <- complete(directory)
    x <- a[a$nobs > treshold, ]
    id <- x[['id']]
    
    result <- vector(mode='numeric', length=length(id))
    if (length(id) > 0) {
        files <-  paste(directory, '/', formatC(id, width = 3, format = "d", flag = "0"), '.csv', sep="")
        
        for (i in 1:length(files)) {
            input = read.csv(files[i])
            data <- input[!(is.na(input$nitrate) | is.na(input$sulfate)), 2:4]
            result[i] <- cor(data$nitrate,data$sulfate)
        }
    }
    result
} 