require(twitteR)

reqURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "http://api.twitter.com/oauth/authorize"
consumerKey <- "Your Twitter consumer key"
consumerSecret <- "Your Twitter consumer key's secret"

twitCred <- OAuthFactory$new(consumerKey=consumerKey, consumerSecret=consumerSecret,
requestURL=reqURL, accessURL=accessURL, authURL=authURL)
twitCred$handshake()
registerTwitterOAuth(twitCred)

query <- '#CR7 OR #CRISTIANO OR #CRISTIANORONALDO'
# collecting 1500 English tweets at most as old as one year
tweets <- searchTwitter(query, n=1500, lang="en", since="2014-09-20") 
df <- do.call("rbind", lapply(tweets, as.data.frame)) 

save(df,file="data/tweet-data-x.Rdata")
# load("tweet-data-x.Rdata")
