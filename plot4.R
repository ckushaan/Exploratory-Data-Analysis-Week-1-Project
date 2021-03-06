plot4 <-function(){
    
    ## Steps of this function is to read the household_power_consumption.txt file and
    ## subset for data taken from 2 days: 2007-02-01 and 2007-02-02 then
    ## generate 4 plots in 1 space (GAP vs. time, Vol vs. time, submetering vs. time and GRP vs. time)
    
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
    par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
    with(sub_file, {
        plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
    })
    
    ## open PNG display drives
    png("plot4.png", width=480, height=480)
    
    ## Turn off display drive
    dev.off()
}