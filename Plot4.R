#plot 4

# reading files

dt_header <- read.table("household_power_consumption.txt",sep=";",skip=0,nrow=1,header=TRUE,na.strings = "?")

gh <- read.table("household_power_consumption.txt",sep=";",skip=66637,nrow=2880,header=FALSE,na.strings = "?")



dt <- read.table("household_power_consumption.txt",sep=";",skip=0,nrow=0,header=TRUE,na.strings = "?")

dt$Date <- as.Date(dt$Date,"%d/%m/%Y")

dt <- subset(dt, Date %in% as.Date(c("01/02/2007","02/02/2007"),"%d/%m/%Y"))

dt <- dt[complete.cases(dt),]

#dt$Global_active_power_kw <- dt$Global_active_power*.001
dt$time_date <- as.POSIXct(paste0(dt$Date,dt$Time))

par(mfrow=c(2,2))
par(mar=c(4,4,1,0.5))
plot(dt$time_date,dt$Global_active_power,type="l",ylab="Global Active Power",xlab="")
plot(dt$time_date,dt$Voltage,type="l",ylab="Voltage",xlab="date time")
plot(dt$time_date,dt$Sub_metering_1,col="black",type="l",ylab="Energy sub metering",xlab="")
lines(dt$time_date,dt$Sub_metering_2,col="red")
lines(dt$time_date,dt$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black", "red", "blue"), lty=1, lwd=2, bty="n")
plot(dt$time_date,dt$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="date time")




dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()