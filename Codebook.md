# Codebook #

This is the codebook for the **tidy_data.txt** file in this repo.

The **tidy_data.txt** file is the output of the **run_analysis.R** script, which uses data from the [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#) project.

In that project, experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity was captured at a constant rate of 50Hz.

See the **READme.md** file in this repo for a detailed explanation of how the **run_analysis.R** script works.

**Dimensions**

The **tidy_data.txt** file has dimensions 181 by 68.

The file contains **180 observations**. For every combination of 30 subjects and 6 activities the corresponding row shows the mean of multiple measurements within each of 66 types of measurement.

This codebook describes each variable in the tidy data file.

### List of variables ###

* subjectID
* activityType
* meanTimeBodyAccMeanX
* meanTimeBodyAccMeanY
* meanTimeBodyAccMeanZ
* meanTimeBodyAccStdX
* meanTimeBodyAccStdY
* meanTimeBodyAccStdZ
* meanTimeGravityAccMeanX
* meanTimeGravityAccMeanY
* meanTimeGravityAccMeanZ
* meanTimeGravityAccStdX
* meanTimeGravityAccStdY
* meanTimeGravityAccStdZ
* meanTimeBodyAccJerkMeanX
* meanTimeBodyAccJerkMeanY
* meanTimeBodyAccJerkMeanZ
* meanTimeBodyAccJerkStdX
* meanTimeBodyAccJerkStdY
* meanTimeBodyAccJerkStdZ
* meanTimeBodyGyroMeanX
* meanTimeBodyGyroMeanY
* meanTimeBodyGyroMeanZ
* meanTimeBodyGyroStdX
* meanTimeBodyGyroStdY
* meanTimeBodyGyroStdZ
* meanTimeBodyGyroJerkMeanX
* meanTimeBodyGyroJerkMeanY
* meanTimeBodyGyroJerkMeanZ
* meanTimeBodyGyroJerkStdX
* meanTimeBodyGyroJerkStdY
* meanTimeBodyGyroJerkStdZ
* meanTimeBodyAccMagMean
* meanTimeBodyAccMagStd
* meanTimeGravityAccMagMean
* meanTimeGravityAccMagStd
* meanTimeBodyAccJerkMagMean
* meanTimeBodyAccJerkMagStd
* meanTimeBodyGyroMagMean
* meanTimeBodyGyroMagStd
* meanTimeBodyGyroJerkMagMean
* meanTimeBodyGyroJerkMagStd
* meanFreqBodyAccMeanX
* meanFreqBodyAccMeanY
* meanFreqBodyAccMeanZ
* meanFreqBodyAccStdX
* meanFreqBodyAccStdY
* meanFreqBodyAccStdZ
* meanFreqBodyAccJerkMeanX
* meanFreqBodyAccJerkMeanY
* meanFreqBodyAccJerkMeanZ
* meanFreqBodyAccJerkStdX
* meanFreqBodyAccJerkStdY
* meanFreqBodyAccJerkStdZ
* meanFreqBodyGyroMeanX
* meanFreqBodyGyroMeanY
* meanFreqBodyGyroMeanZ
* meanFreqBodyGyroStdX
* meanFreqBodyGyroStdY
* meanFreqBodyGyroStdZ
* meanFreqBodyAccMagMean
* meanFreqBodyAccMagStd
* meanFreqBodyAccJerkMagMean
* meanFreqBodyAccJerkMagStd
* meanFreqBodyGyroMagMean
* meanFreqBodyGyroMagStd
* meanFreqBodyGyroJerkMagMean
* meanFreqBodyGyroJerkMagStd

### Variable descriptions ###

**subjectID**

The subjectID denotes the subject (person) whose activity was measured. Values are from 1 to 30.

**activityType**

The type of activity that was measured. For each subjectID, the following 6 activities were measured.

* Walking
* Walking upstairs
* Walking downstairs
* Sitting
* Standing
* Laying

#### Measurement variables ####

* All measurement features are either **Acc** (accelerometer) or **Gyro** (gyroscope) measurements;
* **Acc** features were measured in 'g's (gravity of earth -> 9.80665 m/seg2);
* **Gyro** features were measured in rad/seg;
* All features are normalized to [-1,1];

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

All of the 66 measurement variables have names that are composed of different parts.

The meaning of these parts are: 

**Body**

Signal based on the body of the subject, one of two components derived from the time based signals on the phone's accelerometer

**Freq**

Measurement based on the "frequency" domain, taken as a Fast Fourier Transform of the time-based signals.

**Gravity**

Signal based on gravity. Gravity is the second of the two measurement components derived from the phone's accelerometer.

**Gyro**

Measurement taken from the gyroscope on the phone.

**Jerk**

Measurement of sudden movement, based on body acceleration and angular velocity.

**Mag**

Measurement of the magnitude of the Euclidean norm (i.e. length of a vector from the origin) of a three-dimensional signal.

**Mean**

Indicates that the measurement is a mean within the original Human Activity Recognition data set.
 
**mean**

Indicates that the measurement is a mean in the tidy dataset taken over all measurements for a particular activity for a subject for a given feature (variable) from the original Human Activity Recognition data set.

**Stdev**

Indicates that the measurement is a standard deviation within the original Human Activity Recognition data set.
 
**Time**

Measurement based on the "time" domain. Measurements taken from the phone were measured at a frequency of 50Hz, meaning 50 discrete measurements per second.

**X**

Measurement taken along the "X" dimension of the phone, as in a three-dimensional Cartesian coordinate system of X, Y and Z.

**Y**

Measurement taken along the "Y" dimension of the phone, as in a three-dimensional Cartesian coordinate system of X, Y and Z.

**Z**

Measurement taken along the "Z" dimension of the phone, as in a three-dimensional Cartesian coordinate system of X, Y and Z.
