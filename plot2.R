data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")
as.Date(data$Date, "dd/mm/yyyy")
data <- subset(data, Date == "2/2/2007" | Date == "1/2/2007")
datetimes <- paste(data$Date, data$Time)
datetimes <- strptime(x = datetimes, format = "%d/%m/%Y %H:%M:%S")
plot(x = datetimes, 
     y = data$Global_active_power, 
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()