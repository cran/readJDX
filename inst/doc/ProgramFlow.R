## ----results = "hide", echo = FALSE--------------------------------------
library("readJDX")
suppressPackageStartupMessages(library("kableExtra"))
rm(list = ls())

desc <- packageDescription("readJDX")
set.seed(999)
knitr::opts_chunk$set(tidy = TRUE,
  fig.height = 7, fig.width = 7,
  fig.fullwidth = TRUE, echo = FALSE)

## ----progFlow, results = "asis"------------------------------------------
fName <- c(
  "readJDX",
  "- findVariableLists",
  "- extractParams",
  "- processVariableList",
  "- - decompressXYY", # 5
  "- - - decompLines",
  "- - - - getComp",
  "- - - - unSQZ",
  "- - - - insertDUPs",
  "- - - - - repDUPs", # 10
  "- - - - deDIF",
  "- - - - - unDIF",
  "- - - - yValueCheck"
  )

fInput <- c(
  "file name",
  "character vector: all lines from original file",
  "character vector: just the metadata lines",
  "character vector: a single VL",
  "character vector: a single VL", # 5
  "character vector: a single VL",
  "character vector: a single VL",
  "character vector: named with the ASDF mode, called via lapply",
  "character vector: named with the ASDF mode, called via lapply",
  "a string of length one", # 10
  "*list* of character vectors from a single VL; the character vectors are named with the ASDF mode, the list is named with line numbers",
  "character vector: one line from VL, entries named by ASDF code",
  "*list* of character vectors from a single VL; the character vectors are named with the ASDF mode, the list is named with line numbers"
  )

DF <- data.frame(fName, fInput)
names(DF) <- c("function", "input")

kable(DF, "latex", booktabs = TRUE, caption = "Program Flow.\\label{tab:PF}") %>% kable_styling(latex_options = c("striped", "hold_position")) %>% footnote(general = c("VL stands for variable list, as defined in the JCAMP-DX standard. For examples see the *MiniDIFDUP_1* vignette."))

