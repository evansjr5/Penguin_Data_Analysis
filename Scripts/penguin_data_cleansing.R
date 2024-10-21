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
clean_penguin <- penguins_lter_data %>%
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

ggplot(clean_data, aes(x=Body.Mass..g., y=Culmen.Depth..mm.,color = Species, shape = Island)) + 
  geom_point() +
  theme_classic() +
  xlab("Body Mass (g)") +
  ylab("Culmen Depth (mm)")
ggsave(filename = "Depth.v.Bodymass_Species.png",dpi = 600)

aov_res = aov(data = clean_data,formula = Culmen.Depth..mm. ~ Body.Mass..g.)

model = lm(clean_data$Culmen.Depth..mm. ~ clean_data$Culmen.Length..mm.)

ggplot(data = clean_data, aes(x = , y = Culmen.Depth..mm.)) +
  geom_point() +
  geom_smooth(method = "lm") +
  annotate("text",label = paste("R2 = ", round(summary(model)$r.squared, 2), "\n", 
                                                   "p = ", round(summary(model)$coefficients[8], 4)))
help(cor)


for( i in penguins_lter_data$Individual.ID) {
  len = str_length(i)
  ss = substring(i,len)
  if (ss == 1) {
    penguins_lter_data$Sex == "Male"
    }
}


# Assuming your DataFrame is named df
filtered_df <- clean_penguin %>%
  filter(Sex %in% c("MALE", "FEMALE") & Sex != "")

write_csv(filtered_df,"clean_penguin_data.csv")


