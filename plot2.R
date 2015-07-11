# Assumes data is loaded into power (see main.R)

png('plot2.png')
plot(power$DateTime, power$Global_active_power,
     type = 'l', xlab = '',
     ylab = 'Global Active Power (kilowatts)')
dev.off()
