# Change working directory if needed
setwd("xxxxxxxxxxxxxxxx")

# Retrieve .csv files
PKMNGO <- read.csv("Pokémon GO.csv", header=TRUE)
PKMNSM <- read.csv("Pokémon Sun & Moon.csv", header=TRUE)
YKWatch <- read.csv("YKWatch.csv", header=TRUE)

# be sure to open and run the statements in the .R files
# which contain the self-defined functions first

# ==Data exploration==
# tweets over time
file.edit('lineGraph.R')

lineGraph(PKMNGO)
lineGraph(PKMNSM)
lineGraph(YKWatch)

# tweets over time - comparison
multiLineGraph(PKMNGO, PKMNSM, YKWatch)

# coordinate mapping
file.edit('map.R')

map(PKMNGO)
map(PKMNSM)
map(YKWatch)

# K-Means Clustering; K = 2
file.edit('log10Cluster.R')

log10Cluster(PKMNGO)
log10Cluster(PKMNSM)
log10Cluster(YKWatch)

# ==Sentiment analysis==
# total tweets grouped by overall sentiment
file.edit('clean.text.R')
file.edit('score.sentiment.R')
file.edit('sentimentHistogram.R')

cleanGO <- clean.text(PKMNGO$text)
cleanSM <- clean.text(PKMNSM$text)
cleanYK <- clean.text(YKWatch$text)

pos <- scan("positive-words.txt",what="character",comment.char=";")
neg <- scan("negative-words.txt",what="character",comment.char=";")

sentimentHistogram(cleanGO)
sentimentHistogram(cleanSM)
sentimentHistogram(cleanYK)

# distribution histograms
file.edit('distHistogram.R')

distHistogram(cleanGO)
distHistogram(cleanSM)
distHistogram(cleanYK)

# sentiment over time
file.edit('sentimentOverTime.R')

sentimentOverTime(cleanGO,PKMNGO)
sentimentOverTime(cleanSM,PKMNSM)
sentimentOverTime(cleanYK,YKWatch)

# sentiment word clouds
file.edit('sentimentClouds.R')

sentimentCloud(cleanGO)
sentimentCloud(cleanSM)
sentimentCloud(cleanYK)