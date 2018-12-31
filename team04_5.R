
library(dplyr)
library(stringr)
library(data.table)
library(ggplot2)
library(maptools)
library(knitr)
library(mapproj)
library(RColorBrewer)

tourism_data=read.csv("106���~�ꤺ�Ȧ������.csv")
tw_shp <- readShapeSpatial("gadm36_TWN_2.shp")
tw_map <- fortify(tw_shp)

chinese_name <- c("������", "�s����", "������", "�s�_��", "�O����",
                  "�O�n��", "�O�_��", "���ƿ�", "�Ÿq��", "�Ÿq��",
                  "�s�˥�", "�s�˿�", "�Ὤ��", "�򶩥�", "�]�߿�",
                  "�n�뿤", "���", "�̪F��", "�O�F��", "��饫",
                  "�y����", "�y����")


mydata <- data.frame(NAME_1=tw_shp$NAME_2,
                     NAME_2=chinese_name)
mydata$id <- 0
for(i in 0:22){
  mydata$id[i] <- i
}

tw_map$id <- as.character(as.integer(tw_map$id)+1)


mydata$population[1]=nrow(subset(tourism_data, vq4_1_1=="21")) 
mydata$population[2]=nrow(subset(tourism_data, vq4_1_1=="22")) 
mydata$population[3]=nrow(subset(tourism_data, vq4_1_1=="20")) 
mydata$population[4]=nrow(subset(tourism_data, vq4_1_1=="1")) 
mydata$population[5]=nrow(subset(tourism_data, vq4_1_1=="16")) 
mydata$population[6]=nrow(subset(tourism_data, vq4_1_1=="18")) 
mydata$population[7]=nrow(subset(tourism_data, vq4_1_1=="19")) 
mydata$population[8]=nrow(subset(tourism_data, vq4_1_1=="6")) 
mydata$population[9]=nrow(subset(tourism_data, vq4_1_1=="17")) 
mydata$population[10]=nrow(subset(tourism_data, vq4_1_1=="9")) 
mydata$population[11]=nrow(subset(tourism_data, vq4_1_1=="15")) 
mydata$population[12]=nrow(subset(tourism_data, vq4_1_1=="4")) 
mydata$population[13]=nrow(subset(tourism_data, vq4_1_1=="12")) 
mydata$population[14]=nrow(subset(tourism_data, vq4_1_1=="14")) 
mydata$population[15]=nrow(subset(tourism_data, vq4_1_1=="5")) 
mydata$population[16]=nrow(subset(tourism_data, vq4_1_1=="7")) 
mydata$population[17]=nrow(subset(tourism_data, vq4_1_1=="13")) 
mydata$population[18]=nrow(subset(tourism_data, vq4_1_1=="10")) 
mydata$population[19]=nrow(subset(tourism_data, vq4_1_1=="11")) 
mydata$population[20]=nrow(subset(tourism_data, vq4_1_1=="3")) 
mydata$population[21]=nrow(subset(tourism_data, vq4_1_1=="2")) 
mydata$population[22]=nrow(subset(tourism_data, vq4_1_1=="2")) 



tw.plot<-merge(tw_map,mydata,by="id",all.x=T)


tw_ppl_dist <- ggplot() +
  geom_polygon(data = tw.plot, 
               aes(x = long, y = lat, group = group, 
                   fill = population/1000), 
               color = "black", size = 0.25) + 
  coord_map()+
  scale_fill_gradientn(colours = brewer.pal(9,"Blues"),
                       name = "Population (10k)") +
  #theme_void()+
  labs(title="�ȹC��������", 
       x ="Latitude", y = "Longitude")

tw_ppl_dist



pie_vector=as.integer(mydata$population)

piepercent<- round(100*pie_vector/sum(pie_vector), 1)

pie(pie_vector, labels = piepercent, main = "�ȹC����",col = rainbow(length(pie_vector)))
legend("right", chinese_name, cex = 1,
   fill = rainbow(length(pie_vector)))





