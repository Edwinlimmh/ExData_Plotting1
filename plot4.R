## Plot 4
data <- "./household_power_consumption.txt"
household <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset_2days <- household[household$Date %in% c("1/2/2007","2/2/2007") ,]
DateTime <- strptime(paste(subset_2days$Date, subset_2days$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(subset_2days$Global_active_power)
GlobalReactivePower <- as.numeric(subset_2days$Global_reactive_power)
voltage <- as.numeric(subset_2days$Voltage)
subMeter1 <- as.numeric(subset_2days$Sub_metering_1)
subMeter2 <- as.numeric(subset_2days$Sub_metering_2)
subMeter3 <- as.numeric(subset_2days$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(DateTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(DateTime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(DateTime, subMeter1, type="l", ylab="Energy Sub metering", xlab="")
lines(DateTime, subMeter2, type="l", col="red")
lines(DateTime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(DateTime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
