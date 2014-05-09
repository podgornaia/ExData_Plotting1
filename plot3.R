# Read in the data. Select only data for 2007-02-01 and 2007-02-02.
data  <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
data$DateTime <- as.POSIXct(strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S"))
startDate  <- as.POSIXct(strptime(c("31/01/2007"), "%d/%m/%Y"))
finishDate  <- as.POSIXct(strptime(c("03/02/2007 0:0:0"), "%d/%m/%Y %H:%M:%S"))
data2  <- data[data$DateTime > start & data$DateTime < finish, ]

# Plot #3
png("plot3.png", width = 480, height = 480)
plot(data2$DateTime, data2$Sub_metering_1, type="l", col = "black", ylab = "Energy sub metering", xlab = "")
lines(data2$DateTime, data2$Sub_metering_2, type="l", col = "red")
lines(data2$DateTime, data2$Sub_metering_3, type="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))
dev.off()
