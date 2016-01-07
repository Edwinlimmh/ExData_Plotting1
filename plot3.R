## Plot 3
data <- "./household_power_consumption.txt"
household <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset_2days <- household[household$Date %in% c("1/2/2007","2/2/2007") ,]
DateTime <- strptime(paste(subset_2days$Date, subset_2days$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(subset_2days$Sub_metering_1)
subMetering2 <- as.numeric(subset_2days$Sub_metering_2)
subMetering3 <- as.numeric(subset_2days$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(DateTime, subMetering1, type="l", ylab="Energy Sub metering", xlab="")
lines(DateTime, subMetering2, type="l", col="red")
lines(DateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
