# Getting and Cleaning Data Coure Assignment Codebook

## The data

The Human Activity Recognition Using Smartphones Data Set is downloaded from the UCI Machine Learning Repository site <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones> 


### Data information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

## Instruction list

1. Install the dplyr package by running `install.packages("dplyr")` if you do not already have it installed. The script was written with dplyr version 0.8.0.1.

2. Run the run_analysis script `source("run_analysis.R")`


### Tidy dataset

The `run_analysis.R` script generates a table called `tidy_mean_summary_table.txt`. The script downloads the data from the UCI website, merges the training and test data, selects the mean and standard deviation measurements and computes the participant's average value for each measurment for each activity. Variable names are modified to be descriptive. 


#### Variable Description

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals TimeAccelerometer-XYZ and
TimeGyroscope-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (TimeBodyAccelerometer-XYZ and TimeGravityAccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (TimeBodyAccelerometerJerk-XYZ and TimeBodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (TimeBodyAcceleromterMagnitude, TimeGravityAccelerometerMagnitude, TimeBodyAccelerometerJerkMagnitude, TimeBodyGyroscopeMagnitude, TimeBodyGyroscopeJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing FrequencyBodyAccelerometer-XYZ, FrequencyBodyAccelerometerJerk-XYZ, FrequencyBodyGyroscope-XYZ, FrequencyBodyAccelerometerJerkMagnitude, FrequencyBodyGyroscopeMagnitude, FrequencyBodyGyroscopeJerkMagnitude. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

#### Column headers

* `subject` - Participant number (1-30)
* `activity` - activity participant was doing during measurement
* Begins with `Time` - Time domain signals
* Begins with `Frequency` - Frequency domain signals following fast fourier transformation
* Conatins `Body` - body acceleration signal
* Contains `Gravity` - gravity acceleration signal
* Contains `Accelerometer` - signal from accelerometer
* Contains `Gyroscope` - signal from gyroscope
* Contains `Jerk` - body linear acceleratin and angular velocity derived in time to obtain jerk signals
* Contains `Magnitude` - magnitude of signals calculated using Euclidean Norm
* Contains `Mean` - mean measurement
* Contains `Std` - standard deviation of measurement
* Contains `MeanFrequency` - mean frequency measurement
* Ends with `X` - x axial measurement
* Ends with `Y` - y axial measurement
* Ends with `Z` - z axial measurement

#### Activities

* walking
* walking_upstairs
* walking_downstairs
* sitting
* standing
* laying

