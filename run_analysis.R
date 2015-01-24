
library(dplyr)

#reads the features file and filter it by meand ans std
features <- read.table("./data/UCI HAR Dataset/features.txt")
clean_features <- features[c(grep("std",features$V2), grep("mean",features$V2)), ]

#read activities and rows, add the activity
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

train_rows <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
train_rows <- cbind(row_id=1:nrow(train_rows),train_rows)
train_rows <- merge(train_rows, activity_labels, by.x = "V1", by.y = "V1")
train_rows <- arrange(train_rows, row_id)

test_rows <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
test_rows <- cbind(row_id=1:nrow(test_rows),test_rows)
test_rows <- merge(test_rows, activity_labels, by.x = "V1", by.y = "V1")
test_rows <- arrange(test_rows, row_id)

#read subjects
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names = c("subject_id"))
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names = c("subject_id"))

#read the data, select mean and std and add subject
train_data <- read.table("./data/UCI HAR Dataset/train/X_train.txt", col.names= features$V2)
train_data <- train_data%>%
    select(clean_features$V1)
train_data <- cbind(activity_name=train_rows$V2, subject_train, train_data)

test_data <- read.table("./data/UCI HAR Dataset/test/X_test.txt", col.names= features$V2)
test_data <- test_data%>%
    select(clean_features$V1)
test_data <- cbind(activity_name =test_rows$V2, subject_test, test_data)

#combine both tables
complete <- rbind(test_data, train_data)

#The average of each variable
tidy_data <- complete%>%
    group_by(activity_name,subject_id)%>%
    summarise_each(funs(mean))

write.table(tidy_data,"tidy_data_set.txt", row.name=FALSE)