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

png(filename = "plot1.png", width = 480, height = 480)
hist(d[,3], col='red', main='Global Active Power', xlab='Global Active Power (kilowats)')
dev.off()
