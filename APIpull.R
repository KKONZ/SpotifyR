library(httr)

# create an Alias for clientID and secret in another path, then can publish to GitHub.
clientID = 'xxxx' # Register spotify app to generate clientID
secret = 'xxxx' # Register spotify app to generate secret

response = POST(
  'https://accounts.spotify.com/api/token',
  'https://accounts.spotify.com/api/token',
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

