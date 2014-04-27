### CodeBook

1. The data is extracted from space delimted files at ./test and ./train.
2. Activity and Subject data is stored separatedly. I assumed that the ordering in the files is correct (corresponding to features).
2. No transformations are done on the actual files


### Parsing

1. Data from test and train datasets is stored in test_data and train_data data frames.
2. Activity and Subject columns are added to each data frame.
2. A function is applied to each dataset to rename the activity column to descriptive labels.
3. Data frames are merged using rbind.

### Analysis

1. Mead and SD are calculated using sapply on the merged data frame.
2. Merged data frame is reshaped (melt) to create a "independent tidy data set with the average of each variable for each activity and each subject."
3. Dcast is used to calculate the mean and standard deviation.
4. Data Frame is written to a tidy.csv file.
