## ----SetUp, echo = FALSE, eval = TRUE, results = "hide"----
# R options & configuration:

rm(list = ls())
options(width =  50, show.signif.stars = FALSE)

suppressPackageStartupMessages(library("readJDX"))
suppressPackageStartupMessages(library("knitr"))

desc <- packageDescription("readJDX")
vers <- paste("Package Version ", desc$Version, sep = "")

# Stuff specifically for knitr:

opts_chunk$set(out.width = "0.8\\textwidth", fig.align = "center", fig.width = 7, fig.height = 7,
	echo = FALSE, cache = FALSE)

# Note: defaults are eval = TRUE, echo = TRUE

