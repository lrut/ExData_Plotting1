###################################################
## Name:        Run Analysis
## Description: R scripts for the project 1 assignment
## Created by:  LR
## Date:        2015-01-11

# Plot 2
# Histogram of Frequency vs Global Active Power
###################################################


###################################################
# 0. Prepare dataset
# 0a. Load the power consumption data set into R
#    "?" is the NA characted in this set
#    ";" is the delimiter

filename <- "household_power_consumption.txt"
dataf <- read.table(filename,header=TRUE,sep=";",
                    colClasses=c("character", "character", rep("numeric",7)),
                    na="?")

# 0b. Convert date and time variables to Date/Time class
dataf$Time <- strptime(paste(dataf$Date, dataf$Time), "%d/%m/%Y %H:%M:%S")
dataf$Date <- as.Date(dataf$Date, "%d/%m/%Y")

# 0c. Subset data from the dates 2007-02-01 and 2007-02-02
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
dataf <- subset(dataf, Date %in% dates)


###################################################
# 1. Create the chart
png(filename="plot3.png", height=480, width=480, bg="transparent")

# Plot the line chart
plot(dataf$Time,
     dataf$Sub_metering_1,
     type="l",
     col="black",
     xlab="",
     ylab="Energy sub metering")

lines(dataf$Time,
     dataf$Sub_metering_2,
     type="l",
     col="red",
     xlab="",
     ylab="Energy sub metering")
lines(dataf$Time,
     dataf$Sub_metering_3,
     type="l",
     col="blue",
     xlab="",
     ylab="Energy sub metering")
legend("topright",lty=1, col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# Save the figure
dev.off()
