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

## Using with to make a plot using the Global_active_power and the datetime to plot it against the days. 
## It is type l cause it is a lineplot.   
with(data1, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)

## Remember to close graphics device
dev.off()