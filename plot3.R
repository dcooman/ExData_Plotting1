Plot3 <- function(){
    
    #  Load text file into a data frame: first two columns are character
    #  and the next seven are numeric; the NA character is "?"
    
    classes <- c(rep("character",2),rep("numeric",7))
    plotdata <- read.delim("household_power_consumption.txt",header=TRUE,sep=";",colClasses=classes,na.string="?")
    
    #  Subset to just Feb 1 and 2, 2007
    
    plotdata <- subset(plotdata,Date=="1/2/2007" | Date == "2/2/2007")
    
    #  combine Date and Time into one column
    
    sampletime <- as.POSIXct(paste(plotdata$Date,plotdata$Time),format="%d/%m/%Y %H:%M:%S")
    plotdata <- cbind(plotdata,sampletime)

    # Multiline graph to PNG file called "plot3.png" (480 x 480 pixels)
        
    png(filename = "plot3.png", width = 480, height = 480)
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
           border=c(NA,NA,NA))
    dev.off()
}