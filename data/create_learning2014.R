#Mahes Muniandy 30.01.2017 
# one sentence file description as a comment on the top of the script file. 
# Access the dplyr library
library(dplyr)
getwd()
setwd("data")

lrn14 = read.table("JYTOPKYS3-data.txt", 
               sep="\t",header=TRUE)
#see the structure of lrn2014
#all the variables are of type integer except for gender which is of type factor
str(lrn14)
#see the dimension of lrn2014
dim(lrn14)
#183 rows and 60 columns
head(lrn14)

# questions related to deep, surface and strategic learning
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

# select the columns related to deep learning and create column 'deep' by averaging
deep_columns <- select(lrn14, one_of(deep_questions))
surface_columns <- select(lrn14, one_of(surface_questions))
strategic_columns <- select(lrn14, one_of(strategic_questions))

lrn14$deep <- rowMeans(deep_columns)
lrn14$surface <- rowMeans(deep_columns)
lrn14$strategic <- rowMeans(deep_columns)

#subset gender, age, attitude, deep, stra, surf and points 
lrn14_selected=lrn14[,c("gender", "Age", "Attitude", "deep", "surface", "strategic", "Points" )]
str(lrn14_selected)

#Exclude observations where the exam points variable is zero. 
lrn14_selected<-lrn14_selected[which(lrn14_selected$Points > 0 ),]
dim(lrn14_selected)

#Write lrn14_selected to folder data
write.table(lrn14_selected, file = "learning2014.txt", quote = FALSE, sep = "\t", row.names = FALSE, col.names = TRUE)
read.table(file = "learning2014.txt", 
                          header = TRUE,
                          sep = "\t")

str(lrn14_selected)
head(lrn14_selected)
dim(lrn14_selected)