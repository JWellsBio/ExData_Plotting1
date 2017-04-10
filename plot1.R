# plot1.R
# This file creates the histogram desired

# Load all data
energy_data <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, stringsAsFactors = FALSE)
# Subset for first date desired
energy0201 <- energy_data[which(energy_data$Date == '1/2/2007'), ]
# Subset for second date desired
energy0202 <- energy_data[which(energy_data$Date == '2/2/2007'), ]
# Combine them for all data we want
all_energy <- rbind(energy0201, energy0202)

# Draw the PNG
png(filename = 'plot1.png', width = 480, height = 480)
hist(as.numeric(all_energy$Global_active_power), main = 'Global Active Power', col = 'red', xlab = 'Global Active Power (kilowatts)')
dev.off()
