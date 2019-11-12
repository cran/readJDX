### R code from vignette source 'MiniDIFDUP_1.Rnw'

###################################################
### code chunk number 1: setup
###################################################
suppressPackageStartupMessages(library("stringr"))


###################################################
### code chunk number 2: getData
###################################################
mdd <- system.file("extdata", "MiniDIFDUP.JDX", package = "readJDX")
lines <- readLines(mdd)


###################################################
### code chunk number 3: rawLines
###################################################
print(lines[17:18])


###################################################
### code chunk number 4: namedRawLines
###################################################
names(lines) <- paste("Line", 1:length(lines), sep = "_")
print(lines[17:18])


###################################################
### code chunk number 5: lineList
###################################################
# The following code is from decompLines

lineNames <- names(lines) # save to replace when functions nuke

# Helper Function
nameComp <- function(cvec) { # cvec = character vector
  	names(cvec) <- rep(NA_character_, length(cvec))
  	names(cvec)[grepl("[@A-Ia-i]{1}", cvec)] <- "SQZ"
  	names(cvec)[grepl("[%J-Rj-r]{1}", cvec)] <- "DIF"
  	names(cvec)[grepl("[S-Zs]{1}", cvec)] <- "DUP"
  	names(cvec)[!grepl("[@%A-Za-rs]", cvec)] <- "NUM" # anything else is a NUM/AFFN
  	cvec
}

# Preliminaries
lines <- gsub(",", ".", lines) # replace ',' with '.' -- needed for EU style files
lines <- gsub("\\s+\\${2}.*$", "", lines) # remove any ...xxxx  $$ checkpoint type entries
lines <- gsub("(\\+|-){1}([0-9]+)", " \\1\\2", lines) # put space ahead of +|- signs (PAC)
lines <- str_trim(lines, side = "both") # remove extra white space
lines <- str_replace_all(lines, "([@%A-Za-rs])", " \\1") # break into pieces by compression mode

# Convert to list to process each piece separately
lines <- as.list(lines)
names(lines) <- lineNames # replace the names that were nuked

FUN <- function(x) {unlist(strsplit(x, "\\s+"))}
lines <- lapply(lines, FUN)

# Name each entry by compression mode
lines <- lapply(lines, nameComp) # name each entry by the compression mode

print(lines[17])


###################################################
### code chunk number 6: unDIFinput
###################################################
line17 <- unlist(lines[17])
names(line17) <- gsub("Line_[0-9]*\\.", "", names(line17)) # names were whacked during unlisting
print(line17)


###################################################
### code chunk number 7: repDUPsinput
###################################################
print(line17[21])


