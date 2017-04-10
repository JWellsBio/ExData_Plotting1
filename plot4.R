# plot4.R
# This file creates the histogram desired

# Load all data
energy_data <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, stringsAsFactors = FALSE)
# Subset for first date desired
energy0201 <- energy_data[which(energy_data$Date == '1/2/2007'), ]
# Subset for second date desired
energy0202 <- energy_data[which(energy_data$Date == '2/2/2007'), ]
# Combine them for all data we want
all_energy <- rbind(energy0201, energy0202)
# Format date and time correctly
all_energy$Date <- paste(all_energy$Date, all_energy$Time)
all_energy$Date <- strptime(all_energy$Date, format = '%d/%m/%Y %H:%M:%S')
all_energy$NewDay <- weekdays(as.Date(all_energy$Date))
# Set what we need to numeric
all_energy$Global_active_power <- as.numeric(all_energy$Global_active_power)
all_energy$Sub_metering_1 <- as.numeric(all_energy$Sub_metering_1)
all_energy$Sub_metering_2 <- as.numeric(all_energy$Sub_metering_2)
all_energy$Sub_metering_3 <- as.numeric(all_energy$Sub_metering_3)
all_energy$Global_reactive_power <- as.numeric(all_energy$Global_reactive_power)
all_energy$Voltage <- as.numeric(all_energy$Voltage)
# Draw the PNG
png(filename = 'plot4.png', width = 480, height = 480)
par(mfrow = c(2,2))
plot(all_energy$Date, all_energy$Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = '')

plot(all_energy$Date, all_energy$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')

plot(all_energy$Date, all_energy$Sub_metering_1, type = 'l', ylab = 'Energy sub metering', xlab = '')
lines(all_energy$Date, all_energy$Sub_metering_2, col = 'red')
lines(all_energy$Date, all_energy$Sub_metering_3, col = 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = 1, col = c('black', 'red', 'blue'), bty = 'n')

plot(all_energy$Date, all_energy$Global_reactive_power, type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power')
dev.off()
