# Assumes data is loaded into power (see main.R)

png('plot1.png')
hist(power$Global_active_power, breaks=16, col = 'red',
     xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')
dev.off()
