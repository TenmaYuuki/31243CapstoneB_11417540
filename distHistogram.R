# source: http://www.cookbook-r.com/Graphs/Plotting_distributions_(ggplot2)/

# score.sentiment function must be loaded first

distHistogram <- function(clean)
{
  require(ggplot2)
  analysis <- score.sentiment(clean,pos,neg)
  ggplot(analysis, aes(x=score)) + xlim(-6,6) + geom_histogram(binwidth=1)
}
