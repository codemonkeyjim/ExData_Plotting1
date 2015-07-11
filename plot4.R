# Load complete file
raw <- read.delim('data/household_power_consumption.txt', sep = ';', na.strings = '?',
                  colClasses = c('character', 'character',
                                 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))

# Grab just the two dates we need (dates are in D/M/Y format)
power <- raw[(raw$Date == '1/2/2007' | raw$Date == '2/2/2007'), ]

# Save some memory
remove(raw)

# Clean up column types
power$DateTime <- strptime(paste(power$Date, power$Time), '%d/%m/%Y %T')

png('plot4.png')
par(mfrow = c(2,2))

# Upper left
with(power, plot(DateTime, Global_active_power,
                 type = 'l',
                 xlab = '', ylab = 'Global Active Power'))

# Upper right
with(power, plot(DateTime, Voltage,
                 type = 'l',
                 xlab = 'datetime', ylab = 'Voltage'))

# Lower left
with(power, plot(DateTime, Sub_metering_1,
                 type = 'l',
                 col = 'black',
                 xlab = '', ylab = 'Energy sub metering'))
with(power, points(DateTime, Sub_metering_2,
                   type = 'l',
                   col = 'red'))
with(power, points(DateTime, Sub_metering_3,
                   type = 'l',
                   col = 'blue'))
legend('topright', col = c('black', 'blue', 'red'),
       box.lty = 0,
       lty = 1, legend = paste('Sub_metering_', 1:3, sep = ''))

# Lower right
with(power, plot(DateTime, Global_reactive_power,
                 type = 'l',
                 xlab = 'datetime', ylab = 'Global_reactive_power'))

dev.off()