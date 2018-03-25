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
![plt](img/plot.png)

# Colours

`ejCols`
![col](img/ejcols.png)

`valiCols`
![val](img/valicols.png)

`ejPalette()`
![cols](img/ejpalette.png)
