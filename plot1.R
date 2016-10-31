data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")
as.Date(data$Date, "dd/mm/yyyy")
data <- subset(data, Date == "2/2/2007" | Date == "1/2/2007")
hist(data$Global_active_power, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
##png(filename = "plot1.png", width = 480, height = 480)
dev.off()