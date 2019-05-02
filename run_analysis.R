
library(dplyr)

# Create data directory if it does not alread exist
if (!file.exists("data")) {
        dir.create("data")
}

zipfile<- "./data/UCIdata.zip"
data <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Download data if it has not already been downloaded
if (!file.exists(zipfile)) {
        download.file(data, destfile = zipfile, method = "curl")
        unzip(zipfile, exdir = "./data/")
}


features <- read.table("./data/UCI HAR Dataset/features.txt")
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt") 
activity_labels$V2 <- tolower(activity_labels$V2)
colheaders <- features$V2


# Merge training data with subject and activity labels
train_data <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
colnames(train_data) <- colheaders
train_subject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt",header = FALSE, col.names = c("subject"))
train_activity <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header = FALSE)
train_activity <- left_join(train_activity, activity_labels) %>% 
        select(V2) %>% 
        rename(activity = V2)
train <- cbind(train_subject, train_activity, train_data)

# Merge test data with subject and activity labels
test_data <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
colnames(test_data) <- colheaders
test_subject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names = c("subject"))
test_activity <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header = FALSE)
test_activity <- left_join(test_activity, activity_labels) %>% 
        select(V2) %>%
        rename(activity = V2)
test <- cbind(test_subject, test_activity, test_data)

# Merge test and train data
merged_data <-rbind(test,train)

# Select mean and standard deviation columns and relabel column headers
cols_to_keep <- grep("subject|activity|mean|std", colnames(merged_data))
small_table <- merged_data[,cols_to_keep]
colnames(small_table) <- gsub("^t", "Time", colnames(small_table), ignore.case = FALSE)
colnames(small_table) <- gsub("Freq|^f", "Frequency", colnames(small_table), ignore.case = FALSE)
colnames(small_table) <- gsub("Acc", "Accelerometer", colnames(small_table), ignore.case = FALSE)
colnames(small_table) <- gsub("BodyGyro", "Gyroscope", colnames(small_table), ignore.case = FALSE)
colnames(small_table) <- gsub("()", "", fixed = TRUE, colnames(small_table))
colnames(small_table) <- gsub("-", "", colnames(small_table))
colnames(small_table) <- gsub("Mag", "Magnitude", colnames(small_table), ignore.case = FALSE)
colnames(small_table) <- gsub("mean", "Mean", colnames(small_table), ignore.case = FALSE)
colnames(small_table) <- gsub("std", "Std", colnames(small_table), ignore.case = FALSE)



# tidy data table of mean for each variable
tidy_table <- small_table %>% 
        group_by(subject, activity) %>%
        summarise_each(list(mean))

# Write tidy table
write.table(tidy_table, "tidy_mean_summary_table.txt", sep = "\t", row.names = FALSE)

