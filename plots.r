
###############################
########### PLOTS #############
###############################

library(graphics)
library(plyr)
library(Hmisc)
library(base)

setwd("C:/Users/Konstantina/Desktop/Distance/merged_tables")


CSnE<- read.table("merged_tableF.txt", h=T)

#Plot all
plot(CSnE$Dist_CS, CSnE$Dist_E)

#Merge with species info
Uber<- read.table("Uber_54Species_list.txt", h=T)

Compl<- merge(CSnE, Uber, by.x= "id_no", by.y= "num")

unique(Compl$id_no)





par(mfrow=c(3,2))
par(mfrow=c(3,2))
par(mfrow=c(3,2))
for (i in unique(Compl$GLCcodes)){
  
  a<- subset(Compl, GLCcodes==i)
  print(i)
  plot(a$Dist_CS, a$Dist_E, main=i)
}

	
	
	
	
	
	
	
	
	
	
	
	
#CSnEa<- subset(CSnE[CSnE$id_no==22678883,])
#with(subset(CSnE, id_no==22678883, plot(CSnE$Dist_CS, CSnE$Dist_E)))

plot(CSnEa$Dist_CS, CSnEa$Dist_E)

CSnEa<- CSnE[CSnE$id_no==22678883,]

with(CSnE[CSnE$id_no==22681782,], plot(CSnE$Dist_CS, CSnE$Dist_E))

plot(subset(CSnE, CSnE[CSnE$id_no==22678883, select=c(CSnE$Dist_CS, CSnE$Dist_E)))

CSnE[,2]<- lapply(CSnE[,2],as.character)

CSnE$id_no<- as.character(CSnE$id_no)
CSnE$test <- as.factor(CSnE$id_no)

CSnEa<- subset(CSnE, id_no=="22678883")

CSnEa<- subset(CSnE, CSnE[,2]=="22678883")
