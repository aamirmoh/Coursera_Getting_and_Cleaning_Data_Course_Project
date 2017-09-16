#download File and unzip to your working directory 
# folder name is UCI HAR Dataset
library(dplyr)
#Load Features into a dataframe
featuresDF <- read.table("UCI HAR Dataset/features.txt")
featuresDF$V2 <- as.character(feature$V2) #is.character(feature$V2) is FALSE. Convert it into a character
activityDF  <- read.table("UCI HAR Dataset/activity_labels.txt")
activityDF$V2 <- as.character(activityDF$V2)
colnames(activityDF) <- c("activityID","activityType")

# the idea is to make the features vector the columns for the train and test data sets

#combine training data together
trainingDF <- read.table("UCI HAR Dataset/train/X_train.txt")
colnames(trainingDF) <- featuresDF$V2

trainingActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
colnames(trainingActivities) <- c("activityID")

trainingSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
colnames(trainingSubjects) <- c("subjectID")
#combine them together
trainingDF <- cbind(trainingSubjects, trainingActivities, trainingDF)


#combine test data together
testDF <- read.table("UCI HAR Dataset/test/X_test.txt")
colnames(testDF) <- featuresDF$V2

testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
colnames(testActivities) <- c("activityID")

testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
colnames(testSubjects) <- c("subjectID")
#combine them together
testDF <- cbind(testSubjects, testActivities, testDF)

#union the two data sets

allDF <- rbind(trainingDF,testDF)
ListofMeanStdDevColumnsRequired  <-grep(".mean*|.std*", featuresDF$V2, value = TRUE)

#cut the dataframe for the mean and std deviation columns only
allDF <- allDF[,c("subjectID","activityID",ListofMeanStdDevColumnsRequired)]

#Clean columns of allDF 

colnames(allDF) <- gsub("\\()","",colnames(allDF))
colnames(allDF) <- gsub("-std","StdDev",colnames(allDF))
colnames(allDF) <- gsub("-mean","Mean",colnames(allDF))
colnames(allDF) <- gsub("^(t)","Time",colnames(allDF))
colnames(allDF) <- gsub("^(f)","Freq",colnames(allDF))
colnames(allDF) <- gsub("([Gg]ravity)","Gravity",colnames(allDF))
colnames(allDF) <- gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colnames(allDF))
colnames(allDF) <- gsub("[Gg]yro","Gyro",colnames(allDF))
colnames(allDF) <- gsub("[Mm]ag","Magnitude",colnames(allDF))
colnames(allDF) <- gsub("[Aa]cc","Acceleration",colnames(allDF))
#merge allDF with Activity Data Set
mergedData <- merge(allDF, activityDF, by.x="activityID", by.y = "activityID", all = TRUE)

#From the data set in step 4, creates a second, independent tidy data set with the average of 
#each variable for each activity and each subject

#remove activityID column from the data set
tidyDataSet <- select(mergedData,-(activityID)) %>%
    group_by(subjectID,activityType) %>%
        summarise_all(mean)

write.table(tidyDataSet, "tidyDataSet.txt", row.names = FALSE) #Drop the row names to ensure data is written correctly into the file
#if you want to load the data in excel: use space as delimiter
