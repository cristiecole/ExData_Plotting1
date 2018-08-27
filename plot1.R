energyusedata <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)

energyusedata$DateTime <- paste(energyusedata$Date, energyusedata$Time)
energyusedata$DateTime <- strptime(energyusedata$DateTime, "%d/%m/%Y %H:%M:%S")

enerdata <- subset(energyusedata, DateTime >= "2007-02-01" & DateTime < "2007-02-03")
enerdata$Global_active_power <- as.numeric(enerdata$Global_active_power)
enerdata$Global_reactive_power <- as.numeric(enerdata$Global_reactive_power)
enerdata$Voltage <- as.numeric(enerdata$Voltage)
enerdata$Global_intensity <- as.numeric(enerdata$Global_intensity)
enerdata$Sub_metering_1 <- as.numeric(enerdata$Sub_metering_1)
enerdata$Sub_metering_2 <- as.numeric(enerdata$Sub_metering_2)
enerdata$Sub_metering_3 <- as.numeric(enerdata$Sub_metering_3)

png("plot1.png", width = 480, height = 480)
hist(enerdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()
rm(energyusedata, enerdata)

