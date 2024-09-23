### File: penguin_location_grpah.R
# Plots the location of the penguins

# Packages
library(ggplot2)
library(dbplyr)
library(tibble)
library(tidyverse)
library(ggrepel)
library(ggthemes)
library(randomForest)
library(datasets)
library(caret)

antarctica <- map_data("world", region = "Antarctica")

df_penguinloc <-
  tibble(
    island = c("Dream", "Biscoe", "Torgersen"),
    lat_y = c(-64.7333, -65.4333, -64.7666636),
    long_x = c(-64.2333, -65.5000, -64.083333)
  ) 


ggplot(antarctica, aes(long, lat, group = group)) +
  geom_polygon(fill = "#506B8E", alpha = .5) +
  coord_map("ortho", orientation = c(-90, 0, 0),
            xlim = c(-62, -59),
            ylim = c(-71, -60)) +
  geom_text_repel(df_penguinloc, mapping=aes(long_x, lat_y, label = island), 
                  group=1, color = c("#53868B", "#c02728", "#1874CD"), 
                  box.padding = 0.5,
                  nudge_y = 1,  nudge_x = -2, min.segment.length = 0) +
  geom_point(df_penguinloc, mapping=aes(
    size = 2,
    long_x, lat_y,
    group = 1, 
    colour = island),
    alpha =.7)+
  scale_color_manual(values = c("#53868B", "#c02728", "#1874CD"))+
  labs(title = "Penguins in Palmer Archipelago",
       subtitle = "Recorded penguins in 2009 and their nesting Islands") +
  theme_map() +
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 20),
        plot.subtitle =  element_text(hjust = 0.5),
        plot.background = element_rect(fill="#f9f9f9", color = "#f9f9f9"))


data<-na.omit(penguins_lter[,2:16])
table(data$Species)
str(data)

set.seed(222)
ind <- sample(2, nrow(data), replace = TRUE, prob = c(0.7, 0.3))
train <- data[ind==1,]
test <- data[ind==2,]


rf <- randomForest(Species~., data=train, proximity=TRUE)

print(rf)
