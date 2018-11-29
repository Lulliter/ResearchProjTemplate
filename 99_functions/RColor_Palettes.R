# CRAN version
install.packages("dichromat")


# Developmental version
devtools::install_github("kwstat/pals")
# CRAN version
install.packages("pals")


# carto 
# CRAN version
install.packages("rcartocolor")
library(rcartocolor)
display_carto_all(n = NULL, type = "all")
# Type of the palette, could be "quantitative", "diverging", "qualitative", "aggregation", or "all

# devtools::install_github("tidyverse/ggplot2")
library(sf)
#> Linking to GEOS 3.5.0, GDAL 2.1.2, proj.4 4.9.2
library(spData)
library(ggplot2)
ggplot(world, aes(fill = lifeExp)) +
  geom_sf(data = world) +
  coord_sf(crs = "+proj=robin") +
  scale_fill_carto_c(name = "Life expectancy: ",
                     type = "diverging", palette = "Fall", direction = -1) +
  theme_void()