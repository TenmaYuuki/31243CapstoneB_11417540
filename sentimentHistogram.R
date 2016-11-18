sentimentHistogram <- function(clean)
{
  require(ggplot2)
  
  analysis <- score.sentiment(clean,pos,neg)
  
  neutral <- length(which(analysis$score == 0))
  positive <- length(which(analysis$score > 0))
  negative <- length(which(analysis$score < 0))
  Sentiment <- c("Negative","Neutral","Positive")
  Count <- c(negative,neutral,positive)
  output <- data.frame(Sentiment,Count)
  
  ggplot(output, aes(Sentiment,Count)) + geom_bar(stat="identity",
                                                  aes(fill=Sentiment)) + ggtitle("Overall sentiment")
}