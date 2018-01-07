## https://github.com/justmarkham/coursera-getting-data/blob/master/run_analysis.R

library(data.table)
library(dplyr)
library(plyr)
library(reshape2)


subject.test <- read.table("subject_test.txt")  
subject.train <- read.table("subject_train.txt")

set.test <- read.table("X_test.txt")
set.train <- read.table("X_train.txt") 

label.test <- read.table("y_test.txt")
label.train <- read.table("y_train.txt")
featureNames <- read.table("features.txt", stringsAsFactors = FALSE)  #returns 561 values
featureNames <- featureNames[,-c(1)]  #Dropping column1

## converting and renaming labels to activity names

label.test$V1 <- sapply(label.test$V1, switch,
                        "1" = "Walking",
                        "2" = "Walking_Upstairs",
                        "3" = "Walking_Downstairs",
                        "4" = "Sitting",
                        "5" = "Standing",
                        "6" = "Laying") 
names(label.test)[1] <- "activity"


label.train$V1 <- sapply(label.train$V1, switch,
                        "1" = "Walking",
                        "2" = "Walking_Upstairs",
                        "3" = "Walking_Downstairs",
                        "4" = "Sitting",
                        "5" = "Standing",
                        "6" = "Laying") 
names(label.train)[1] <- "activity"

# Chaning name columns to testing group

names(subject.test)[1] <- "subject"
names(set.test) <- featureNames
# Chaning name columns to training group

names(subject.train)[1] <- "subject"
names(set.train) <- featureNames

# Mutating Testing Group 
# using melt - convert data from wide format to long format

testing.df <- cbind(subject.test,set.test)

# We have duplicated columns: Our goal is to find the duplicated rows
# and then take the mean of the repeated ones (We cannot just avoid the repeated ones)

# First we convert to a matrix
testing.m <- as.matrix(testing.df)
# Changing row names as subject name
rownames(testing.m) <- testing.m[,1] 
testing.m <- testing.m[,-1] 

# Transpossing the matrix (I used melt, but the function doesn't contemplate duplicates)

testing.m <- t(testing.m)
# converting matrix to numeric
mode(testing.m) <- "numeric"


testing.conv <- sapply(by(testing.m,rownames(testing.m),colMeans),identity)
testing.conv <- cbind(testing.conv,subject=rownames(testing.conv))

testing.df <- as.data.frame(testing.conv, stringsAsFactors = FALSE)
rownames(testing.df) <- 1:nrow(testing.df)

# adding labels and group
testing.df <- cbind(testing.df, activity=label.test, group = "test")

# Now we can melt the data:

testing.df <- testing.df[c(478,479,480,1:477)]
str(testing.df)
testing.df[, 4:480] <- sapply(testing.df[, 4:480], as.numeric)

## checking duplicates
table(names(testing.df))
testing.df[ , duplicated(colnames(testing.df))]
#data frame with 0 columns and 2947 rows
testing.df.melt <- melt(testing.df, id.vars=c("subject","group","activity"), variable.name="feature", value.name="value") 


#### Now working with training group:

training.df <- cbind(subject.train,set.train)
training.m <- as.matrix(training.df)

rownames(training.m) <- training.m[,1] 
training.m <- training.m[,-1] 

training.m <- t(training.m)

mode(training.m) <- "numeric"

training.conv <- sapply(by(training.m,rownames(training.m),colMeans),identity)
training.conv <- cbind(training.conv,subject=rownames(training.conv))

training.df <- as.data.frame(training.conv, stringsAsFactors = FALSE)
rownames(training.df) <- 1:nrow(training.df)

training.df <- cbind(training.df, activity=label.train, group = "training")

# Now we can melt the data:

training.df <- training.df[c(478,479,480,1:477)]
training.df[, 4:480] <- sapply(training.df[, 4:480], as.numeric)

## checking duplicates
#table(names(training.df))
#training.df[ , duplicated(colnames(training.df))]
#data frame with 0 columns and 7352 rows

training.df.melt <- melt(training.df, id.vars=c("subject","group","activity"), variable.name="feature", value.name="value") 

## ALL MERGED DATA

# not melted
merged.data1 <- rbind.fill(training.df, testing.df)  
merged.data1 <- merged.data1 %>% arrange(subject)

# melted
merged.data <- rbind.fill(training.df.melt, testing.df.melt) 
merged.data$subject <- as.integer(merged.data$subject)
merged.data$subject <- as.integer(merged.data$subject)
merged.data <- merged.data %>% arrange(subject)

 
#######################  STEP 2 ###########################

#Extracts only the measurements on the mean and standard deviation for each measurement. 


patterns <- c("mean", "std")

## using a filter with result of logical
merged.data.mean.sd <- filter(merged.data, grepl(paste(patterns, collapse = "|"), feature ))


######################### STEP 3 and 4 ###################################

# Uses descriptive activity names to name the activities in the data set

#already in the dataset.

#table(merged.data.mean.sd$activity)

# Appropriately labels the data set with descriptive variable names.

#removing parenthesis:

merged.data.mean.sd$feature <- gsub("\\(|\\)", "", merged.data.mean.sd$feature , perl  = TRUE)

# correcting the syntax:

merged.data.mean.sd$feature <- make.names(merged.data.mean.sd$feature)

# correcting descriptive names

merged.data.mean.sd$feature <- gsub("^t", "Time", merged.data.mean.sd$feature)
merged.data.mean.sd$feature <- gsub("^f", "Frequency", merged.data.mean.sd$feature)
merged.data.mean.sd$feature <- gsub("Acc", "Aceleration", merged.data.mean.sd$feature)
merged.data.mean.sd$feature <- gsub("Mag", "Magnitude", merged.data.mean.sd$feature)
merged.data.mean.sd$feature <- gsub("Freq", "Frequency", merged.data.mean.sd$feature)

###################### STEP 5 ##################


# From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject


tidy.data <- dcast(merged.data.mean.sd, subject + activity ~ feature, fun.aggregate = mean)

tidy.data <- dcast(me, subject + activity ~ feature, fun.aggregate = mean)


## This command is for exporting STEP 1 - the tidy data from the beginning:
write.csv(merged.data1,file="tidy.csv", row.names=FALSE)

# The required txt from the course:

#write.table(tidy.data,file="tidydata.txt", row.name=FALSE)



