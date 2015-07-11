# Assumes data is loaded into power (see main.R)

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
