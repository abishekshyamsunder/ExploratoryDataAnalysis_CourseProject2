library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
combined<-merge(NEI,SCC, by.x = "SCC", by.y = "SCC")

data1999<-combined[combined$year==1999 & combined$fips==24510,c(1,2,3,4,5,6,8)]
data2002<-combined[combined$year==2002 & combined$fips==24510,c(1,2,3,4,5,6,8)]
data2005<-combined[combined$year==2005 & combined$fips==24510,c(1,2,3,4,5,6,8)]
data2008<-combined[combined$year==2008 & combined$fips==24510,c(1,2,3,4,5,6,8)]

data1999point<-data1999[data1999$type=='POINT',]
data1999nonpoint<-data1999[data1999$type=='NONPOINT',]
data1999onroad<-data1999[data1999$type=='ON-ROAD',]
data1999nonroad<-data1999[data1999$type=='NON-ROAD',]

data2002point<-data2002[data2002$type=='POINT',]
data2002nonpoint<-data2002[data2002$type=='NONPOINT',]
data2002onroad<-data2002[data2002$type=='ON-ROAD',]
data2002nonroad<-data2002[data2002$type=='NON-ROAD',]

data2005point<-data2005[data2005$type=='POINT',]
data2005nonpoint<-data2005[data2005$type=='NONPOINT',]
data2005onroad<-data2005[data2005$type=='ON-ROAD',]
data2005nonroad<-data2005[data2005$type=='NON-ROAD',]

data2008point<-data2008[data2008$type=='POINT',]
data2008nonpoint<-data2008[data2008$type=='NONPOINT',]
data2008onroad<-data2008[data2008$type=='ON-ROAD',]
data2008nonroad<-data2008[data2008$type=='NON-ROAD',]

T1999p<-sum(data1999point$Emissions)
T2002p<-sum(data2002point$Emissions)
T2005p<-sum(data2005point$Emissions)
T2008p<-sum(data2008point$Emissions)

T1999np<-sum(data1999nonpoint$Emissions)
T2002np<-sum(data2002nonpoint$Emissions)
T2005np<-sum(data2005nonpoint$Emissions)
T2008np<-sum(data2008nonpoint$Emissions)

T1999r<-sum(data1999onroad$Emissions)
T2002r<-sum(data2002onroad$Emissions)
T2005r<-sum(data2005onroad$Emissions)
T2008r<-sum(data2008onroad$Emissions)

T1999nr<-sum(data1999nonroad$Emissions)
T2002nr<-sum(data2002nonroad$Emissions)
T2005nr<-sum(data2005nonroad$Emissions)
T2008nr<-sum(data2008nonroad$Emissions)

df1<-data.frame(years=c(1999,2002,2005,2008),point=c(T1999p,T2002p,T2005p,T2008p),nonpoint=c(T1999np,T2002np,T2005np,T2008np),
                onroad=c(T1999r,T2002r,T2005r,T2008r),nonroad=c(T1999nr,T2002nr,T2005nr,T2008nr))
mdf <- reshape2::melt(df1, id.var = "years")
png('plot3.png',width = 480,height = 480,units = "px")
ggplot(mdf, aes(x = years, y = value, colour = variable)) + geom_point() + geom_line()
dev.off()
#ggplot(df1,aes(x=years))+geom_line(aes(y=point),color="darkred")+geom_line(aes(y=nonpoint),color="darkblue")+geom_line(aes(y=onroad),color="darkgreen")+geom_line(aes(y=nonroad),color="yellow") + labs(title="Economics")

