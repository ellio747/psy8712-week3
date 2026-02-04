# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Data Import and Cleaning
raw_df <- read.csv("data/week3.csv")
raw_df$timeStart <- as.POSIXct(raw_df$timeStart, tz = "", "%Y-%m-%d %H:%M:%S")
raw_df$timeEnd <- as.POSIXct(raw_df$timeEnd, tz = "", "%Y-%m-%d %H:%M:%S")
clean_df <- subset(raw_df, subset = raw_df$timeEnd > "2017-06-30") #June 2017 was cutoff (RA = 6)
clean_df <- subset(clean_df, subset = clean_df$q6 == 1) #removed 3 failed attention check