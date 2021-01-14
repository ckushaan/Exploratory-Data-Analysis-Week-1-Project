plot3 <-function(){
    
    ## Steps of this function is to read the household_power_consumption.txt file and
    ## subset for data taken from 2 days: 2007-02-01 and 2007-02-02 then
    ## generate a plot of different submetering vs time
    
    ## Assumes household_power_consumption.txt file located in working dir
    
    ## read data
    raw_file <- read.csv("household_power_consumption.txt", header=T, sep=";", na.strings="?", nrows=2075259, check.names=F, stringsAsFactors = F, comment.char = "", quote='\"')
    
    ## subset the file
    sub_file <- subset(raw_file, Date %in% c("1/2/2007", "2/2/2007"))
    
    ## correct the date format
    sub_file$Date <- as.Date(sub_file$Date, format = "%d/%m/%Y")
    datetime <- paste(as.Date(sub_file$Date), sub_file$Time)
    sub_file$Datetime <- as.POSIXct(datetime)
    
    ## plot the data
    with(sub_file, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
    })
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    ## open PNG display drives
    png("plot3.png", width=480, height=480)
    
    ## Turn off display drive
    dev.off()
}