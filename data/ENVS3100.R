library(ggplot2)
library(tidyverse)
#load 

d <- read_csv("~/Downloads/API_TX.VAL.AGRI.ZS.UN_DS2_en_csv_v2_13705/API_TX.VAL.AGRI.ZS.UN_DS2_en_csv_v2_13705.csv")
d

d <- d %>%
  filter(`Country Name` == "Ghana")

# pivot wider 


df_long <- d %>%
  pivot_longer(
    cols = `1960`:`2023`,   # or use matches("^\\d{4}$") if the years vary
    names_to = "Year",
    values_to = "Value"
  ) %>%
  mutate(Year = as.integer(Year))  # Convert year from character to integer if needed

