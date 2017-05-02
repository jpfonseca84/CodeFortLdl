#Identify the levels of all columns in a data.frame
dflevels <- function(data = NULL) {
      if (is.null(data)) {
            stop("Please provide a data frame")
      }
      ncolumns <- length(names(data))
      answerlist <- list()
     
      #make a loop to evaluate each levels of each column
      for (i in 1:ncolumns) {
            nameofcolumn<-as.character(names(data[i]))
            answerlist[[i]]<- levels(as.factor(data[, i]))
      }
      names(answerlist)<-names(data)
      return(answerlist)
}

#Gives the percentual of NA values of each column ranked by percentual
countNA <- function(data = NULL) {
      if (is.null(data)) {
            stop("Please provide a data frame")
      }
      ncolumns <- length(names(data))
      observations <- nrow(data)
      answer <- NA
      for (i in 1:ncolumns) {
            answer[i] <- sum(is.na.data.frame(data[i])) / observations
            answer[i] <- round(answer[i], digits = 2)
      }
      names(answer) <- names(data)
      answer<-sort(answer,decreasing = T)
      return(answer)
}
