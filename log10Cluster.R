# source: http://rstudio-pubs-static.s3.amazonaws.com/5983_af66eca6775f4528a72b8e243a6ecf2d.html

log10Cluster <- function(x)
{
  require(ggplot2)
  
  x$favoriteCount[x$favoriteCount==0]<-1
  x$retweetCount[x$retweetCount==0]<-1
  
  log10fave <- log10(x$favoriteCount)
  log10retweet <- log10(x$retweetCount)
  
  kObject.log <- data.frame(log10fave,log10retweet)
  user2Means.log <- kmeans(kObject.log, centers=2, iter.max=10, nstart=100)
  kObject.log$cluster=factor(user2Means.log$cluster)
  
  gg1.log <- ggplot(x, aes(log10retweet,log10fave)) + geom_point() +
    ggtitle("Retweets vs Favourites - Log 10 Scale") + xlab("Log Retweet Count") + ylab("Log Favourite Count")
  
  gg1.log + aes(color=user2Means.log$cluster)
}