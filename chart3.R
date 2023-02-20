# Load in Packages
library(dplyr)
library(ggplot2)
library(maps)
library(scales)

# Load in Data sets
airports <- read.csv("data_set/airports.csv")
companies1 <- read.csv("data_set/companies_1m.csv")
companies2 <- read.csv("data_set/companies_design.csv")
offices1 <- read.csv('data_set/offices.csv')
offices2 <- read.csv('data_set/offices5_score.csv')
topoffices <- read.csv('data_set/topoffices2_score.csv')

# grouping by country and seeing how many company offices are in each country
company_offices_per_country <- companies1 %>% 
  group_by(country_code) %>%
  tally() %>%
  unique()
# Plotting countries on y axis for cleanliness
# comparing Log(number of offices) because comparing just normal offices makes the graph
# very unclear and has the US far above the rest, this graph shows perspective
ggplot(data = company_offices_per_country, aes(x = country_code, y = n)) +
  geom_bar(
    stat = 'identity',
    fill = '#f68060',
  ) +
  labs(
    title = 'Number of Company Offices per Country (log plot)',
    x = '',
    y = 'log(Number of Company Offices)'
  ) + 
  scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  coord_flip() +
  theme_bw()