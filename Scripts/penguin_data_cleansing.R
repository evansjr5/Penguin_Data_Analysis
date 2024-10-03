### File: penguin_data_cleaning
## Description: 

penguins_lter = read.csv("penguins_lter.csv")
plot_missing(penguins_lter)
vis_miss(penguins_lter)
# Subset of data that does not contain comments
penguins_lter_data = subset(penguins_lter, select = c(Species:Delta.13.C..o.oo.))

# Visualize the missing data in easch column
vis_miss(penguins_lter_data)
plot_missing(penguins_lter_data)

# Clean data by removing rows with NA
clean_data <- penguins_lter_data %>%
  drop_na()

# Visualize data after removing NAs
vis_miss(clean_data)
plot_missing(clean_data)
summary(penguins_lter_data)


hist(penguins_lter_data$Body.Mass..g.)
hist(penguins_lter_data$Delta.13.C..o.oo.)
hist(penguins_lter_data$Delta.15.N..o.oo.)

plot_bar(clean_data)
plot_histogram(clean_data)
plot_correlation(clean_data)

## Scatterplot `price` with all other continuous features
plot_scatterplot(split_columns(clean_data)$continuous, by = "Culmen.Length..mm.", sampled_rows = 1000L)

