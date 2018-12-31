
library(dplyr)
library(stringr)
library(data.table)
library(ggplot2)
library(maptools)
library(knitr)
library(mapproj)
library(RColorBrewer)

tourism_data=read.csv("106全年國內旅次資料檔.csv")
tw_shp <- readShapeSpatial("gadm36_TWN_2.shp")
tw_map <- fortify(tw_shp)

chinese_name <- c("金門縣", "連江縣", "高雄市", "新北市", "臺中市",
                  "臺南市", "臺北市", "彰化縣", "嘉義市", "嘉義縣",
                  "新竹市", "新竹縣", "花蓮縣", "基隆市", "苗栗縣",
                  "南投縣", "澎湖縣", "屏東縣", "臺東縣", "桃園市",
                  "宜蘭縣", "宜蘭縣")


mydata <- data.frame(NAME_1=tw_shp$NAME_2,
                     NAME_2=chinese_name)
mydata$id <- 0
for(i in 0:22){
  mydata$id[i] <- i
}

tw_map$id <- as.character(as.integer(tw_map$id)+1)


mydata$population[1]=nrow(subset(tourism_data, vb6=="21")) 
mydata$population[2]=nrow(subset(tourism_data, vb6=="22")) 
mydata$population[3]=nrow(subset(tourism_data, vb6=="20")) 
mydata$population[4]=nrow(subset(tourism_data, vb6=="1")) 
mydata$population[5]=nrow(subset(tourism_data, vb6=="16")) 
mydata$population[6]=nrow(subset(tourism_data, vb6=="18")) 
mydata$population[7]=nrow(subset(tourism_data, vb6=="19")) 
mydata$population[8]=nrow(subset(tourism_data, vb6=="6")) 
mydata$population[9]=nrow(subset(tourism_data, vb6=="17")) 
mydata$population[10]=nrow(subset(tourism_data, vb6=="9")) 
mydata$population[11]=nrow(subset(tourism_data, vb6=="15")) 
mydata$population[12]=nrow(subset(tourism_data, vb6=="4")) 
mydata$population[13]=nrow(subset(tourism_data, vb6=="12")) 
mydata$population[14]=nrow(subset(tourism_data, vb6=="14")) 
mydata$population[15]=nrow(subset(tourism_data, vb6=="5")) 
mydata$population[16]=nrow(subset(tourism_data, vb6=="7")) 
mydata$population[17]=nrow(subset(tourism_data, vb6=="13")) 
mydata$population[18]=nrow(subset(tourism_data, vb6=="10")) 
mydata$population[19]=nrow(subset(tourism_data, vb6=="11")) 
mydata$population[20]=nrow(subset(tourism_data, vb6=="3")) 
mydata$population[21]=nrow(subset(tourism_data, vb6=="2")) 
mydata$population[22]=nrow(subset(tourism_data, vb6=="2")) 



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
  labs(title="居住縣市分布", 
       x ="Latitude", y = "Longitude")

tw_ppl_dist



pie_vector=as.integer(mydata$population)

piepercent<- round(100*pie_vector/sum(pie_vector), 1)

pie(pie_vector, labels = piepercent, main = "居住分布",col = rainbow(length(pie_vector)))
legend("right", chinese_name, cex = 1,
   fill = rainbow(length(pie_vector)))






