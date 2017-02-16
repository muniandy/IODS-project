#Mahes Muniandy 30.01.2017 
# data wrangling for exercise 5 


#read the data
hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

#check the data
#see the structure of hd
str(hd)
#see the dimension of lrn2014
dim(hd)
#184 rows and 60 columns
head(hd)
summary(hd)

str(gii)
#see the dimension of lrn2014
dim(gii)
#184 rows and 60 columns
head(gii)
summary(gii)

#rename variables
names(hd)[3] <- "HDI_Index"
names(hd)[4] <- "life_exp"
names(hd)[5] <- "exp_edu"
names(hd)[6] <- "avg_edu"
names(hd)[7] <- "GNI_per_cap"
names(hd)[8] <- "GNI_HDI_rank_diff"

colnames(hd)

#rename variables
names(gii)[3] <- "GII_Index"
names(gii)[4] <- "mat_mor_rat"
names(gii)[5] <- "adol_birth_rat"
names(gii)[6] <- "fem_parlimen"
names(gii)[7] <- "fem_high_edu"
names(gii)[8] <- "male_high_edu"
names(gii)[9] <- "fem_working"
names(gii)[10] <- "male_working"
colnames(gii)

#mutate gender inequality data
# access the 'tidyverse' packages dplyr and ggplot2
library(dplyr); 
library(plyr)

# define 2 new columns in gii data
gii <- mutate(gii, gii_FM_edu_rat = fem_high_edu / male_high_edu)
gii <- mutate(gii, gii_FM_work_rat = fem_working / male_working)
colnames(gii)

#join the data
hd$Country
gii$Country

#join both datasets by Country
human=join(hd, gii,type = "inner")

human$Country

#write data to file
write.table(human, file = "human.txt", quote = FALSE, sep = "\t", row.names = FALSE, col.names = TRUE) 

