library(lubridate)

#Read data from file
data <- read.csv("../household_power_consumption.txt", 
                 sep=";", 
                 na.strings="?", 
                 stringsAsFactors=FALSE)
    

#Define start and end dates, transform dates to lubridate
start <- ymd("2007-02-01")
end <- ymd("2007-02-02")
data$Date <- dmy(data$Date)

#Subset dataset to relevant dates
data <- data[data$Date >= start & data$Date <= end, ]

#Save data to new file
write.table(data, "household_power_consumption_subset.txt", row.name=FALSE, sep=";")