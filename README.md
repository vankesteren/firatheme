# firatheme

Work in progress. Builds on the [trafford data lab theme](https://github.com/traffordDataLab/assets/blob/master/theme/ggplot2/theme_lab.R).

```R
ggplot(mtcars, aes(x = mpg*0.43, y = wt*0.4535924, colour = factor(cyl))) +
       geom_point(size = 2) + geom_smooth(se = FALSE) +
       labs(title = "Car weight vs efficiency",
            x = "Efficiency (km/l)",
            y = "Weight (1000 kg)",
            colour = "Cylinders") +
       theme_fira()

firaSave("plot.png", device = "png", dpi = 300)
```
![plt](./img/plot.png)


```R
ggplot(chickwts, aes(x = feed, y = weight)) + 
  geom_bar(stat = "identity", width=0.8, fill = ejCols[1]) + 
  labs(title = "Chicken weights by feed type", 
       y = "Weight (grams)",
       x = "") + 
  theme_fira()
```

![chk](./img/chick.png)


```R
ggplot(airquality, aes(y = Ozone, x = 1:nrow(airquality))) + 
  geom_line(colour = ejCols[2], size = 0.7) + 
  geom_point(colour = ejCols[2], size = 1.7) + 
  geom_smooth(colour = ejCols[1], size = 0.7,se = FALSE) + 
  labs(title = "Ozone in New York", x = "Days") + 
  theme_fira()
```

![oz](./img/ozone.png)


# Colours

`ejCols`
![col](./img/ejcols.png)

`valiCols`
![val](./img/valicols.png)

`ejPalette()`
![cols](./img/ejpalette.png)
