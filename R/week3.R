# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Data Import and Cleaning
raw_df <- read.csv("../data/week3.csv")
raw_df$timeStart <- as.POSIXct(raw_df$timeStart, tz = "", "%Y-%m-%d %H:%M:%S")
raw_df$timeEnd <- as.POSIXct(raw_df$timeEnd, tz = "", "%Y-%m-%d %H:%M:%S")
clean_df <- subset(raw_df, subset = raw_df$timeEnd >= "2017-07-01") #June 2017 was cutoff (RA = 6)
clean_df <- subset(clean_df, subset = clean_df$q6 == 1) #removed 3 failed attention check

# Analysis
clean_df$timeSpent <- difftime(time1 = clean_df$timeEnd, time2 = clean_df$timeStart, units = "secs")
hist(as.numeric(clean_df$timeSpent)) #Was asked to recast timeSpent first; coerce to as.numeric as difftime variable type cannot go in hist()
frequency_tables_list <- lapply(clean_df[,5:14], table)
lapply(frequency_tables_list, barplot)
sum((clean_df$q1 >= clean_df$q2) & (clean_df$q2 != clean_df$q3)) # sum when both conditions are TRUE = 21
for (i in frequency_tables_list) { barplot(i) 
}
