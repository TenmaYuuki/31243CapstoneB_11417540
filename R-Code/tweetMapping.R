# Tweet mapping
# Source: http://www.milanor.net/blog/maps-in-r-plotting-data-points-on-a-map/
# Packages to load
library(rworldmap)

# change working directory if needed
setwd("xxxxxxxxxxxxx")

# load .csv files
PKMNGO <- read.csv("Pokémon GO.csv", header=TRUE)
PKMNSM <- read.csv("Pokémon Sun & Moon.csv", header=TRUE)
YKWatch <- read.csv("YKWatch.csv", header=TRUE)

# produce a new, blank world map
newmap <- getMap(resolution = "low")

# new world map must be loaded before co-ordinates can be plotted
plot(newmap)

# use following statement instead if a specific region is desired
# change parameter values in xlim and ylim if needed
plot(newmap, xlim = c(-150, 0), ylim = c(0, 90), asp = 1)

# co-ordinate plotting
# tip: run only one of the following statements at a time
# if plots are required for a different topic,
# create a new, blank world map with the statement in line 18 or 22
points(PKMNGO$longitude, PKMNGO$latitude, col = "red", cex = .6)
points(PKMNSM$longitude, PKMNSM$latitude, col = "red", cex = 2)
points(YKWatch$longitude, YKWatch$latitude, col = "red", cex = 2)
