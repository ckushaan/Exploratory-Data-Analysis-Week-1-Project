plot1 <-function(){
    
    ## Steps of this function is to read the household_power_consumption.txt file and
    ## subset for data taken from 2 days: 2007-02-01 and 2007-02-02 then
    ## generate a histogram of global active power(kilowatts)
    
    ## Assumes household_power_consumption.txt file located in working dir
    
    ## read data
    raw_file <- read.csv("household_power_consumption.txt", header=T, sep=";", na.strings="?", nrows=2075259, check.names=F, stringsAsFactors = F, comment.char = "", quote='\"')
    
    ## subset the file
    sub_file <- subset(raw_file, Date %in% c("1/2/2007", "2/2/2007"))
    
    ## correct the date format
    sub_file$Date <- as.Date(sub_file$Date, format = "%d/%m/%Y")
    
    
    ## plot the histogram of global active power for those days mentioned above
    hist(sub_file$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
    
    ## open PNG display drives
    png("plot1.png", width=480, height=480)
    
    ## Turn off display drive
    dev.off()
}