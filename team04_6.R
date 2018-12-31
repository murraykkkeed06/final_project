
library(plotrix)


tourism_data=read.csv("106全年國內旅次資料檔.csv")

mydata <- data.frame(type=c(1:3))

mydata$people[1]=nrow(subset(tourism_data, vq5_1=="1")) 
mydata$people[2]=nrow(subset(tourism_data, vq5_1=="2")) 
mydata$people[3]=nrow(subset(tourism_data, vq5_1=="3")) 


tourism_people=as.integer(mydata$people)

mydata$piepercent<- round(100*tourism_people/sum(tourism_people), 1)

lbl <- c("國定假日","週末、星期日","平常日")


pie3D(tourism_people,labels = lbl,explode = 0.1, main = "旅遊利用日期")


