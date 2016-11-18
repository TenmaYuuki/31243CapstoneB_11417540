# sources/references: https://rstudio-pubs-static.s3.amazonaws.com/31867_8236987cf0a8444e962ccd2aec46d9c3.html
# http://rstudio-pubs-static.s3.amazonaws.com/71296_3f3ee76e8ef34410a1635926f740c473.html
# https://www.r-bloggers.com/create-twitter-wordcloud-with-sentiments/

sentimentCloud <- function(clean)
{
  require(plyr)
  require(wordcloud)
  require(stringr)
  
  analysis <- score.sentiment(clean,pos,neg)
  # replace values of "score" with "positive", "negative", or "neutral", depending on the value
  analysis$score <- ifelse(analysis$score>0,"positive",(ifelse(analysis$score<0,"negative","neutral")))
  
  # separate text by sentiment
  sents = levels(factor(analysis$score))
  # get the labels and percents
  labels <- lapply(sents, function(x) paste(x,format(round((length((analysis[analysis$score ==x,])$text)/length(analysis$score)*100),2),nsmall=2),"%"))
  
  nemo = length(sents)
  emo.docs = rep("", nemo)
  for (i in 1:nemo)
  {
    tmp = analysis[analysis$score == sents[i],]$text
    
    emo.docs[i] = paste(tmp, collapse=" ")
  }
  
  corpus = Corpus(VectorSource(emo.docs))
  tdm = TermDocumentMatrix(corpus)
  tdm = as.matrix(tdm)
  colnames(tdm) = labels
  
  # comparison word cloud
  comparison.cloud(tdm, colors = brewer.pal(nemo, "Dark2"),
                   scale = c(3,.5), random.order = FALSE, title.size = 1.5, max.words=300)
}

# code below is for saving the corpus as a .pdf
# to do that, the code within the self-defined function must be run on its own,
# i.e. not creating a self-defined function which contains the code
# "clean" in score.sentiment is a placeholder name for cleaned datasets

# pdf("name.pdf", paper="A4r", width=10)
# comparison.cloud(tdm, colors = brewer.pal(nemo, "Dark2"),
#                scale = c(3,.5), random.order = FALSE, title.size = 1.5, max.words=300)
# dev.off()