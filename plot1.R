Plot1 <- function(){
    
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
        
    png(filename = "plot1.png", width = 480, height = 480)
    hist(plotdata$Global_active_power,
         col="red",
         main="Global Active Power",
         xlab="Global Active Power (kilowatts)", 
         ylab="Frequency")
    dev.off()
}