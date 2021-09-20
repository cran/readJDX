## ----results = "hide", echo = FALSE-------------------------------------------
# We are going to display ~pre-formatted text in the code chunks
suppressPackageStartupMessages(library("readJDX"))
suppressPackageStartupMessages(library("mvbutils"))
rm(list = ls())
desc <- packageDescription("readJDX")
knitr::opts_chunk$set(echo = TRUE, eval = FALSE)

## -----------------------------------------------------------------------------
#  ##XYDATA= (X++(Y..Y))
#  
#  [followed by x, y1, y2, y3... data in AFFN or ASDF]

## -----------------------------------------------------------------------------
#  ##XYPOINTS= (XY..XY)
#  
#  [followed by x, y data in AFFN]

## -----------------------------------------------------------------------------
#  ##PEAK TABLE= (XY..XY)
#  
#  [followed by x, y data in AFFN]

## -----------------------------------------------------------------------------
#  ##NTUPLES= NMR
#  .
#  .
#  .
#  ##PAGE=  N=1
#  ##NPOINTS= xx
#  ##DATA TABLE= (X++(R..R)), XYDATA
#  [followed by x, y1, y2, y3... data in AFFN or ASDF]
#  .
#  .
#  .
#  ##PAGE=  N=2
#  ##NPOINTS= yy
#  ##DATA TABLE= (X++(I..I)), XYDATA
#  [followed by x, y1, y2, y3... data in AFFN or ASDF]
#  ##END NTUPLES= NMR
#  ##END=

## -----------------------------------------------------------------------------
#  ##NTUPLES= nD NMR SPECTRUM
#  .
#  .
#  .
#  ##PAGE=  F1= x
#  ##FIRST= x, y, z
#  ##DATA TABLE= (F2++(Y..Y)), PROFILE
#  [followed by x, y1, y2, y3... data in AFFN or ASDF]
#  .
#  .
#  .
#  ##PAGE=  F1= x
#  ##FIRST= x, y, z
#  ##DATA TABLE= (F2++(Y..Y)), PROFILE
#  [followed by x, y1, y2, y3... data in AFFN or ASDF]
#  .
#  .
#  .
#  ##PAGE=  F1= x
#  ##FIRST= x, y, z
#  ##DATA TABLE= (F2++(Y..Y)), PROFILE
#  [followed by x, y1, y2, y3... data in AFFN or ASDF]
#  ##END NTUPLES= nD NMR SPECTRUM
#  ##END=

## -----------------------------------------------------------------------------
#  ##NTUPLES= MASS SPECTRUM
#  .
#  .
#  .
#  ##PAGE=  T=1
#  ##NPOINTS= x
#  ##DATA TABLE= (XY..XY), PEAKS
#  [followed by x, y data in AFFN]
#  .
#  .
#  .
#  ##PAGE=  T=2
#  ##NPOINTS= x
#  ##DATA TABLE= (XY..XY), PEAKS
#  [followed by x, y data in AFFN]
#  .
#  .
#  .
#  ##PAGE=  T=n
#  ##NPOINTS= x
#  ##DATA TABLE= (XY..XY), PEAKS
#  [followed by x, y data in AFFN]
#  ##END NTUPLES= MASS SPECTRUM
#  ##END=

## ----PF, echo = FALSE, eval = TRUE, results = "hide", fig.cap = "Functions & the flow of file processing."----
tst <- foodweb(where = asNamespace("readJDX"), prune = "readJDX")

