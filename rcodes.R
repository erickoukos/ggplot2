rm(list = ls())

install.packages("palmerpenguins", dependencies = T)
install.packages("ggthemes", dependencies = T)

library(ggplot2)
library(ggthemes)
library(tidyverse)
library(palmerpenguins)
library(patchwork)


penguins

glimpse(penguins)
table(penguins$species)

# Creating a ggplot

ggplot(data = penguins)

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
)


ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point()


ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, colour = species)
) +
  geom_point()


ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, colour = species)
) +
  geom_point() +
  geom_smooth(method = "lm")



ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(colour = species)) +
  geom_smooth(method = "lm")

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(colour = species, shape = species)) +
  geom_smooth(method = "lm")



ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(colour = species, shape = species)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Body Mass vs Flipper Length",
    subtitle = "Various Penguin Species",
    x = "Flipper Length (mm)",
    y = "Body Mass (g)",
    color = "Species", shape = "Species",
  ) +
  scale_color_colorblind()

plot1 <- ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point()

attach(mtcars)
plot2 <- ggplot(mtcars, aes(x = mpg, y = wt)) + 
  geom_point()


plot1 + plot2 + plot_annotation(
  title = "Two Plots",
  caption = "Plotted by Erick"
)

ggplot(penguins, aes(x = species)) + 
  geom_bar()


ggplot(penguins, aes(x = fct_infreq(species))) + 
  geom_bar()


ggplot(penguins, aes(x = species)) + 
  geom_bar(stat = "count", aes(label = ..count..), vjust = 0.5, size = 5) +
  geom_text(label = "value"), vjust = 0.5, size = 5) +
  theme_minimal()
