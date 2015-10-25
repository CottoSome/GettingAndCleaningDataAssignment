
library(data.table)
library(dplyr)

# read the feature table
featData <- fread('UCI HAR Dataset/features.txt')
# label the columns
featData <- rename(featData, FeatureID=V1, FeatureName=V2)
# get the indices of all features with mean- and standard deviation values
featIdx <- sort(union(grep('std()', featData$FeatureName, fixed = TRUE), 
                      grep('mean()', featData$FeatureName, fixed = TRUE)))
# extract the corresponding feature names
featNames <- featData$FeatureName[featIdx]

# load the x-training data. only load required columns
xtrainPath <- file.path('UCI HAR Dataset', 'train', 'x_train.txt')
xTrainData <- fread(xtrainPath, select = featIdx, col.names = featNames)

# load the activity labels
activityLabData <- fread('UCI HAR Dataset/activity_labels.txt')
# label the columns
activityLabData <- rename(activityLabData, ActivityID=V1, ActivityName=V2)

# load the y-training data (activity)
ytrainPath <- file.path('UCI HAR Dataset', 'train', 'y_train.txt')
ytrainData <- fread(ytrainPath)
# label the column
ytrainData <- rename(ytrainData, ActivityID=V1)

# replace the activity IDs with their corresponding label
activityTrainData <- merge(ytrainData, activityLabData, by='ActivityID', 
                           sort=FALSE) %>% select(ActivityName)

# load subject training data
subjectTrainData <- fread('UCI HAR Dataset/train/subject_train.txt')
# label the column
subjectTrainData <- rename(subjectTrainData, SubjectID=V1)

# put the subject id, the activity description and the training data together
trainingData <- cbind(subjectTrainData, activityTrainData, xTrainData)


# load the x-test data. only load required columns
xTestPath <- file.path('UCI HAR Dataset', 'test', 'x_test.txt')
xTestData <- fread(xTestPath, select = featIdx, col.names = featNames)

# load the y-training data (activity)
yTestPath <- file.path('UCI HAR Dataset', 'test', 'y_test.txt')
yTestData <- fread(yTestPath)
# label the column
yTestData <- rename(yTestData, ActivityID=V1)

# replace the activity IDs with their corresponding label
activityTestData <- merge(yTestData, activityLabData, by='ActivityID', 
                           sort=FALSE) %>% select(ActivityName)

# load subject test data
subjectTestData <- fread('UCI HAR Dataset/test/subject_test.txt')
# label the column
subjectTestData <- rename(subjectTestData, SubjectID=V1)

# put the subject id, the activity description and the test data together
testData <- cbind(subjectTestData, activityTestData, xTestData)


# concatenate the training and test tables
allData <- rbind(trainingData, testData)

# save the aggregated data
write.table(allData, 'UCI HAR Dataset/combinedData.txt', row.names = FALSE)

# calculate the means of all variables grouped by subject id and activity
allMeanData <- allData[, lapply(.SD, mean), by = .(SubjectID,ActivityName)]

# save the mean value dataset 
write.table(allMeanData, 'UCI HAR Dataset/meanValueDataset.txt', 
            row.names = FALSE)


