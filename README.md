## Repository for Coursera: Getting and Cleaning Data submission

This project is a submission for the Coursera course: Getting and Cleaning Data, which looks at wearable computing.

The data is obtained from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Run the run_analysis.R script (the dplyr library is required) to obtain an output of 2 datasets:
  1) All the means and standard devation of each measurement, labelled by activity and subject ("tidied data.csv")
        This is done by the:
          a) Appending the test dataset to the train dataset
          b) Labelling the observations with the subject and activity
          c) Assigning appropriate column headers via the "features.txt" file
          d) Extracting all columns containing the mean and standard deviation of each measurement

  2) The average measurements in the 1st dataset of activity and subject ("tidyaverage by activity and subject.csv")
         This is done using the dplyr library, grouping the earlier dataset by activity and subject, then summarising it.

The code book and explanation of each variable is found in the "features_info.txt" file.

The full list of variables is found in the "features.txt" file.

The rest of the files in this repository contains the data obtained.
