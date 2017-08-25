#!/bin/bash

# This script will automatically download and prepare the data for the
# analyses in R.

# Assume you're in the right directory, else move to the data directory.
# cd ../data

# Download and unzip the Divvy data from 2017
wget https://s3.amazonaws.com/divvy-data/tripdata/Divvy_Trips_2017_Q1Q2.zip
# wget https://s3.amazonaws.com/divvy-data/tripdata/Divvy_Trips_2017_Q3Q4.zip
unzip Divvy_Trips_2017_Q1Q2.zip
# unzip Divvy_Trips_2017_Q3Q4.zip

# Arrange the files a bit better and clean up (delete) files that we
# won't need for the data analysis.
rm -f *.zip
mv -f Divvy_Trips_2017_Q1Q2/* .
rmdir Divvy_Trips_2017_Q1Q2
rm -f README.txt

# Combine the trip data into a single file.
head -n 1 Divvy_Trips_2017_Q1.csv > header.txt
cat Divvy_Trips_2017_Q1.csv Divvy_Trips_2017_Q2.csv | \
# cat Divvy_Trips_2017_Q1.csv Divvy_Trips_2017_Q2.csv \
# Divvy_Trips_2017_Q3.csv Divvy_Trips_2017_Q4.csv | \y
grep -v trip_id > temp.txt
cat header.txt temp.txt > Divvy_Trips_2017.csv

# Clean up the rest of the files that are not needed.
rm -f Divvy_Trips_2017_*.csv
rm -f header.txt temp.txt