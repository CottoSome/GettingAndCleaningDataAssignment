# Getting and cleaning data Assingment
# Codebook for the result dataset stored in 'meanValueDataset.txt'
#######

This codebook refers to the original data description 'README.txt and 
'features_info.txt' of the original dataset from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###

The first column 'SubjectID' contains the subject ids from the original 
datatables in 'train/subject_train.txt' and 'test/subject_test.txt'.
Quote: Each row identifies the subject who performed the activity 
for each window sample. Its range is from 1 to 30. 


The second column 'ActivityName' contains the activity description from the 
tables in 'train/y_train.txt' and 'test/y_test.txt' where their numeric values
have been replaced with their descriptions from 'activity_labels.txt'.
I.e. their value is one of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,
SITTING, STANDING or LAYING.


The subsequend columns contain values following the description of 
'features_info.txt'. For example 'tBodyAcc-mean()-X' contains mean values of 
the body acceleration time domain signal in x-axis direction.
The only difference to the original signals is that in this dataset the value 
is the mean value of all such signal values of the training and test dataset 
grouped by the values of column 1 and 2. 

