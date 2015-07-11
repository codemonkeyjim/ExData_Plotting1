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

png('plot1.png')
hist(power$Global_active_power, breaks=16, col = 'red',
     xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')
dev.off()
