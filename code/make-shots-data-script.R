# Title: hw02  Shot Data for NBA Players
# Description:
#   Data preparation for 5 NBA players
#1. read data
#2. manipulate data
#3. export summaries
4. export shots_data.csv

# Input(s):
#    "andre-iguodala.csv","draymond-green.csv", "kevin-durant.csv", "klay-thompson.csv", "stephen-curry.csv"
# Output(s): "andre-iguodala-summary.txt","draymond-green-summary.txt","kevin-durant-summary.txt","klay-thompson-summary.txt","stephen-curry-summary.txt","shots-data-summary.txt"
# Author(s): Huiqing Fu
# Date: 03-01-2018

# packages
library(readr)    # importing data
library(dplyr)    # data wrangling
library(ggplot2)  # graphics

## 3) Data Preparation (20 pts)

setwd("../data")

iguodala <- read.csv("../data/andre-iguodala.csv")
green<- read.csv("../data/draymond-green.csv")
curry<- read.csv("../data/stephen-curry.csv")
thompson<- read.csv("../data/klay-thompson.csv",stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv",stringsAsFactors = FALSE)

# Add a column name to each imported data frame, that contains the name of the corresponding player
iguodala <- cbind(player="Andre Iguodala", iguodala )
green <- cbind(player="Draymond Green", green)
curry <- cbind(player="Stephen Curry", curry)
thompson <- cbind(player="Klay Thompson", thompson )
durant <- cbind(player="Kevin Durant", durant )


#Change the original values of shot_made_flag to more descriptive values: replace "n" with "missed shot", and "y" with "made shot". Hint: you can use logical subsetting for this operation (no need to use programming structures that we haven¡¦t covered yet).
iguodala$shot_made_flag <- as.character(iguodala$shot_made_flag)
iguodala$shot_made_flag[iguodala$shot_made_flag == "n"] <- "missed shot"
iguodala$shot_made_flag[iguodala$shot_made_flag == "y"] <- "made shot"

green$shot_made_flag <- as.character(green$shot_made_flag)
green$shot_made_flag[green$shot_made_flag == "n"] <- "missed shot"
green$shot_made_flag[green$shot_made_flag == "y"] <- "made shot"

curry$shot_made_flag <- as.character(curry$shot_made_flag)
curry$shot_made_flag[curry$shot_made_flag == "n"] <- "missed shot"
curry$shot_made_flag[curry$shot_made_flag == "y"] <- "made shot"

thompson$shot_made_flag <- as.character(thompson$shot_made_flag)
thompson$shot_made_flag[thompson$shot_made_flag == "n"] <- "missed shot"
thompson$shot_made_flag[thompson$shot_made_flag == "y"] <- "made shot"

durant$shot_made_flag <- as.character(durant$shot_made_flag)
durant$shot_made_flag[durant$shot_made_flag == "n"] <- "missed shot"
durant$shot_made_flag[durant$shot_made_flag == "y"] <- "made shot"


#Add a column minute that contains the minute number where a shot occurred. For instance, if a shot took place during period = 1 and minutes_remaining = 8, then this should correspond to a value minute = 4. Likewise, if a shot took place during period = 4 and minutes_remaining = 2 then this should correspond to a value minute = 46. Hint: you can use logical subsetting for these operations (no need to use programming structures that we haven¡¦t covered yet).
iguodala <- mutate(iguodala, minute=12*period-minutes_remaining )
green <- mutate(green, minute=12*period-minutes_remaining )
curry <- mutate(curry, minute=12*period-minutes_remaining )
thompson <- mutate(thompson, minute=12*period-minutes_remaining )
durant <- mutate(durant, minute=12*period-minutes_remaining )


# Use sink() to send the summary() output of each imported data frame into individuals text files: andre-iguodala-summary.txt, draymond-green-summary.txt, etc. During each sinking operation, the produced summaries should be sent to the output/folder using relative paths.

sink("../output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

sink("../output/klay-thompson-summary.txt")
summary(thompson)
sink()

sink("../output/draymond-green-summary.txt")
summary(green)
sink()

sink("../output/stephen-curry-summary.txt")
summary(curry)
sink()

sink("../output/kevin-durant-summary.txt")
summary(durant)
sink()



# Use the row binding function rbind() to stack the tables into one single data frame (or tibble object).
dat <- rbind(iguodala, thompson, green, curry, durant)

# Export (i.e. write) the assembled table as a CSV file shots-data.csv inside the folder data/. Use a relative path for this operation.
write.csv(dat, file = "../data/shots-data.csv")

# Use sink() to send the summary() output of the assembled table. Send this output to a text file named shots-data-summary.txt inside the output/ folder. Use a relative path when exporting the R output.
sink("../output/shots-data-summary.txt")
summary(dat)
sink()
