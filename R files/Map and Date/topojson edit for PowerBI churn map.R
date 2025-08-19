library(geojsonio)
library(tidyverse)

topo <- topojson_read("county.topo.json")
topo <- topo %>%
  filter(str_detect(id, "^06"))
topojson_write(topo, file = "CaliCounty.topo.json")