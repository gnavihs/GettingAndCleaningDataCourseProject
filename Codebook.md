1. Loading data:
I split data into 'test' and 'train' variables according to the data sets provided: 

subject_train 
X_train 
y_train 
subject_test 
X_test
y_test 
labels
features

2. Merging data:

Then I created new data frames by merging 'test' and 'train' data sets and saved new data sets into variables:

X_Total 
y_Total
subject_Total

3. Then I extracted only the mean and standard deviation values for each measurement. For this I
used features vector created above to grep only relevant values.

'FeaturesNames_Mean_STD'


4. Then I labeled the data set with descriptive variable names:
'subject' and 'exercise'  And  binded all the data in a single data set:
'Total'

5. Finally, I created tidy data set with averages and wrote it on the disk into a file. I used 
plyr package for this.

Thanks!