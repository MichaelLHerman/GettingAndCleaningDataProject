
install.packages("doBy")
library(doBy)

#read in column names
features = read.table("./UCI HAR Dataset/features.txt", sep=" ",  stringsAsFactors = FALSE, col.names=c("colindex", "colname"))

#filter to only "mean()" and "std()" columns
columnsToSelect <- features[grep("mean\\(|std\\(", features$colname),]

#generate friendlier labels using string substitutions on existing column names
columnsToSelect$newcolname <- lapply(strsplit(columnsToSelect$colname, c("-")), function(x) { 
  firstletter <- substring(x[1],1,1)
  rest <- substring(x[1],2)
  
  rest <- sub("Acc", "accelerometer", rest)
  rest <- sub("Gyro", "gyroscope", rest)
  rest <- sub("Mag", "magnitude", rest)
  
  # X, Y, Z, if exists in factor name
  if (length(x) ==  3)
    v = x[3]
  else
    v = ""
  
  if (firstletter == "f")
    domain = ".frequency"
  else
    domain = ""
  
  operation <- x[2]
  #remove ()
  operation <- sub("\\(\\)", "", operation)
  tolower(paste0(rest,v,operation,domain))
  })


#read in activity labels
activity_labels = read.table("./UCI HAR Dataset/activity_labels.txt", sep=" ", stringsAsFactors = FALSE, col.names=c("activityid", "activityname"))


#read in training data
rawtraindata =  read.table("./UCI HAR Dataset/train/X_train.txt")

#select subset of columns in training data
selectedtrainData = rawtraindata[,columnsToSelect$colindex]

#rename columns with pretty names
colnames(selectedtrainData) <- columnsToSelect$newcolname

#read in training data subject  and activity column
subjectstraindata =  read.table("./UCI HAR Dataset/train/subject_train.txt", col.names=c("subject"))
activitytraindata =  read.table("./UCI HAR Dataset/train/y_train.txt", col.names=c("activity"))

#apply labels to activity to make factor
activity <- factor(activitytraindata[,1], labels=activity_labels$activityname)

#add columns to train data
completeTrainData <- cbind(selectedtrainData, subjectstraindata, activity)

#
#repeat for test data
#

#read in test data
rawtestdata =  read.table("./UCI HAR Dataset/test/X_test.txt")
#select subset of columns in test data
selectedtestData = rawtestdata[,columnsToSelect$colindex]
#rename columns with pretty names
colnames(selectedtestData) <- columnsToSelect$newcolname

#read in test data subject  and activity column
subjectstestdata =  read.table("./UCI HAR Dataset/test/subject_test.txt", col.names=c("subject"))
activitytestdata =  read.table("./UCI HAR Dataset/test/y_test.txt", col.names=c("activity"))

#apply labels to activity to make factor
activity <- factor(activitytestdata[,1], labels=activity_labels$activityname)

#add columns to test data
completeTestData <- cbind(selectedtestData, subjectstestdata, activity)

#merge train and test data
completeData <- rbind(completeTrainData, completeTestData)

#average all columns by activity and subject and write to file
groupedSummary <- summaryBy(.~activity+subject, data=completeData, FUN=mean, keep.names=TRUE)
write.table(groupedSummary, "groupedsummary.txt", row.name=FALSE)
groupedSummary
