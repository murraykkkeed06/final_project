
library(ggplot2)


tourism_data=read.csv("106���~�ꤺ�Ȧ������.csv")

mydata <- data.frame(month=c(1:12))

mydata$people[1]=nrow(subset(tourism_data, vq3_1=="1")) 
mydata$people[2]=nrow(subset(tourism_data, vq3_1=="2")) 
mydata$people[3]=nrow(subset(tourism_data, vq3_1=="3")) 
mydata$people[4]=nrow(subset(tourism_data, vq3_1=="4")) 
mydata$people[5]=nrow(subset(tourism_data, vq3_1=="5")) 
mydata$people[6]=nrow(subset(tourism_data, vq3_1=="6")) 
mydata$people[7]=nrow(subset(tourism_data, vq3_1=="7")) 
mydata$people[8]=nrow(subset(tourism_data, vq3_1=="8")) 
mydata$people[9]=nrow(subset(tourism_data, vq3_1=="9")) 
mydata$people[10]=nrow(subset(tourism_data, vq3_1=="10")) 
mydata$people[11]=nrow(subset(tourism_data, vq3_1=="11")) 
mydata$people[12]=nrow(subset(tourism_data, vq3_1=="12")) 


tourism_people=as.integer(mydata$people)

name=c("����",
"����",
"����",
"����",
"����",
"����",
"����",
"����",
"����",
"������",
"������",
"������")


barplot(tourism_people,names.arg=name,xlab="Month",ylab="people",col="blue",
main="�ȹC���",border="red")


