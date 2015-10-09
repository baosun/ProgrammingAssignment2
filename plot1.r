## using the "Individual household electric power consumption Data Set" from UCI
## We will focus on data from the dates 2007-02-01 and 2007-02-02.

## read in data - define the separation and na string
        library(readr)
        data <- read_delim("D:/R/data/data/household_power_consumption.txt", 
                           delim = ";", na = "?")
## select 2007-02-01 and 2007-02-02
        selectDate <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
## convert date & time to POSIXlt
        selectDate$convertedDate<- strptime(paste(selectDate$Date, selectDate$Time), 
                                            format = "%d/%m/%Y %H:%M:%S" )
## plot histogram to png file
        png(file = "D:/R/data/data/plot/plot1.png")
        hist(selectDate$Global_active_power, 
             col = "red", 
             border = "black", 
             main = "Global active power", 
             xlab = "Global active power (kilowatts)")
        dev.off()
        