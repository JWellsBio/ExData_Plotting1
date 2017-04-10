# plot2.R
# This file creates the histogram desired

# Load all data
energy_data <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, stringsAsFactors = FALSE)
# Subset for first date desired
energy0201 <- energy_data[which(energy_data$Date == '1/2/2007'), ]
# Subset for second date desired
energy0202 <- energy_data[which(energy_data$Date == '2/2/2007'), ]
# Combine them for all data we want
all_energy <- rbind(energy0201, energy0202)
# Set date and tie properly
all_energy$Date <- paste(all_energy$Date, all_energy$Time)
all_energy$Date <- strptime(all_energy$Date, format = '%d/%m/%Y %H:%M:%S')
all_energy$NewDay <- weekdays(as.Date(all_energy$Date))
# Set numeric variables
all_energy$Global_active_power <- as.numeric(all_energy$Global_active_power)
# Draw the PNG
png(filename = 'plot2.png', width = 480, height = 480)
plot(all_energy$Date, all_energy$Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = '')
dev.off()
