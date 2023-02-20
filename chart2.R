company_data <- read.csv("data_set/companies_1m.csv", stringsAsFactors = F)
library("ggplot2")
library("plotly")
library("dplyr")


lat_90 <- company_data %>% filter(latitude > 45 & latitude <= 90)
lat_45 <- company_data %>% filter(latitude > 0 & latitude <= 45)
lat_neg_45 <- company_data %>% filter(latitude > -45 & latitude <= 0)
lat_neg_90 <- company_data %>% filter(latitude > -90 & latitude <= -45)

# Taking size of each Group as a measure of how many offices are there
office_lat_data <- c(nrow(lat_90), nrow(lat_45), nrow(lat_neg_45), nrow(lat_neg_90))

