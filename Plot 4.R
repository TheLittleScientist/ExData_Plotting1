##First load the data from the txt file. We are informed that there is 207559 rows and 9 columns in the dataset. 
##check.names are set to false as it is not needed to check if they are syntactically valid.
##stringAsFactors are set to false cause character vector should not be converted to strings.
##comment.char is set to "" to turn of comments. header is set to true cause the first line of the file contains the name of the variables.
##sep is set to ; cause the file is semicolon separated. na.strings are set to ? as the missing values in the dataset is marked with a ?.
##quote is set to \" as a default. 
AllData <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
##The dataset is subsetted for the period of time we are to look at and turned into the desired format. 
data1 <- subset(AllData, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

##par is used to set global parameters that affects all plots made. 
##mfrow is the number of plots per row filled row wise, mar is the margin and oma is the outer margin. 
##with is used to pick the data for all the plots. The first plot is the same as in plot 2 just without the header
##and the 3 plot is the same as plot 3 with bty added to make a box. The second plot uses plot to chose voltage as the desired data
##and ylab is the y axis and xlab is the x axis. The last plot is made the same way with just choosing Global_reactive_power as the data.
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data1, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)

## Remember to close graphics device
dev.off()