#Read data (already a subset - the subset created by subset_data.R in advance)
data <- read.csv("household_power_consumption_subset.txt", 
                 sep=";", 
                 stringsAsFactors=FALSE)

#Create PNG device
png(file = "plot1.png", width = 480, height = 480, bg = "transparent")

#Create plot
hist(data$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col ="red")

#Close PNG device
dev.off()