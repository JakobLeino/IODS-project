#Jakob Leino 
#New script file for data wrangling 
#Link to data: http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt

library(stringr)
library(dplyr)

human <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt", sep  =",", header = T)
str(human)
dim(human)

#This is a dataset consisting of 195 observations and 19 variables. The datasat takes a look at different indexes such as the Human Development Index (HDI) and Global Inequality Index (GII). It also looks at some other measures of well being within the target area.
is.numeric(human$GNI)
human$GNI <- gsub(",",".",human$GNI)
human$GNI <- as.numeric(human$GNI)
is.numeric(human$GNI)

#Converted the variable GNI from a character variable to a numeric variable and checked if it was numeric

keep <- c("Country", "Edu2.FM", "Labo.FM", "Edu.Exp", "Life.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F")
human <- select(human, one_of(keep))
data.frame(human[-1], comp = complete.cases(human))
human <- filter(human, complete.cases(human))

#Excluded unneeded variables and removed all rows with missing values
tail(human, 10)
last <- nrow(human) - 7
human <- human[1:last, ]
rownames(human) <- human$Country
human <- select(human, -Country)

#Removed the observations which relate to regions and not countries. Also defined the row names by the country names and removed the country name column.

dim(human)
?write.csv
write.csv(human, file = "human.csv", row.names = TRUE)
