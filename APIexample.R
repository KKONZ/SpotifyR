library(httr)
 
clientID = '12345678910' # Register spotify app to generate clientID
secret = 'ABCDEFGHIJKLMNOPQR' # Register spotify app to generate secret
 
response = POST(
'https://accounts.spotify.com/api/token',
accept_json(),
authenticate(clientID, secret),
body = list(grant_type = 'client_credentials'),
encode = 'form',
verbose()
)
 
mytoken = content(response)$access_token
 
# TODO pull in data from top 200 csv, csv will have to be manually downloaded??
# Try to get hyper link and use regex to update download path name.


## pulls data for given track, obtain this through top 200 list.
## TODO change from artist to trackID
artistID = '1Mxqyy3pSjf8kZZL4QVxS0'
 
HeaderValue = paste0('Bearer ', mytoken)
 
URI = paste0('https://api.spotify.com/v1/artists/', artistID) ## Change from artist to track
response2 = GET(url = URI, add_headers(Authorization = HeaderValue))
Artist = content(response2)


## from https://www.r-bloggers.com/the-eurovision-2016-song-contest-in-an-r-shiny-app/
