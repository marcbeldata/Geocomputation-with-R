
#install.packages("spDataLarge", repos = "https://nowosad.r-universe.dev")

library(tidyverse)
library(sf)
library(terra)
library(spData)
library(spDataLarge)

# CHAPTER 2 ---------------------------------------------------------------

vignette(package = "sf")
vignette("sf1")

class(world)
names(world)
colnames(world)

world$geom
plot(world)

# Different behavior for the column selection
summary(world$lifeExp) # as data frame
summary(world["lifeExp"]) # as spatial data frame

plot(world$lifeExp) # as data frame
plot(world["lifeExp"]) # as spatial data frame

world_mini <- world[1:2, 1:3]
world_mini

# Reading shp with tidyverse
world_dfr <- st_read(system.file("shapes/world.shp", package = "spData"))
world_tbl <- read_sf(system.file("shapes/world.shp", package = "spData"))

class(world_dfr)
class(world_tbl)



# 2.2.3 Basic map making
plot(world[3:6])
plot(world["pop"])


# Adding layers
world_asia <- world[world$continent == "Asia", ]
asia <- st_union(world_asia)

plot(world["pop"], reset = FALSE)
plot(asia, add = TRUE, col = "red")

plot(world["continent"], reset = FALSE)
cex <- sqrt(world$pop) / 10000
world_cents <- st_centroid(world, of_largest = TRUE)
plot(st_geometry(world_cents), add = TRUE, cex = cex)


india <- world[world$name_long == "India", ]
plot(st_geometry(india), expandBB = c(0, 0.2, 0.1, 1), col = "gray", lwd = 3, 
     reset = T)
plot(world_asia[0], add = TRUE)


# 2.2.5 The sf class
lnd_point <- st_point(c(0.1, 51.5))                 # sfg object
lnd_geom <- st_sfc(lnd_point, crs = 4326)           # sfc object
lnd_attrib <- data.frame(                           # data.frame object
  name = "London",
  temperature = 25,
  date = as.Date("2017-06-21")
)
lnd_sf <- st_sf(lnd_attrib, geometry = lnd_geom)    # sf object

lnd_sf
class(lnd_sf)







