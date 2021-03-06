data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", 
colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')
)

convertToDate<-function(date, time) {
   from = paste(date, time, sep=" ");  
   strptime(from, "%d/%m/%Y %H:%M:%S", tz="GMT")
} 

data$DATETIME <- convertToDate(data$Date, data$Time)

dataForDates <- data[(data$DATETIME >= as.POSIXlt("2007-02-01", tz="GMT")) & (data$DATETIME < as.POSIXlt("2007-02-03", tz="GMT")), ]

png(filename="plot1.png", width = 480, height = 480)

hist(dataForDates$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col = "red")

dev.off()


