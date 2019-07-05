
library(datasauRus)

datasaurus_dozen

library(tidyverse)
datasaurus_dozen <- as_tibble(datasaurus_dozen)
datasaurus_dozen

unique(datasaurus_dozen$dataset)

length(unique(datasaurus_dozen$dataset))
datasaurus_dozen$dataset %>% unique() %>% length()

mean(datasaurus_dozen$x)

datasaurus_dozen %>% 
  group_by(dataset) %>%
  summarise(mean_x = mean(x),
            mean_y = mean(y))

datasaurus_dozen %>% 
  group_by(dataset) %>%
  summarise(sd_x = sd(x),
            var_x = var(x),
            sd_y = sd(y))

datasaurus_dozen %>%
  #filter(dataset == "dino" | dataset == "bullseye") %>%
  ggplot(aes(x = x, y = y)) +
  geom_point(size = 2, alpha = 1, aes(colour = dataset)) +
  facet_wrap(~ dataset) +
  theme_void() +
  theme(legend.position = "none")
  #theme(strip.text = element_blank())

devtools::install_github("dgrtwo/gganimate")
library(gganimate)
dino <- datasaurus_dozen %>%
  ggplot(aes(x = x, y = y, frame = dataset)) +
  geom_point(size = 2, alpha = 1, aes(colour = dataset)) +
  #facet_wrap(~ dataset) +
  theme_void() +
  theme(legend.position = "none")
dino_anim <- gganimate(dino)
gganimate_save(dino_anim, title_frame = TRUE, filename = "dino.gif")
