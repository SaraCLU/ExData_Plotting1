##Set working directory.

setwd("/Users/saralu/Desktop/Coursera/Topic 4 week 1")

## 1. Load and clean the table.

h_power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))

##Convert the Date and Time variables to Date/Time classes.

h_power$Date <- as.Date(h_power$Date, "%d/%m/%Y")

##Subset data from Feb 1, 2007 to Feb 2, 2007.

hp <- subset(h_power, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

##Remove incomplete observation.

hp <- hp[complete.cases(hp), ]

##Combine Date & Time column and name the vector.

dT <- paste(hp$Date, hp$Time)
dT <- setNames(dT, "DateTime")

##Remove the old Date and Time column.

hp <- hp[ , !(names(hp) %in% c("Date","Time"))]

##Add DateTime column.

hp <- cbind(dT, hp)

##Format DateTime(dT) Column.

hp$dT <- as.POSIXct(dT)

## 2. Plot

##Plot2

plot(hp$Global_active_power~hp$dT, type="l", ylab = "Global Active Power (kilowatts)", xlab="")

##Save file and close device.

> dev.copy(png, "plot1.png", width=480, height=480)
> dev.off()
