company_map <- read.csv("data_set/companies_1m.csv", stringsAsFactors = FALSE)
library("ggplot2")
library("dplyr")
library("maps")
#install.packages("mapproj")

map <- map_data("world")

ggplot(data = map) +
  geom_polygon(aes(x = long, y = lat, group = group)) +
  geom_point(data = company_map, aes(x = longitude, y = latitude, colour = country_code)) +
  labs(title = "Gaming companies across the World", 
       subtitle = "The dots represent gaming companies in each different country code", 
       caption = "The distribution of gaming companies across the world is displayed on this map", 
       x = "latitude", y = "longitude", fill = "country_code") 


#blank theme
blank_theme <- theme_bw() +
  theme(
    axis.line = element_blank(), # remove axis lines
    axis.text = element_blank(), # remove axis labels
    axis.ticks = element_blank(), # remove axis ticks
    axis.title = element_blank(), # remove axis titles
    plot.background = element_blank(), # remove gray background
    panel.grid.major = element_blank(), # remove major grid lines
    panel.grid.minor = element_blank(), # remove minor grid lines
    panel.border = element_blank(), # remove border around plot
  )
