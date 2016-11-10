
###############################
########### PLOTS #############
###############################

library(graphics)
library(plyr)
library(Hmisc)
library(base)
library(ggplot2)


setwd("C:/Users/Konstantina/Desktop/Distance/Comparison/merged_tables")


CSnE<- read.table("CSnE.txt", h=T)

#Plot all
plot(CSnE$Dist_CS, CSnE$Dist_E)


#Merge with species info
#Uber<- read.table("Uber_54Species_list.txt", h=T)
#Compl<- merge(CSnE, Uber, by.x= "id_no", by.y= "num")
#write.table(Compl, "CSnE_info.txt")

Compl<- read.table("CSnE_info.txt", h=T)



#IUCNhab

par(mfrow=c(3,2))
for (i in unique(Compl$IUCNhab)){
 
	#a<- subset(Compl, IUCNhab==i)
	print(ggplot(subset(Compl, IUCNhab==i),
       aes(x=Dist_CS,
           y=Dist_E,
           colour=factor(subset(id_no, IUCNhab == i))))+
  geom_point(aes(color= id_no)))
	}
  
ggplot(subset(Compl, IUCNhab %in% c("Generalist")),aes(x=Dist_CS,y=Dist_E, color=unique(id_no)))+
  geom_point()+
  scale_fill_brewer(palette="Dark2")
  #scale_fill_manual(aes(breaks = as.factor(unique(id_no))))
  #geom_line(stat = "smooth", method = "loess")+
  #scale_color_continuous(aes(name="",
                        # breaks = unique(id_no)))
                         #labels = c("22709196", "22710791", "22713365", "22715090", "22716487", "22718783", "22727786"),low = "green", high = "red")
  
  
 for (e in unique(a$id_no)){ 
 
	b<- subset(a,id_no==e)
	print(i)
	print(e)
  
  plot(a$Dist_CS, a$Dist_E, main=i, xlim=c(0,5), ylim=c(0,210000), xlab="Circuitscape", ylab="Euclidean", lines(lowess(a$Dist_CS, a$Dist_E),col="red"))
	#pairs(b,panel=panel.smooth, col.line= "red")
}

	
#GLCcodes

par(mfrow=c(3,2))
par(mfrow=c(3,2))
par(mfrow=c(3,2))
for (i in unique(Compl$GLCcodes)){
  
  a<- subset(Compl, GLCcodes==i)
  print(i)
  plot(a$Dist_CS, a$Dist_E, main=i, xlim=c(0,5), ylim=c(0,210000), xlab="Circuitscape", ylab="Euclidean")
}
	
	
#Uber
	

par(mfrow=c(3,2))
par(mfrow=c(3,2))
par(mfrow=c(3,2))
for (i in unique(Compl$Uber)){
  
  a<- subset(Compl, Uber==i)
  print(i)
  plot(a$Dist_CS, a$Dist_E, main=i, xlim=c(0,5), ylim=c(0,210000), xlab="Circuitscape", ylab="Euclidean")
}
	

	

#Order


par(mfrow=c(3,2))
par(mfrow=c(3,2))
par(mfrow=c(3,2))
for (i in unique(Compl$Order)){
  
  a<- subset(Compl, Order==i)
  print(i)
  plot(a$Dist_CS, a$Dist_E, main=i, xlim=c(0,5), ylim=c(0,210000), xlab="Circuitscape", ylab="Euclidean")
}
		
	
	
#Dist


par(mfrow=c(3,2))
par(mfrow=c(3,2))
par(mfrow=c(3,2))
for (i in unique(Compl$Dist)){
  
  a<- subset(Compl, Dist==i)
  print(i)
  plot(a$Dist_CS, a$Dist_E, main=i, xlim=c(0,5), ylim=c(0,210000), xlab="Circuitscape", ylab="Euclidean")
}
		
	
	
