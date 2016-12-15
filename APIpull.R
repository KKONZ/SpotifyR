library(httr)

# create an Alias for clientID and secret in another path, then can publish to GitHub.
clientID = 'xxxx' # Register spotify app to generate clientID
secret = 'xxxx' # Register spotify app to generate secret

response = POST(
  'https://accounts.spotify.com/api/token',
  accept_json(),
  authenticate(clientID, secret),
  body = list(grant_type = 'client_credentials'),
  encode = 'form',
  verbose()
)


mytoken = content(response)$access_token
HeaderValue = paste0('Bearer ', mytoken)

SpotifyTracks <- subset(SpotifyTracks, SpotifyTracks != '0tLzUKSs4A7qD0MykxDBjV' & 
                          SpotifyTracks != '2tNNECuPFrnG9ezMCGZXow')
                          
n <- as.integer(length(SpotifyTracks[ ,1])/100)
n_mod <- length(SpotifyTracks[ ,1]) %% 100

ColumnNames <- c("danceability", "energy", "key", "loudness", "mode", "speechiness", "acousticness" 
                    , "instrumentalness", "liveness", "valence", "tempo", "type", "TrackID", "uri" 
                     , "track_href", "analysis_url", "duration_ms", "time_signature") 

Chunk1 <- data.frame(SpotifyTracks[1:(n*100), ])

ModTracks <- tail(SpotifyTracks, n_mod)

dfchunk2 <- paste0(ModTracks$SpotifyTracks,collapse=",")

dfchunk <- split(Chunk1, 1:19)

for(i in 1:19){
  dfchunk[[i]] <- paste0(dfchunk[[i]][, 1],collapse=",")
}


#Trackraw <- as.list(1:100)
# dftest <- data.frame(matrix(ncol = 18))
dfComplete <- data.frame(matrix(nrow = 0 ,ncol = 18))

colnames(dfComplete) <- ColumnNames

for(i in 1:19){
 URI = paste0('https://api.spotify.com/v1/audio-features/?ids=', dfchunk[[i]]) 
 response2 = GET(url = URI, add_headers(Authorization = HeaderValue))
 dfInit <- data.frame(matrix(nrow = 0, ncol = 18))
 colnames(dfInit) <- ColumnNames
 Trackraw = content(response2)
 df <- data.frame(matrix(unlist(Trackraw), nrow=100, byrow=T),stringsAsFactors=FALSE)
  colnames(df) <- ColumnNames
  dftemp <- rbind(df, dfInit)
  dfComplete <- rbind(dftemp, dfComplete)
  dfComplete <- unique(dfComplete)
}

URI = paste0('https://api.spotify.com/v1/audio-features/?ids=', dfchunk2) 
response2 = GET(url = URI, add_headers(Authorization = HeaderValue))
Trackraw2 = content(response2)
df2 <- data.frame(matrix(unlist(Trackraw2), n_mod, byrow=T),stringsAsFactors=FALSE)
colnames(df2) <- ColumnNames

dfComplete <- rbind(dfComplete, df2)

setwd("~/Desktop")
write.csv(dfComplete, file = "SpotifyAudioFeature.csv", row.names = FALSE)


n2 = 38
dfchunk3 <- split(Chunk1, 1:n2)

for(i in 1:38){
  dfchunk3[[i]] <- paste0(dfchunk3[[i]][, 1],collapse=",")
}



# Pulls Track Info 
dfTrackComplete <- data.frame(matrix(nrow = 0, ncol = 9))


for(i in 1:38){
  URI = paste0('https://api.spotify.com/v1/tracks/?ids=', dfchunk3[[i]]) 
  response2 = GET(url = URI, add_headers(Authorization = HeaderValue))
#  dfInit <- data.frame(matrix(nrow = 0, ncol = 18))
#  colnames(dfInit) <- ColumnNames
#  Sys.sleep(10)
  Trackraw = content(response2)
  for(i in 1:50){
    dfInit <- data.frame(matrix(nrow = 0, ncol = 9))
    Albumtype <- Trackraw$tracks[[i]]$album$album_type
    ArtistID <- Trackraw$tracks[[i]]$album$artists[[1]]$id
    ArtistName <- Trackraw$tracks[[i]]$album$artists[[1]]$name
    AlbumID <- Trackraw$tracks[[i]]$album$id
    AlbumName <- Trackraw$tracks[[i]]$album$name
    DiskNumber <- Trackraw$tracks[[i]]$disc_number
    TrackPopularity <- Trackraw$tracks[[i]]$popularity
    TrackID <- Trackraw$tracks[[i]]$id
    TrackName <- Trackraw$tracks[[i]]$name
    dfInit <- cbind(Albumtype, ArtistID, ArtistName, AlbumID, AlbumName, TrackPopularity, DiskNumber, TrackID, TrackName)
    dfTrackComplete <- rbind(dfInit, dfTrackComplete)
  }
}





# Pull Modulus Track Data
URI = paste0('https://api.spotify.com/v1/tracks/?ids=', dfchunk2)
response2 = GET(url = URI, add_headers(Authorization = HeaderValue))
Trackraw2 = content(response2)


for(i in 1:12){
dfInit <- data.frame(matrix(nrow = 0, ncol = 9))
Albumtype <- Trackraw2$tracks[[i]]$album$album_type
ArtistID <- Trackraw2$tracks[[i]]$album$artists[[1]]$id
ArtistName <- Trackraw2$tracks[[i]]$album$artists[[1]]$name
AlbumID <- Trackraw2$tracks[[i]]$album$id
AlbumName <- Trackraw2$tracks[[i]]$album$name
DiskNumber <- Trackraw2$tracks[[i]]$disc_number
TrackPopularity <- Trackraw2$tracks[[i]]$popularity
TrackID <- Trackraw2$tracks[[i]]$id
TrackName <- Trackraw2$tracks[[i]]$name
dfInit <- cbind(Albumtype, ArtistID, ArtistName, AlbumID, AlbumName, TrackPopularity, DiskNumber, TrackID, TrackName)
dfTrackComplete <- rbind(dfInit, dfTrackComplete)
}



# Add in the Caret logic for data partitioning

# Importance modeling

# Fit lm

# Correlation matrix of importance variables
