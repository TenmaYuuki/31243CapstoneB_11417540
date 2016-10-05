# line graphs for time series
# source: https://cosmosweb.champlain.edu/people/stevens/WebTech/R/Chapter-3-R.pdf

# change directory if needed
setwd("F:/University of Technology, Sydney/2016/Analytics Capstone Project B/R Code")

# Line graph for #PokémonGO
PKMNGO_Dates <- read.table("Pokémon GO_Dates.csv",header=TRUE,sep=",")
GO_date <- as.Date(PKMNGO_Dates$createdDate, "%d/%m/%Y")
GO_frequency <- PKMNGO_Dates$frequency
plot(GO_date,GO_frequency,type="o",xlab="Date",ylab="Frequency",
     main="#PokémonGO - Tweets over time")

# Line graph for #PokémonSunMoon
PKMNSM_Dates <- read.table("Pokémon Sun & Moon_Dates.csv",header=TRUE,sep=",")
SM_date <- as.Date(PKMNSM_Dates$createdDate, "%d/%m/%Y")
SM_frequency <- PKMNSM_Dates$frequency
plot(SM_date,SM_frequency,type="o",xlab="Date",ylab="Frequency",
     main="#PokémonSunMoon - Tweets over time")

# Line graph for #YoKaiWatch
YK_Dates <- read.table("YKWatch_Dates.csv",header=TRUE,sep=",")
YK_date <- as.Date(YK_Dates$createdDate, "%d/%m/%Y")
YK_frequency <- YK_Dates$frequency
plot(YK_date,YK_frequency,type="o",xlab="Date",ylab="Frequency",
     main="#YoKaiWatch - Tweets over time")