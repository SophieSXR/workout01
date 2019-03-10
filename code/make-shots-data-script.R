## title: make-shots-data
## description: This scipt is meant for data preparation.
## inputs: "stephen-curry.csv", "klay-thomspon.csv", "kevin-durant.csv" ,"andre-iguodala.csv", "draymond-green.csv"
## outputs: "stephen-curry-summary.csv", "klay-thomspon-summary.csv", "kevin-durant-summary.csv" ,"andre-iguodala-summary.csv", "draymond-green-summary.csv", "shots-data.csv", "shots-data-summary.csv"


# Data Preparation

#read in the five data sets
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)

#add a column name to each imported dataframe
curry$name<-rep("Stephen Curry",1250)
thompson$name<- rep("Klay Thompson", 1220)
durant$name <- rep("Kevin Durant",915)
iguodala$name<- rep("Andre Iguodala", 371)
green$name<- rep("Graymond Green",578)

#change the values of shot_made_flag to more descriptive value 
curry$shot_made_flag[curry$shot_made_flag=="n"]<-"shot_no"
curry$shot_made_flag[curry$shot_made_flag=="y"]<-"shot_yes"

thompson$shot_made_flag[thompson$shot_made_flag=="n"]<-"shot_no"
thompson$shot_made_flag[thompson$shot_made_flag=="y"]<-"shot_yes"

durant$shot_made_flag[durant$shot_made_flag=="n"]<-"shot_no"
durant$shot_made_flag[durant$shot_made_flag=="y"]<-"shot_yes"

iguodala$shot_made_flag[iguodala$shot_made_flag=="n"]<-"shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag=="y"]<-"shot_yes"

green$shot_made_flag[green$shot_made_flag=="n"]<-"shot_no"
green$shot_made_flag[green$shot_made_flag=="y"]<-"shot_yes"

#add a column minute that contains the minute number where a shot occurred
curry$minute <- curry$period * 12 - curry$minutes_remaining
thompson$minute <- thompson$period * 12 - thompson$minutes_remaining
durant$minute <- durant$period * 12 - durant$minutes_remaining
iguodala$minute <- iguodala$period * 12 - iguodala$minutes_remaining
green$minute <- green$period * 12 - green$minutes_remaining

#send the summary output of each imported data frame
setwd("../output")
sink("stephen-curry-summary.txt")
print(summary(curry))
sink()
sink("klay-thompson-summary.txt")
print(summary(thompson))
sink()
sink("andre-iguodala-summary.txt")
print(summary(iguodala))
sink()
sink("graymond-green-summary.txt")
print(summary(green))
sink()
sink("kevin-durant-summary.txt")
print(summary(durant))
sink()
#now the current working directory is output

#stack the tables into one single data frame
shots_data<-rbind(curry,durant,green,iguodala,thompson)

#export the assembled table as a CSV file to the folder data
setwd("../data")
write.csv(shots_data, file = "shots-data.csv")

#send the summary output of the assembled table
setwd("../output")
sink("shots-data-summary.txt")
print(summary(shots_data))
sink()

