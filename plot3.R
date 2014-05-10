d = read.table(file='Project1_DataFrame.csv', sep=';', dec='.', header=T)

aDate = d[,1]
aTime = d[,2]
aDateTime = paste(aDate, aTime)

Sys.setlocale("LC_ALL", "en_US.UTF-8")
x = as.POSIXct(strptime(aDateTime, "%d/%m/%Y %H:%M:%S"))
y1 = d[,7]
y2 = d[,8]
y3 = d[,9]
aColors = c('black', 'red', 'blue')
aLabels = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')

png(filename = "plot3.png", width = 480, height = 480)
plot(x, y1, xlab='', ylab='Energy sub metering', type='l', col=aColors[1])
legend('topright', legend = aLabels, col=aColors, lty=1)
lines(x, y2, col=aColors[2])
lines(x, y3, col=aColors[3])
dev.off()
