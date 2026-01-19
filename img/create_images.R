library(ggplot2)

ggplot(mtcars, aes(x = mpg * 0.43, y = wt * 0.4535924, colour = factor(cyl))) +
  geom_point(size = 2) +
  geom_smooth(se = FALSE) +
  labs(
    title = "Car weight vs efficiency",
    x = "Efficiency (km/l)",
    y = "Weight (1000 kg)",
    colour = "Cylinders"
  ) +
  theme_fira() +
  scale_colour_fira() +
  facet_wrap(vars(cyl), labeller = label_both)

firaSave("img/plot.png", device = "png", bg = "white")

ggplot(chickwts, aes(x = feed, y = weight)) +
  geom_bar(stat = "identity", width=0.8, fill = firaCols[1]) +
  labs(title = "Chicken weights by feed type",
       y = "Weight (grams)",
       x = "") +
  theme_fira()
firaSave("img/chick.png", device = "png", bg = "white")

ggplot(iris, aes(y = Sepal.Length, x = Species, fill = Species)) +
  geom_boxplot(col = firaCols[4], width = 0.5, size = 1) +
  labs(y = "Sepal Length", title = "Iris data") +
  theme_fira() +
  scale_fill_fira() +
  theme(legend.position = "none")
firaSave("img/iris.png", device = "png", bg = "white")

ggplot(airquality, aes(y = Ozone, x = 1:nrow(airquality))) +
  geom_line(colour = firaCols[2], size = 0.7) +
  geom_point(colour = firaCols[2], size = 1.7) +
  geom_smooth(colour = firaCols[1], size = 0.7, se = FALSE) +
  labs(title = "Ozone in New York", x = "Days") +
  theme_fira()
firaSave("img/ozone.png", device = "png", bg = "white")


ggplot(mtcars, aes(x = mpg * 0.43, y = wt * 0.4535924, colour = factor(cyl))) +
  geom_point(size = 2) +
  labs(
    title = "Car weight vs efficiency",
    subtitle = "By number of cylinders (cyl) and manual transmission (am = 1)",
    x = "Efficiency (km/l)",
    y = "Weight (1000 kg)",
    colour = "Cylinders"
  ) +
  theme_fira(facet = TRUE) +
  scale_colour_fira(guide = "none") +
  facet_grid(cols = vars(cyl), rows = vars(am), labeller = label_both)

ggsave("img/facet.png", width = 9, height = 6, dpi = 150, bg = "white")


png("img/firacols.png", width = 1500, height = 600, res = 300)
par(mar = rep(1,4))
barplot(rep(1, 5), col = firaCols, axes = FALSE, border = NA)
dev.off()

png("img/firapalette.png", width = 1500, height = 600, res = 300)
par(mfrow = c(2, 2), mar = rep(0.3,4))
for (n in c(2, 3, 10, 25))
  barplot(rep(1, n), col = firatheme::firaPalette(n), axes = FALSE, border = NA)
dev.off()
