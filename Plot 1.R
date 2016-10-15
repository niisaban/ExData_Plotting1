## The aim of this project is to provide a R code that is capable of plotting 4 pre-defined graphs or plots
Obtain the full dataset by downloading the file into a data folder

dataset_url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
## Unzip the file
unzip("Dataset.zip", exdir = "Dataset")
setwd("C:/Users/Abdulrahman/Documents/Coursera/Exploratory Data Analysis/Dataset")
files <- list.files("household_power_consumption", recursive = TRUE)

## Reading, naming and subsetting data consumption data
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",  nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Transforming the Date and Time variables from characters into objects of type Date and POSIXIt respectively
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(data$Global_active_power, main="Global Active Power",  xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
##Saving plot to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
