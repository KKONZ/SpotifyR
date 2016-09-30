setwd("C:/Users/karlk/Desktop/EconometricsData/SpotifyData/")

ldf <- list() # creates a list
listtxt <- dir(pattern = "*.csv")

ldf = lapply(listtxt, function(x) {
  
  dat = read.csv(x, header=FALSE)
  
  # Add a column with the year
  dat$Date = substr(x,1,10)
  
  return(dat)
})

library(dplyr)
df = rbind_all(ldf)


head(df)
