aFile = 'household_power_consumption.txt'

myformat = list(Date='', Time='', Global_active_power=0, Global_reactive_power=0, Voltage=0,
                Global_intensity=0, Sub_metering_1=0, Sub_metering_2=0, Sub_metering_3=0)

f = file(aFile)

open(f, open="r")
titles = readLines(f, n=1)

d = data.frame()

repeat {
        b = scan(f, what=myformat, sep=";", nlines=1, quiet=T, na.strings='?')   
        if (b$Date == '3/2/2007') break
        if ( (b$Date == "1/2/2007") | (b$Date == "2/2/2007") ) {    
                b = as.data.frame(b)
                d = rbind(d, b)
        }
}        
close(f)

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
