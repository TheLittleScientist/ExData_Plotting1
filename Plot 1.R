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
##hist is used to make the plot, the desired data is chosen by picking Global_active_power.
##After that main is used to make the heading, xlab names the x axis and ylab the y axis. col is used to choose the color.
hist(data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)

## Remember to close graphics device
dev.off()