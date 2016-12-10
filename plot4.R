Plot4 <- function(){
    
    #  Load text file into a data frame: first two columns are character
    #  and the next seven are numeric; the NA character is "?"
    
    classes <- c(rep("character",2),rep("numeric",7))
    plotdata <- read.delim("household_power_consumption.txt",header=TRUE,sep=";",colClasses=classes,na.string="?")
    
    #  Subset to just Feb 1 and 2, 2007
    
    plotdata <- subset(plotdata,Date=="1/2/2007" | Date == "2/2/2007")
    
    #  combine Date and Time into one column
    
    sampletime <- as.POSIXct(paste(plotdata$Date,plotdata$Time),format="%d/%m/%Y %H:%M:%S")
    plotdata <- cbind(plotdata,sampletime)

    # Histogram to PNG file called "plot1.png" (480 x 480 pixels)
        
    png(filename = "plot4.png", width = 480, height = 480)
    par(mfrow=(c(2,2)))
    plot(plotdata$sampletime,
         plotdata$Global_active_power,
         type="n",
         ylab="Global Active Power",
         xlab=" ")
    lines(plotdata$sampletime,
          plotdata$Global_active_power)
    plot(plotdata$sampletime,
         plotdata$Voltage,
         type="n",
         ylab="Voltage",
         xlab="datetime ")
    lines(plotdata$sampletime,
          plotdata$Voltage)
    plot(plotdata$sampletime,
         plotdata$Sub_metering_1,
         type="n",
         ylab="Energy sub metering",
         xlab=" ")
    lines(plotdata$sampletime,
          plotdata$Sub_metering_1,
          col="black")
    lines(plotdata$sampletime,
          plotdata$Sub_metering_2,
          col="red")
    lines(plotdata$sampletime,
          plotdata$Sub_metering_3,
          col="blue")
    legend("topright",
           NULL,
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           fill=NULL,
           col=c("black","red","blue"),
           lty=1,
           bty="n",
           border=c(NA,NA,NA))
    plot(plotdata$sampletime,
         plotdata$Global_reactive_power,
         type="n",
         ylab="Global_reactive_power",
         xlab="datetime ")
    lines(plotdata$sampletime,
          plotdata$Global_reactive_power)
    dev.off()
}