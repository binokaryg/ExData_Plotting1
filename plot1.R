#Read data, treat "?" as NA
allData <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
allData$Date <- as.Date(allData$Date,"%d/%m/%Y")

#Use data between "2007-02-01" and "2007-02-02" (inclusive)
useData <- allData[allData$Date >= "2007-02-01" & allData$Date <= "2007-02-02",]
useData$Time <- paste(useData$Date, useData$Time)
useData$Time <- as.POSIXct(useData$Time, "%Y-%m-%d %H:%M:%S", tz = "GMT")

#First plot
png("plot1.png",width=480,height=480)
hist(useData$Global_active_power,xlab="Global Active Power (kilowatts)", main="Global Active Power",c="red")
dev.off()