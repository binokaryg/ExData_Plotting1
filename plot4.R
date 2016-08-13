#Read data, treat "?" as NA
allData <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
allData$Date <- as.Date(allData$Date,"%d/%m/%Y")

#Use data between "2007-02-01" and "2007-02-02" (inclusive)
useData <- allData[allData$Date >= "2007-02-01" & allData$Date <= "2007-02-02",]
useData$Time <- paste(useData$Date, useData$Time)
useData$Time <- as.POSIXct(useData$Time, "%Y-%m-%d %H:%M:%S", tz = "GMT")

#Fourth plot
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(useData$Time,useData$Global_active_power, type = "l",ylab="Global Active Power (kilowatts)",xlab=NA)
plot(useData$Time,useData$Voltage, type = "l",ylab="Voltage",xlab=NA)
plot(useData$Time, useData$Sub_metering_1, type = "l", xlab=NA, ylab = "Energy sub metering")
lines(useData$Time, useData$Sub_metering_2, type = "l", col = "red")
lines(useData$Time, useData$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n")
plot(useData$Time,useData$Global_reactive_power, type = "l",ylab="Global_reactive_power",xlab=NA)
dev.off()