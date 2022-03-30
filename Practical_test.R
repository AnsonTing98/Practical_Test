# This is a practice class test. 
# The test uses the file called UFO.csv. 
# This file is available on Blackboard.

# Q1 
# Store the ufo data into a data frame called ufo_data
# Show the structure of the UFO data frame as well as the first 15 rows
# Count the number of rows within the UFO data frame
# confirm there are 89071 rows
ufo_data <- read.csv("ufo.csv", na = "")
str(ufo_data)
head(ufo_data, n = 15)
nrow(ufo_data)

# Q2 
# Convert datetime field from chr to date variable.
# The current date structure is represented in mm/dd/yyyy format
datetime_as_date_str <- as.Date(ufo_data$datetime, "%m/%d/%Y")
class(datetime_as_date_str)
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
names(ufo_data)

# Q5
# Convert latitude variable from chr to numerical variable
# Recode the variable so that it is a numerical variable
# Then show the new structure of the data frame
str(ufo_data$latitude)
ufo_data$latitude <- as.numeric(ufo_data$latitude)
str(ufo_data)

# Q6
# Using the mice and VIM libraries
# display the number of missing variables in the UFO data frame
# How many records have no missing data content?
sum(!is.na(ufo_data))
# How many variables have the datetime records missing?
sum(is.na(ufo_data$datetime))
# Which variable has the largest number of missing data points?
# What percent of data is available without missing data points?
sum(!is.na(ufo_data)) * 100 / prod(dim(ufo_data))

sum(complete.cases(ufo_data))

sum(is.na(ufo_data$longitude))

ufo_data[!is.na(ufo_data$X),]
sum(is.na(ufo_data$X))

library(mice)
md.pattern(ufo_data, rotate.names = TRUE)

library(VIM)
missing_values <- aggr(ufo_data, prop = FALSE, number = TRUE)
summary(missing_values)

sum(missing_values[["missings"]][["Count"]])

sum(!is.na(ufo_data))

# Q7
# Decide what to do with your missing data. Then apply your suggestion. 
# How many records have you deleted from the ufo data frame?
ufo_data$X

# Q8
# Sort UFO data frame firstly by shape and then by city. 
# extract only the columns datetime, city, country and shape 
# and store the content into a data frame called sorted_ufo_data. 
# Display the first 15 rows of data in this new data frame. 
# And show the new data frame structure
ufo_data <- ufo_data[order(ufo_data$shape, ufo_data$city),]
sorted_ufo_data <- subset(ufo_data, select = c("datetime", 
                                               "city", 
                                               "country", 
                                               "shape"))
sorted_ufo_data <- ufo_data[c("datetime", "city", "country", "shape")]
head(sorted_ufo_data, n = 15)

# Q9
# Using the subset() function
# find all entries in the UFO data frame where the country equals “gb” 
# and the shape variable equals “disk”
# Store the contents in a data frame called ufo_gb_disk
# Prove that there are 111 records in ufo_gb_disk.
ufo_gb_disk <- subset(ufo_data, 
                      ufo_data$country == "gb" & ufo_data$shape == "disk")
nrow(ufo_gb_disk)

# Q10
# Using the write.csv() command
write.csv(ufo_gb_disk, file = "ufo_gb_disk.csv")


new_data <- na.omit(ufo_data)
new_data

colSums(is.na(ufo_data))
(sum(is.na(ufo_data))/prod(dim(ufo_data))) *100
prod(dim(ufo_data))
dim(ufo_data)
sum(is.na(ufo_data))
