#Plot 2
library(readr)
data <- read_delim("household_power_consumption.txt",";", escape_double = FALSE, trim_ws = TRUE)
data <- as.data.frame(data)
subdata <- data[data$Date %in% c("2/2/2007","1/2/2007") ,]
DTG <- paste(subdata$Date,subdata$Time)
subdata$DTG <- strptime(DTG,"%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(subdata$DTG,subdata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()