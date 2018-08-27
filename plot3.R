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

png("plot3.png", width = 480, height = 480)
plot(enerdata$DateTime, enerdata$Sub_metering_1, type = "n", xlab = "",
     ylab = "Energy Sub Metering")
lines(enerdata$DateTime, enerdata$Sub_metering_1)
lines(enerdata$DateTime, enerdata$Sub_metering_2, col = "red")
lines(enerdata$DateTime, enerdata$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"),
       lty = c(1, 1, 1))
dev.off()
rm(energyusedata, enerdata)