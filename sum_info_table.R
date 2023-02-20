library(dplyr)
library(tidyverse)

# Load data sets
offices <- read.csv("offices5_score.csv", stringsAsFactors = F)

# Aggregate table illustrating the prevalence of gaming company offices across different countries
office_prevalence_df <- offices %>%
  count(country_code) %>%
  mutate("Number of Offices" = paste(n)) %>%
  arrange(desc(n)) %>%
  mutate("Country Code" = paste(country_code)) %>%
  select(
    "Country Code",
    "Number of Offices"
  ) %>%
  slice_head(n = 10)