library(tidyr)
library(dplyr)

# read in all data
    # label data
    activitylabels <- read.table("data/activity_labels.txt")
    featurelabels <- read.table("data/features.txt")
    
    # remove non-alphanumeric characters from labels
    featurelabels[,2] <- gsub("-", "", featurelabels[,2])
    featurelabels[,2] <- gsub("\\(\\)", "", featurelabels[,2])
    featurelabels[,2] <- gsub(",", "to", featurelabels[,2])
    

    # actual data
    x.test <- read.table("data/x_test.txt")
    x.train <- read.table("data/x_train.txt")

    # activity corresponding to "x" data
    y.train <- read.table("data/y_train.txt")
    y.test <- read.table("data/y_test.txt")

    # subject corresponding to "x" data
    subject.test <- read.table("data/subject_test.txt")
    subject.train <- read.table("data/subject_train.txt")
    
# convert activity from numeric to label (e.g., from "1" to "walking")
    num.to.label <- function(x) {activitylabels[x,2]}
    act.train <- sapply(y.train, num.to.label)
    act.test <- sapply(y.test, num.to.label)

# combine test data into one table
    #add activity and subject labels
    test <- cbind(subject.test, act.test, x.test)
    train <- cbind(subject.train, act.train, x.train)
    
    # name all columns
    names(test) <- c("subject", "activity", featurelabels[,2])
    names(train) <- c("subject", "activity", featurelabels[,2])

    # extract relevant columns - column numbers of mean and standard deviations
    datatopull <- c(1, 2, grep("subject|activity|*mean*|*std*", featurelabels[,2]) + 2)
    
    # combine test and train data using only mean and std columns
    data <- as_tibble(rbind(test[,datatopull], train[,datatopull]))
    
# Group data set by subject and activity
    by_activity <- group_by(data, subject, activity)
    
# Create tidy data set    
    result <- summarize(by_activity, 
                        across(tBodyAccmeanX:fBodyBodyGyroJerkMagmeanFreq, mean))

       
write.csv(result, "Tidy.csv", row.names = FALSE)
