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


n <- as.integer(length(SpotifyTracks)/100)
n_mod <- length(SpotifyTracks) %% 100
  

ModTracks <- tail(SpotifyTracks, n_mod)
dfchunk2 <- paste0(tempArray[1:nrow(ModTracks), 1],collapse=",")

dfchunk <- split(SpotifyTracks, factor(sort(rank(row.names(SpotifyTracks))%%n)))

for(i in 1:19){
  tempArray <- dfchunk[[i]]
  dfchunk[[i]] <- paste0(tempArray[1:100, 1],collapse=",")
}


Trackraw <- as.list(1:100)
dftest <- data.frame(matrix(ncol = 18))
colnames(df) <- c("danceability", "energy", "key", "loudness", "mode", "speechiness", "acousticness"
                     , "instrumentalness", "liveness", "valence", "tempo", "type", "TrackID", "uri"
                     , "track_href", "analysis_url", "duration_ms", "time_signature")

dfComplete <- data.frame(matrix(nrow = 0 ,ncol = 18))
colnames(dfComplete) <- c("danceability", "energy", "key", "loudness", "mode", "speechiness", "acousticness"
                  , "instrumentalness", "liveness", "valence", "tempo", "type", "TrackID", "uri"
                  , "track_href", "analysis_url", "duration_ms", "time_signature")
#head(str(Track))
for(i in 1:19){
  #URI = paste0('https://api.spotify.com/v1/audio-features/?ids=',dfchunk[[i]]) ## Change from artist to track
  URI = paste0('https://api.spotify.com/v1/audio-features/?ids=', dfchunk[[i]]) 
  response2 = GET(url = URI, add_headers(Authorization = HeaderValue))
  dfInit <- data.frame(matrix(nrow = 0 ,ncol = 18))
  colnames(dfInit) <- c("danceability", "energy", "key", "loudness", "mode", "speechiness", "acousticness"
                        , "instrumentalness", "liveness", "valence", "tempo", "type", "TrackID", "uri"
                        , "track_href", "analysis_url", "duration_ms", "time_signature")
  
  Trackraw = content(response2)
  df <- data.frame(matrix(unlist(Trackraw), nrow=100, byrow=T),stringsAsFactors=FALSE)
  colnames(df) <- c("danceability", "energy", "key", "loudness", "mode", "speechiness", "acousticness"
                    , "instrumentalness", "liveness", "valence", "tempo", "type", "TrackID", "uri"
                    , "track_href", "analysis_url", "duration_ms", "time_signature")
  dftemp <- rbind(df, dfInit)
  dfComplete <- rbind(dftemp, dfComplete)
  dfComplete <- unique(dfComplete)
}



URI = paste0('https://api.spotify.com/v1/audio-features/?ids=', dfchunk2) 
response2 = GET(url = URI, add_headers(Authorization = HeaderValue))
Trackraw = content(response2)
df <- data.frame(matrix(unlist(Trackraw), nrow=n_mod, byrow=T),stringsAsFactors=FALSE)
colnames(df) <- c("danceability", "energy", "key", "loudness", "mode", "speechiness", "acousticness"
                      , "instrumentalness", "liveness", "valence", "tempo", "type", "TrackID", "uri"
                      , "track_href", "analysis_url", "duration_ms", "time_signature")


dfComplete <- rbind(dfComplete, df)


SpotDF <- merge(dfComplete, SpotifyDF, by = "TrackID")


df <- data.frame(matrix(unlist(Trackraw), nrow=1000, byrow=T),stringsAsFactors=FALSE)
df2 <- data.frame(matrix(unlist(Trackraw2), nrow=48, byrow=T),stringsAsFactors=FALSE)

write.csv(SpotifyDF, file = "test.csv")


colnames(df) <- c("danceability", "energy", "key", "loudness", "mode", "speechiness", "acousticness"
                  , "instrumentalness", "liveness", "valence", "tempo", "type", "TrackID", "uri"
                  , "track_href", "analysis_url", "duration_ms", "time_signature")

colnames(df2) <- c("danceability", "energy", "key", "loudness", "mode", "speechiness", "acousticness"
                  , "instrumentalness", "liveness", "valence", "tempo", "type", "TrackID", "uri"
                  , "track_href", "analysis_url", "duration_ms", "time_signature")


FullSpotify <- rbind(df, df2)
FullSpotify2 <- FullSpotify[!duplicated(FullSpotify[ ,"TrackID"]),]


FullSpotify2 <- unique(FullSpotify)


#SpotDF <- merge(dfComplete, SpotifyDF, by = "TrackID")
SpotDF <- merge(dfComplete, SpotifyDF, by = "TrackID", all.y = TRUE)

SpotifyCleaned <- merge(dfComplete, SpotifyDF, by = "TrackID")
