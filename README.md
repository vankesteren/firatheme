# firatheme

Work in progress

```R
setupFont()

ggplot(data.frame(x = 1:10, y = c(exp(1:10))), aes(x, y)) +
  geom_point() +
  geom_line() +
  ggtitle("This graph is true") +
  xlab("Amount of Fira") +
  ylab("Niceness of the plot") +
  theme_fira()

firasave()
```
