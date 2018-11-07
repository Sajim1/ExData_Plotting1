
#plot 1

# reading files

dt_header <- read.table("household_power_consumption.txt",sep=";",skip=0,nrow=1,header=TRUE,na.strings = "?")

gh <- read.table("household_power_consumption.txt",sep=";",skip=66637,nrow=2880,header=FALSE,na.strings = "?")



dt <- read.table("household_power_consumption.txt",sep=";",skip=0,nrow=0,header=TRUE,na.strings = "?")

dt$Date <- as.Date(dt$Date,"%d/%m/%Y")

dt <- subset(dt, Date %in% as.Date(c("01/02/2007","02/02/2007"),"%d/%m/%Y"))

dt <- dt[complete.cases(dt),]

#dt$Time<- strptime(dt$Time,"%T")
par(mfrow=c(1,1))

hist(dt$Global_active_power,col="red",main="Global Active Power")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
