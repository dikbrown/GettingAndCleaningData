# Week 4 Assignment for Coursera course: Getting and Cleaning Data

Experimental data were retrieved from smartphone motion tests. Each experiment consisted of a subject wearing a Samsung smart phone while performing various activities. The accelerometer and gyroscope in the phone each recorded measurements at a rate of 50 Hz (i.e., 50 times per second) to get time domain data. Measurements were recorded in overlapping 2.56 second windows and summary data (mean, min, max, etc.) were generated from each window from the raw data. The time domain data were also submitted to a Fast Fourier Transform to yield frequency domain data.

Each data variable has several parts to its name:
	1. "t" (time domain) or "f" (frequency domain)
	2. "Gravity" or "Body" measurements
	3. Acc (accelerometer) or Gyro (gyroscope) measurement
	4. X, Y, or Z, representing signals along the three directions
	5. Mag (Euclidean 3D magnitude of the signal)
	6. Jerk signals
	7. mean or std calculation (other summary variables were calculated, but were not used in this analysis).

In total, 561 variables were thus obtained. Eliminating all but the mean and std columns resulted in only 79 variables being considered.

Files used to prepare the tidy data set include:
  - 'activity_labels.txt': Links numeric labels with activity name
  - 'features.txt': List of all measurement types (features)
  - 'X_test.txt' & 'X_train.txt': Testing and training data sets, containing 561 different measurements. 
  - 'Y_test.txt' & 'Y_train.txt': numeric activity label for each row of data in the X_xxxx.txt files
  - 'subject_test.txt' & 'subject_train.txt': subject ids identifying the subject who performed the activity for each row of data in the X_xxxx.txt files

From the 'subject_xxxx.txt' and 'Y_xxxx.txt' files, new columns were added and given the variable names "subject" and "activity".

The final tidy data set consists of averages for each variable over all experiments for each subject id and activity.
