#Jakob 11.12.2021 Data wrangling
library(dplyr)
library(tidyr)

BPRS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep  =" ", header = T)
names(BPRS)
str(BPRS)
dim(BPRS)
summary(BPRS)
RATS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", header = TRUE, sep = '\t')
names(RATS)
str(RATS)
dim(RATS)
summary(RATS)
#Looked at the data and it's structure. Each data variable is in a seperate column, making it wide form data. Did the same procedure for both datasets.

BPRS$treatment <- factor(BPRS$treatment)
BPRS$treatment <- factor(BPRS$subject)

RATS$ID <- factor(RATS$ID)
RATS$Group <- factor(RATS$Group)
#Here I converted the categorical variables from each dataset into factors.

BPRSL <-  BPRS %>% gather(key = weeks, value = bprs, -treatment, -subject)
BPRSL <-  BPRSL %>% mutate(week = as.integer(substr(weeks,5,5)))

RATSL <- RATS %>%
  gather(key = WD, value = Weight, -ID, -Group) %>%
  mutate(Time = as.integer(substr(WD,3,4))) 
#I converted both the datasets to long form data and added a "week" variable for the BPRS dataset and "Time" variable for the RATS dataset.

colnames(BPRSL)
str(BPRSL)
summary(BPRSL)

colnames(RATSL)
str(RATSL)
summary(RATSL)
#Long data is distinct from wide data in that it contains one column containing all the values and has another column listing the context of the value. This allows us to take a look at how the values change over time.

write.csv(BPRSL, file = "BPRSL.csv")
write.csv(RATSL, file = "RATSL.csv")
