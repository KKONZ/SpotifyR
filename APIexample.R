library(httr)
 
clientID = '12345678910'
secret = 'ABCDEFGHIJKLMNOPQR'
 
response = POST(
'https://accounts.spotify.com/api/token',
accept_json(),
authenticate(clientID, secret),
body = list(grant_type = 'client_credentials'),
encode = 'form',
verbose()
)
 
mytoken = content(response)$access_token
 
## Frank Sinatra spotify artist ID
artistID = '1Mxqyy3pSjf8kZZL4QVxS0'
 
HeaderValue = paste0('Bearer ', mytoken)
 
URI = paste0('https://api.spotify.com/v1/artists/', artistID)
response2 = GET(url = URI, add_headers(Authorization = HeaderValue))
Artist = content(response2)

## from https://www.r-bloggers.com/the-eurovision-2016-song-contest-in-an-r-shiny-app/
