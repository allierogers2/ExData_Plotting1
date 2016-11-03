data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")
as.Date(data$Date, "dd/mm/yyyy")
data <- subset(data, Date == "2/2/2007" | Date == "1/2/2007")
datetimes <- paste(data$Date, data$Time)
datetimes <- strptime(x = datetimes, format = "%d/%m/%Y %H:%M:%S")
plot(x = datetimes, 
     y = data$Sub_metering_1, 
     type = "l",
     ylab = "Energy sub metering", xlab = "",
     ylim = c(0, 30))
par(new = T)
plot(x = datetimes, 
     y = data$Sub_metering_2, 
     type = "l",
     ylab = "", xlab = "",
     axes = F,
     col = "red",
     ylim = c(0, 30))
par(new = T)
plot(x = datetimes, 
     y = data$Sub_metering_3, 
     type = "l",
     ylab = "", xlab = "",
     axes = F,
     col = "blue",
     ylim = c(0, 30))
par(new = T)
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       lwd=c(2.5,2.5,2.5),
       col=c("black", "red", "blue")) # gives the legend lines the correct color and width
par(new = F)
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()