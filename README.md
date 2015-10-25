# GettingAndCleaningDataAssignment
#########

Original dataset as per assignment:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


The script "run_analysis.R" performs all the steps to produce the result dataset "meanValueDataset.txt".

The steps are:
+ load the list of features from 'features.txt'
+ select all features that contain 'mean()' and 'std()'
+ use the selected features to load only the requred columns from 'x_train.txt' and 'x_test.txt'
+ load the activity labels from 'activity_labels.txt'
+ load the activity data from y_train.txt and y_test.txt
+ replace the activity ids with their respective label
+ load the subjet data 'subject_train.txt' and 'subject_test.txt'
+ concatenate the columns for subject, activity and the features for both training and test data
+ concatenate the resulting rows for training and test data
+ store the intermediate result dataset --> 'combinedData.txt' (not in repo)
+ calculate the mean values for all feature columns grouped by subject id and activity label
+ store the final dataset --> 'meanValueDataset.txt'

The codebook for this dataset is in meanValueDataset_readme.txt.


