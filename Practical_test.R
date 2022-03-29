# This is a practice class test. 
# The test uses the file called UFO.csv. 
# This file is available on Blackboard.

# Q1 
# Store the ufo data into a data frame called ufo_data
# Show the structure of the UFO data frame as well as the first 15 rows
# Count the number of rows within the UFO data frame
# confirm there are 89071 rows
ufo_data <- read.csv("ufo.csv")
str(ufo_data)
head(ufo_data, n = 15)
nrow(ufo_data)

# Q2 
# Convert datetime field from chr to date variable.
# The current date structure is represented in mm/dd/yyyy format
datetime_as_date_str <- as.Date(ufo_data$datetime, "%m/%d/%Y")
str(datetime_as_date_str)

# Q3 
# Update the UFO data frame with the new date structure.
# And prove that the date structure
ufo_data$datetime <- datetime_as_date_str
str(ufo_data)
str(ufo_data$datetime)

# Q4
# Using the names() function, display the names of the UFO data frame
# modify the variable names shown in the table
# Prove that the variable names have changed
names(ufo_data)[6] <- "DurationSeconds"
names(ufo_data)[7] <- "DurationHrsMins"
names(ufo_data)[9] <- "DatePosted"
names(ufo_data)

names(ufo_data)[names(ufo_data) == "duration..seconds."] <- "DurationSeconds"
names(ufo_data)[names(ufo_data) == "duration..hours.min."] <- "DurationHrsMins"
names(ufo_data)[names(ufo_data) == "date.posted"] <- "DatePosted"

# Q5
# Convert latitude variable from chr to numerical variable
# Recode the variable so that it is a numerical variable
# Then show the new structure of the data frame
str(ufo_data$latitude)
ufo_data$latitude <- as.integer(ufo_data$latitude)
str(ufo_data)

# Q6
# Using the mice and VIM libraries
# display the number of missing variables in the UFO data frame
# How many records have no missing data content?
# How many variables have the datetime records missing?
# Which variable has the largest number of missing data points?
# What percent of data is available without missing data points?
library(mice)
md.pattern(ufo_data)

library(VIM)
missing_values <- aggr(ufo_data, prop = FALSE, number = TRUE)
as.numeric()


