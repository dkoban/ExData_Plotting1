#Plot 4

library(readr)
data <- read_delim("household_power_consumption.txt",";", escape_double = FALSE, trim_ws = TRUE)
data <- as.data.frame(data)
subdata <- data[data$Date %in% c("2/2/2007","1/2/2007") ,]
DTG <- paste(subdata$Date,subdata$Time)
subdata$DTG <- strptime(DTG,"%d/%m/%Y %H:%M:%S")
head(subdata)

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(subdata$DTG, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(subdata$DTG, subdata$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(subdata$DTG, subdata$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(subdata$DTG, subdata$Sub_metering_2, type="l", col="red")
lines(subdata$DTG, subdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"))

plot(subdata$DTG, subdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
