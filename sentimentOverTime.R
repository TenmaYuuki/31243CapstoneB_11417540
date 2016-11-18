sentimentOverTime <- function(x, y)
{
  analysis <- data.frame(score.sentiment(x,pos,neg), y$createdDate)
  totals <- as.data.frame(xtabs(score ~ y.createdDate, analysis))
  totals_datesSorted = totals[order(as.Date(totals$y.createdDate,format="%d/%m/%Y")),,drop=FALSE]
  date = as.Date(totals_datesSorted$y.createdDate, "%d/%m/%Y")
  sentiment = totals_datesSorted$Freq
  plot(date,sentiment,type="o",xlab="Date",ylab="Sentiment",
       main="Sentiment over time")
}