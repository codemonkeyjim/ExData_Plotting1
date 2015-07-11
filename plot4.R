# Assumes data is loaded into power (see main.R)

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