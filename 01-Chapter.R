
library(tidyverse)
library(leaflet)

# CHAPTER 1 ---------------------------------------------------------------

# 1.2 Why use R for geocomputation
# Marker example

popup <- c("Robin", "Jakub", "Jannes")

leaflet() %>%
  addProviderTiles("NASAGIBS.ViirsEarthAtNight2012") %>%
  addMarkers(lng = c(-3, 23, 11),
             lat = c(52, 53, 49), 
             popup = popup)

# Not showing markers (???)