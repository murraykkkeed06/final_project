
library(plotrix)


tourism_data=read.csv("106���~�ꤺ�Ȧ������.csv")

mydata <- data.frame(type=c(1:6))

mydata$people[1]=nrow(subset(tourism_data, vq7_1=="1")) 
mydata$people[2]=nrow(subset(tourism_data, vq7_1=="2")) 
mydata$people[3]=nrow(subset(tourism_data, vq7_1=="3")) 
mydata$people[4]=nrow(subset(tourism_data, vq7_1=="4")) 
mydata$people[5]=nrow(subset(tourism_data, vq7_1=="5")) 
mydata$people[6]=nrow(subset(tourism_data, vq7_1=="6")) 

tourism_people=as.integer(mydata$people)

mydata$piepercent<- round(100*tourism_people/sum(tourism_people), 1)


lbl <- c("����Ӧ^,","���]","���ʤ���","���J","�S��","�ˤͮa")


pie3D(tourism_people,labels = lbl,explode = 0.1, main = "�D�n���J�覡")

