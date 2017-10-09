
## Script to practice exploratory data analysis
## (This script contains the code for Plot2)

## 1) Calculate approximate RAM storage of the loaded file
##    Datset: 2,075,259 rows and 9 columns

cells <- 2075259 * 9
bytes <- cells * 8
megabytes <- bytes / 2^20
megabytes
## => ~143 MB

rm(cells,bytes,megabytes)

## 2) Load the data
## NB! The data has to be downloaded, extracted and placed in the working directory of this script

HouseholdData <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

## 3.1) Inspect the data structure
head(HouseholdData)
str(HouseholdData)

## 3.2) Convert date and time to appropriate format
HouseholdData$Date <- with(HouseholdData, as.Date(as.character(Date),format="%d/%m/%Y"))
HouseholdData$DateTime <- with(HouseholdData, paste(Date,Time,sep=" "))
HouseholdData$DateTime <- with(HouseholdData, strptime(DateTime,format="%Y-%m-%d %H:%M:%S"))

## 3.3) Subset the data to the necessary dates
HouseholdDataSub <- HouseholdData[(HouseholdData$Date >= "2007-02-01" & HouseholdData$Date <="2007-02-02"),]
rm(HouseholdData) # save RAM

## 4) Reconstruct the plots

## 4.2) Plot 2: Plot global active power as a function of time
png("Plot2.png",width=480,height=480)
  with(HouseholdDataSub, plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global active power (kilowatt)"))
dev.off()
