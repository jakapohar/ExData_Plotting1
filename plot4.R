library(lubridate)

#Read data (already a subset - the subset created by subset_data.R in advance)
data <- read.csv("household_power_consumption_subset.txt", 
                 sep=";", 
                 stringsAsFactors=FALSE)

#Create PNG device
png(file = "plot4.png", width = 480, height = 480, bg = "transparent")

#Create multiple plots
par(mfrow = c(2,2))

#Params for x-axis
thu = 1
fri = match("Fri", wday(data$Date, label = TRUE))
sat = nrow(data) + 1

#Create plot 1
plot(data$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)", 
     xaxt = "n")
axis(1, at = c(thu, fri, sat), labels = c("Thu", "Fri", "Sat"))

#Create plot 2
plot(data$Voltage, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage", 
     xaxt = "n")
axis(1, at = c(thu, fri, sat), labels = c("Thu", "Fri", "Sat"))

#Create plot 3
plot(data$Sub_metering_1, 
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering", 
     xaxt = "n")
lines(data$Sub_metering_2, col = "red")
lines(data$Sub_metering_3, col = "blue")
legend("topright", 
       lwd = 1,
       col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(1, at = c(thu, fri, sat), labels = c("Thu", "Fri", "Sat"))

#Create plot 4
plot(data$Global_reactive_power, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global reactive power", 
     xaxt = "n")
axis(1, at = c(thu, fri, sat), labels = c("Thu", "Fri", "Sat"))

#Close PNG device
dev.off()