Plot2 <- function(){
    
    #  Load text file into a data frame: first two columns are character
    #  and the next seven are numeric; the NA character is "?"
    
    classes <- c(rep("character",2),rep("numeric",7))
    plotdata <- read.delim("household_power_consumption.txt",header=TRUE,sep=";",colClasses=classes,na.string="?")
    
    #  Subset to just Feb 1 and 2, 2007
    
    plotdata <- subset(plotdata,Date=="1/2/2007" | Date == "2/2/2007")
    
    #  combine Date and Time into one column
    
    sampletime <- as.POSIXct(paste(plotdata$Date,plotdata$Time),format="%d/%m/%Y %H:%M:%S")
    plotdata <- cbind(plotdata,sampletime)

    # Line plot to PNG file called "plot2.png" (480 x 480 pixels)
        
    #png(filename = "plot2.png", width = 480, height = 480)
    plot(plotdata$sampletime,
         plotdata$Global_active_power,
         type="n",
         ylab="Global Active Power (kilowatts)",
         xlab=" ")
    lines(plotdata$sampletime,
          plotdata$Global_active_power)
    #dev.off()
}