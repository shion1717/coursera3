#Start Step 1 
    #Load libraries
library(dplyr)

    #Load train and test datasets, and merge
train <- read.fwf(file = "train/X_train.txt", widths = c(rep(16,561)))
    test  <- read.fwf(file = "test/X_test.txt", widths = c(rep(16,561)))
    data <- rbind(train,test)

    #Load train and test activity, and merge
    #Load activity labels, left join to activity
train_act <- read.csv(file = "train/y_train.txt", header = FALSE)
    test_act <- read.csv(file = "test/y_test.txt", header = FALSE)
    activity <- rbind(train_act,test_act)
    
    activity <- left_join(activity, read.csv(file = "activity_labels.txt", header = FALSE, sep = " ", as.is = TRUE))
    activity$V2 <- as.factor(activity$V2)
    
    #Step 3: Add in Activity label to main dataset
    data <- cbind(data, activity$V2)
    #End Step 3
    
    #Load train and test subjects, and merge
train_sub <- read.csv(file = "train/subject_train.txt", header = FALSE)
  test_sub <- read.csv(file = "test/subject_test.txt", header = FALSE)
  subjects <- rbind(train_sub,test_sub)
  
    #Add in subject label to main dataset
  data <- cbind(data, subjects$V1)
    
    #Step 4: Load in column labels to label columns of dataset
labels <- read.csv(file = "features.txt", sep = " ", header = FALSE)
    labels$V2 <- as.character(labels$V2)
    colnames(data) <- c(labels$V2, "activity", "subject" )

#End Step 1
#Start step 2

    #Get vector of all column numbers which include "mean()" and "std()", and activity label
meanstd <- sort(c(grep("mean()",colnames(data), fixed = TRUE),grep("std()",colnames(data), fixed = TRUE),562,563))

    #Subset dataset
data <- data[,meanstd]

#End Step 2
#Start Step 5
  #Save dataset to csv file "tidied data.csv"
write.csv(data, file = "tidied data.csv")

  #Summarise means of all observations by activity and subject
df <- tbl_df(data) %>%
          group_by(activity,subject) %>%
              summarise_all(mean)

  #Save dataset to csv file "tidyaverage by activity and subject.csv"
write.csv(df, file = "tidyaverage by activity and subject.csv")

  #Remove all other variables except for data and df
rm(list=setdiff(ls(), c("data","df")))

#End Step 5