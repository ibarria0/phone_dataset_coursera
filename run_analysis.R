library(reshape2)

#renaming function for activity
name_activity <- function(a) {
    if (a == 1) {
	"WALKING"
    } else if (a == 2) {
	"WALKING_UPSTAIRS"
    } else if (a == 3) {
	"WALKING_DOWNSTAIRS"
    } else if (a == 4) {
	"SITTING"
    } else if (a == 5) {
	"STANDING"
    } else if (a == 6) {
	"LAYING"
    }
}


#read features
features <- read.table('features.txt', sep=" ")
features_vector <- as.vector(features[,2])

#read test data
test_data <- read.table('test/X_test.txt')
activity_test <- read.table('test/y_test.txt')
subject_test <- read.table('test/subject_test.txt')
test_data[,'activity'] <- apply(activity_test,1,name_activity)
test_data[,'subject'] <- subject_test 
names(test_data) <- c(features_vector,"activity", 'subject')

#read train data
train_data <- read.table('train/X_train.txt')
activity_train <- read.table('train/y_train.txt')
subject_train <- read.table('train/subject_train.txt')
train_data[,'activity'] <- apply(activity_train,1,name_activity)
train_data[,'subject'] <- subject_train
names(train_data) <- c(features_vector,"activity", 'subject')

merged <- rbind(test_data,train_data);

data_mean <- sapply(merged,mean)
data_sd <- sapply(merged,sd)

melted <- melt(merged, id.vars = c("activity","subject"))
tidy <- dcast(melted, activity + subject ~ variable,mean)
write.csv(tidy, file='tidy.csv')
