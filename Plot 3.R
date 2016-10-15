## The aim of this file is to provide a R code that is capable of constructing plot 3

## download file into data folder
dataset_url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(dataset_url, "Dataset.zip")

## Unzip the file
unzip("Dataset.zip", exdir = "Dataset")

## set working directory
setwd("C:/Users/Abdulrahman/Documents/Coursera/Exploratory Data Analysis/Dataset")

## read data
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",  nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## subsetting the data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 3
with(data, { 
     plot(Sub_metering_1~Datetime, type="l", 
          ylab="Global Active Power (kilowatts)", xlab="") 
     lines(Sub_metering_2~Datetime,col='Red') 
     lines(Sub_metering_3~Datetime,col='Blue') 
 })
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,  
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
