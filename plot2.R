library(lubridate)

#Read data (already a subset - the subset created by subset_data.R in advance)
data <- read.csv("household_power_consumption_subset.txt", 
                 sep=";", 
                 stringsAsFactors=FALSE)

#Create PNG device
png(file = "plot2.png", width = 480, height = 480, bg = "transparent")

#Create plot
plot(data$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)", 
     xaxt = "n")

#Draw x-axis
thu = 1
fri = match("Fri", wday(data$Date, label = TRUE))
sat = nrow(data) + 1
axis(1, at = c(thu, fri, sat), labels = c("Thu", "Fri", "Sat"))

#Close PNG device
dev.off()