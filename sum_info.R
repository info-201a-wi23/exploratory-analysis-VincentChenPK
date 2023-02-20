# Load relevant packages 
library(dplyr)

# Load data sets
companies <- read.csv("data_set/companies_1m.csv", stringsAsFactors = F)
offices <- read.csv("data_set/offices5_score.csv", stringsAsFactors = F)
top_offices <- read.csv("data_set/topoffices2_score.csv", stringsAsFactors = F)
design_companies <- read.csv("data_set/companies_design.csv", stringsAsFactors = F)

# 1) Find the most prevalent company name in the dataset 
most_prevalent_company <- companies %>% 
  count(name) %>% 
  filter(n == max(n, na.rm = T)) %>%
  pull(name)

# 2) Add a new column "country_city" to the dataframe that combines the name of each country and associated city. Then, find the country and city combination with the most companies. 
companies <- companies %>% 
  mutate(country_city = paste0(country_code, ", ", city))

most_companies <- companies %>%
  count(country_city) %>%
  filter(n == max(n, na.rm = T)) %>%
  pull(country_city)

# 3) Add a new column "country_city" to the dataframe that combines the name of each country and associated city. Then, find the country and city combination with the most top offices. 
top_offices <- top_offices %>% 
  mutate(country_city = paste0(country_code, ", ", city))

most_offices <- top_offices %>%
  count(country_city) %>%
  filter(n == max(n, na.rm = T)) %>%
  pull(country_city)

# 4) Add a new column "name_country_city" to the dataframe that combines the name of each office and its associated country & city location. Then, find the name of the office(s) with the highest score and its associated location. 
offices <- offices %>% 
  mutate(name_country_city = paste0(name, ", ", country_code, ", ", city))

highest_office <- offices %>% 
  filter(condition5_score == max(condition5_score, na.rm = T)) %>%
  pull(name_country_city)

# 5) Find the proportion between the total number of offices from non-USA countries and the number of offices in the USA.
# Begin by saving total number of USA offices in a variable 
usa_total_offices <- offices %>% 
  filter(country_code == "USA") %>%
  count(country_code) %>%
  pull(n)

# Then, save the total number of offices from non-USA countries in a variable
non_usa_total_offices <- nrow(offices) - usa_total_offices

# Lastly, calculate the proportion by dividing the two 
office_proportion <- non_usa_total_offices / usa_total_offices

# 6) Add all variables into summary info list 
sum_info <- list()
sum_info$most_prevalent_company <- most_prevalent_company
sum_info$most_companies <- most_companies
sum_info$most_offices <- most_offices
sum_info$highest_office <- highest_office
sum_info$office_proportion <- office_proportion