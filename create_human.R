#Jakob Leino 
#New script file for data wrangling 
#Link to data: http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt

library(stringr)
library(dplyr)

human <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt", sep  =",", header = T, dec = ".")
str(human)
dim(human)

#This is a dataset consisting of 195 observations and 19 variables. The datasat takes a look at different indexes such as the Human Development Index (HDI) and Global Inequality Index (GII). It also looks at some other measures of well being within the target area.
?read.table

