library(geojsonio)
library(tidyverse)

topo <- topojson_read("county.topo.json")

# Filtering county to the California code
topo <- topo %>%
  filter(str_detect(id, "^06"))

topojson_write(topo, file = "CaliCounty.topo.json")

# Adding random dates to customer ID
df <- as.data.table(read_csv("data.csv"))

df <- as.data.table(df)

df <- df[, random_date := as.Date(
  runif(.N, 
        as.numeric(as.Date("2020-01-01")),
        as.numeric(as.Date("2021-12-31"))),
  origin = "1970-01-01"
  )]

write_csv("dates.csv")
