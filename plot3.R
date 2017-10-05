#Plot 3
library(readr)
data <- read_delim("household_power_consumption.txt",";", escape_double = FALSE, trim_ws = TRUE)
data <- as.data.frame(data)
subdata <- data[data$Date %in% c("2/2/2007","1/2/2007") ,]
DTG <- paste(subdata$Date,subdata$Time)
subdata$DTG <- strptime(DTG,"%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)
plot(subdata$DTG, subdata$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
points(subdata$DTG, subdata$Sub_metering_2, type="l",col="red")
points(subdata$DTG, subdata$Sub_metering_3, type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()