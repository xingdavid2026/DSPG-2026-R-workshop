## Visualization with ggplot2 -----

library(tidyverse)
library(ggplot2)

interviews_plotting <- read_csv("data/interviews-plotting.csv")

interviews_plotting |> 
  ggplot(mapping = aes(x = no_membrs, y = number_items)) +
  geom_point(alpha = 0.5)

interviews_plotting |> 
  ggplot(mapping = aes(x = no_membrs, y = number_items)) +
  geom_jitter(alpha = 0.7, width = 0.2, height = 0.2)

interviews_plotting |> 
  ggplot(mapping = aes(x = no_membrs, y = number_items)) +
  geom_jitter(alpha = 0.7, width = 0.2, height = 0.2, color = "darkorange")

interviews_plotting |> 
  ggplot(mapping = aes(x = no_membrs, y = number_items, 
                       color = village, shape = memb_assoc)) +
  geom_jitter(alpha = 0.7, width = 0.2, height = 0.2)

interviews_plotting |> 
  filter(!is.na(memb_assoc)) |> 
  ggplot(mapping = aes(x = no_membrs, y = number_items, 
                       color = village, shape = memb_assoc)) +
  geom_jitter(alpha = 0.7, width = 0.2, height = 0.2) +
  scale_color_viridis_d(option = "rocket")

interviews_plotting |> 
  ggplot(mapping = aes(x = respondent_wall_type, y = rooms)) +
  geom_boxplot()

interviews_plotting |> 
  count(respondent_wall_type)

interviews_plotting |> 
  filter(respondent_wall_type != "cement") |> 
  ggplot(mapping = aes(x = respondent_wall_type, y = rooms)) +
  geom_boxplot(outliers = FALSE) +
  geom_jitter(mapping = aes(color = village),
              width = 0.3, height = 0.1)

interviews_plotting |> 
  filter(respondent_wall_type != "cement") |> 
  ggplot(mapping = aes(x = respondent_wall_type, y = rooms)) +
  geom_jitter(mapping = aes(color = village),
              width = 0.3, height = 0.1) +
  geom_boxplot(outliers = FALSE, alpha = 0) 

interviews_plotting |> 
  ggplot(mapping = aes(x = respondent_wall_type)) +
  geom_bar()

interviews_plotting |> 
  ggplot(mapping = aes(y = fct_infreq(respondent_wall_type))) +
  geom_bar(mapping = aes(fill = village)) +
  labs(y = "Wall Type", x = NULL, title = "Bar Graph of Wall Type to Village",
       fill = "Village") +
  theme_linedraw()

ggsave("fig/wall-type.png", height = 8, width = 5)



