data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", 
colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')
)

convertToDate<-function(date, time) {
   from = paste(date, time, sep=" ");  
   strptime(from, "%d/%m/%Y %H:%M:%S", tz="GMT")
} 

data$DATETIME <- convertToDate(data$Date, data$Time)

dataForDates <- data[(data$DATETIME >= as.POSIXlt("2007-02-01", tz="GMT")) & (data$DATETIME < as.POSIXlt("2007-02-03", tz="GMT")), ]

png(filename="plot3.png", width = 480, height = 480)

with(dataForDates, {
plot(DATETIME, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(DATETIME, Sub_metering_1)
lines(DATETIME, Sub_metering_2, col = "red")
lines(DATETIME, Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1),
       col = c("black", "red", "blue"))
})
dev.off()


