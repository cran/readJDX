## ----results = "hide", echo = FALSE-------------------------------------------
library("readJDX")
rm(list = ls())

desc <- packageDescription("readJDX")
set.seed(999)
knitr::opts_chunk$set(tidy = TRUE,
  fig.height = 7, fig.width = 7,
  fig.fullwidth = TRUE, echo = FALSE)

