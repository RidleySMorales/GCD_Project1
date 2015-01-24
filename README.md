# GCD_Project1
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

#A brief description of the script:
The run_analysis.R script merges data from:  

* features.txt: List of all features.
* activity_labels.txt: List of class labels and their activity name.
* train/X_train.txt: Training set.
* train/y_train.txt: Training labels.
* train/subject_train.txt: ID's of subjects in the training data.
* test/X_test.txt: Test set.
* test/y_test.txt: Test labels.
* test/subject_test.txt: ID's of subjects in the training data.

To produces a tidy data set which may be used in the future. The step to produce the tidy data set are described next:

* First reads the features file and subset it by mean and std.
* Reads y_train.txt and y_test.txt and merges them with the activity labels.
* Reads the subject_train.txt and subject_test.txt.
* Reads the X_test.txt and Y_test.txt and Select the mean and std fields then add the subject_id field.
* Combine both Train and Test data frames.
* Group by Subject_id and Activity_name and compute the mean.
* Finally, print the results in tidy_data_set.txt.
