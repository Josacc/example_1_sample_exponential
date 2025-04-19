library(tidyverse)
library(readxl)
library(plotly)
library(scales)
library(xfun)

plot_fun <- function(n, beta, unit_time) {

  if (unit_time > 1) {
    x_lab <- str_c(n2w(unit_time, cap = TRUE), ' units of time')
  } else {x_lab <- str_c(n2w(unit_time, cap = TRUE), ' unit of time')}

  ggplot(data.frame(x = c(0, unit_time)), aes(x)) +
    stat_function(
      fun   = function(x) exp((-x * n) / beta),
      geom  = 'line',
      n     = 1000,
      color = 'blue'
    ) +
    theme_light() +
    xlab(x_lab) +
    ylab('Probability') +
    scale_y_continuous(labels = scales::percent)

}

