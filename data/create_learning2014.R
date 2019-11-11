# This file is for the exercises of the course 06.11.19

#__________________________________________#
# 2.
#The data is read into R
learning14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)

# Here I check the structure and dimensions of the data
# There are total of 183 observations with 60 variables.
dim(learning14)

# Most of the variables seem to be integers with values between 1-5
# Some variables have integer between 0 and 55
# One of the variables is factor type
# describing the sex of the participants of the study
str(learning14)

# Here I Check the minimum and maximum values of a few variables
min(learning14$Age)
min(learning14$Attitude)
min(learning14$Points)
max(learning14$Age)
max(learning14$Attitude)
max(learning14$Points)



##________________________________##

# 3. Create an analysis dataset with the 
#variables gender, age, attitude, deep, stra, surf and points 
#by combining questions in the learning2014 data, 
#as defined in the datacamp exercises and also on the bottom part 
#of the following page (only the top part of the page is in Finnish). 
#http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS2-meta.txt. 
#Scale all combination variables to the original scales (by taking the mean).
#Exclude observations where the exam points variable is zero. 
#(The data should then have 166 observations and 7 variables) (1 point)
library(dplyr)
analysis_columns <- c("gender","Age","Attitude","deep","stra","surf","Points")
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

# Here I select the deep learning columns and create column 'deep' by averaging them
deep_columns <- select(learning14, one_of(deep_questions))
learning14$deep <- rowMeans(deep_columns)

# select the surface learning columns and create column 'surf' by averaging them
surface_columns <- select(learning14, one_of(surface_questions))
learning14$surf <- rowMeans(surface_columns)

# select the strategic learning columns and create column 'stra' by averaging them
strategic_columns <- select(learning14, one_of(strategic_questions))
learning14$stra <- rowMeans(strategic_columns)

# Here I Create the analysis_dataset
analysis_dataset <- select(learning14, one_of(analysis_columns))
head(learning14)
head(analysis_dataset)
str(analysis_dataset)

# Here I remove rows where Points = 0 AND Check that the structure is right (166 obs. and 7 variables)
analysis_dataset <- filter(analysis_dataset, Points != 0)
str(analysis_dataset)

#__________________________________________#

# 4. library(readxl) #this library has possibilities
# Here I am setting the working directory.
setwd("~/IODS-project")
getwd()
