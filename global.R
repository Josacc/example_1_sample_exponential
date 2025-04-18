library(tidyverse)
library(readxl)
library(plotly)
library(scales)

plot_fun <- function(n, beta) {

  ggplot(data.frame(x = c(0, 1)), aes(x)) +
    stat_function(
      fun   = function(x) 100 * exp((-x * n) / beta),
      geom  = 'line',
      n     = 1000,
      color = 'blue'
    ) +
    theme_light() +
    xlab('One unit of time') +
    ylab('Probability (%)')

}


plot_fun(10, 5)
