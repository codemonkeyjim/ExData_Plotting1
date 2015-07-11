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

png('plot3.png')
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
       lty = 1, legend = paste('Sub_metering_', 1:3, sep = ''))
dev.off()
