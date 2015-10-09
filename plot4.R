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
        png(file = "D:/R/data/data/plot/plot4.png")
        par(mfrow = c(2,2))
        with(selectDate, {
                plot(selectDate$convertedDate, selectDate$Global_active_power,
                     type = "l", ylab = "Global Active Power", xlab = " ")
                plot(selectDate$convertedDate, selectDate$Voltage, 
                     type = "l", ylab = "Voltage", 
                     xlab = "datetime" )
                plot(selectDate$convertedDate, selectDate$Sub_metering_1, 
                     type = "l", ylab = "Energy sub metering", xlab = " ")
                lines(selectDate$convertedDate, selectDate$Sub_metering_2, type = "l", col = "red")
                lines(selectDate$convertedDate, selectDate$Sub_metering_3, type = "l", col = "blue")
                legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
                                              "sub_metering_3"),
                       col = c("black", "red", "blue"), lty = 1)
                plot(selectDate$convertedDate, selectDate$Global_reactive_power,
                     type = "l", ylab = "Global_reactive_power",
                     xlab = "datetime")
        })
        
        dev.off()
        