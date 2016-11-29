
setwd("C:/Users/karlk/Desktop/EconometricsData/SpotifyData/")

ldf <- list() # creates a list
listtxt <- dir(pattern = "*.csv")

ldf = lapply(listtxt, function(x) {
  
  dat = read.csv(x, header=TRUE, stringsAsFactors = FALSE)
  
  # Add a column with the year
  dat$Date = substr(x,1,10)
  return(dat)
})

library(dplyr)
SpotifyDF = bind_rows(ldf)


head(SpotifyDF)

str(SpotifyDF)


SpotifyDF <- data.frame(SpotifyDF)
SpotifyDF$TrackID <- substr(SpotifyDF$URL, 32, 53)

SpotifyTracks <- na.omit(SpotifyDF$TrackID)
SpotifyTracks <- unique(SpotifyTracks)
SpotifyTracks <- subset(SpotifyTracks, SpotifyTracks != "")
SpotifyTracks <- data.frame(SpotifyTracks)



rm(ldf)
rm(listtxt)
