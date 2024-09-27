### File: penguin_data_cleaning
## Description: 

#

penguins_lter_data = subset(penguins_lter, select = c(Species:Delta.13.C..o.oo.))

na_df <- function(df) {
  df %>%
    mutate(row = row_number()) %>%
    pivot_longer(cols = -row, names_to = "key", values_to = "value") %>%
    mutate(is_na = is.na(value)) %>%
    select(row, key, is_na)
}

# Replace `your_dataframe` with the actual name of your dataframe
na_info <- na_df(penguins_lter_data)

ggplot(na_info, aes(x = key, y = row)) +
  geom_raster(aes(fill = is_na)) +
  scale_fill_manual(values = c("TRUE" = "red", "FALSE" = "white")) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(fill = "Is NA", x = "Variables", y = "Observations")


install.packages("naniar")
library(naniar)

# Replace `your_data` with the actual name of your dataframe or tibble
vis_miss(penguins_lter_data)


library(tidyverse)

# Replace `your_data` with the actual name of your dataframe or tibble
clean_data <- penguins_lter_data %>%
  drop_na()

vis_miss(clean_data)

