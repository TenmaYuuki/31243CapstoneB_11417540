map <- function(x)
{
  require(rworldmap)
  
  newmap <- getMap(resolution = "low")
  plot(newmap)
  points(x$longitude, x$latitude, col = "red", cex = 0.6)
}

# if a specific region is desired, used the following as a template:
# plot(newmap, xlim = c(-150, 0), ylim = c(0, 90), asp = 1)
# to change the size of the plots, change the value of "cex"