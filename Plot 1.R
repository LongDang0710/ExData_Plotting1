# plot1.R
library(dplyr)
library(lubridate)

data_file <- "./data/household_power_consumption.txt"
data <- read.table(data_file, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subset_data <- filter(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
subset_data$Datetime <- strptime(paste(subset_data$Date, subset_data$Time), format = "%Y-%m-%d %H:%M:%S")

png("plot1.png", width = 480, height = 480)
hist(subset_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()