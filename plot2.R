## Plot 2
data <- "./household_power_consumption.txt"
household <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset_2days <- household[household$Date %in% c("1/2/2007","2/2/2007") ,]
DateTime <- strptime(paste(subset_2days$Date, subset_2days$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(subset_2days$Global_active_power)

png("plot2.png", width=480, height=480)

plot(DateTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
