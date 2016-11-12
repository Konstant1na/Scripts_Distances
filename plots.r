
###############################
########### PLOTS #############
###############################

library(graphics)
library(plyr)
library(Hmisc)
library(base)
library(ggplot2)
library(RColorBrewer)
library(reshape2)
library(gridExtra)




setwd("C:/Users/Konstantina/Desktop/Distance/Comparison/merged_tables")


CSnE<- read.table("CSnE.txt", h=T)

#Plot all
plot(CSnE$Dist_CS, CSnE$Dist_E)


#Merge with species info
	#Uber<- read.table("Uber_54Species_list.txt", h=T)
	#Compl<- merge(CSnE, Uber, by.x= "id_no", by.y= "num")
	#write.table(Compl, "CSnE_info.txt")

Compl<- read.table("CSnE_info2.txt", h=T)
Compl$id_no<- as.factor(Compl$id_no)





	
	
#IUCNhab
out_path= "C:/Users/Konstantina/Desktop/Distance/Comparison/plots/IUCNhab"

for (i in unique(Compl$IUCNhab)){

	a<- subset(Compl, IUCNhab==i)
	
	cols = colorRampPalette(brewer.pal(12, "Paired"))
	mypal = cols(length(unique(a$id_no)))
	
	b<- print(ggplot(a, aes(x=Dist_CS, y=Dist_E), color=id_no)+
	geom_point(aes(color=id_no), size=1.2)+
	scale_color_manual(values=mypal)+
	labs(title = i, x = "Circuitscape", y = "Euclidean",colour="Species ID")+
	coord_cartesian(xlim = c(0, 5),ylim=c(0,210000 ))+
	theme(plot.title=element_text(face = "bold"), legend.title=element_text(face="italic"),
	legend.key = element_rect(fill = "white"))+
	guides(colour = guide_legend(override.aes = list(size=4))))
	
	
	file_name = paste0(out_path,"/", i, ".tiff", sep="")
	print(b,tiff(file_name, width= 3000, height=2000, units="px", res=300))
	dev.off()
	}




	
#GLCcodes
out_path= "C:/Users/Konstantina/Desktop/Distance/Comparison/plots/GLCcodes"

for (i in unique(Compl$GLCcodes)){

	a<- subset(Compl, GLCcodes==i)
	
	cols = colorRampPalette(brewer.pal(12, "Paired"))
	mypal = cols(length(unique(a$id_no)))
	
	b<- print(ggplot(a, aes(x=Dist_CS, y=Dist_E), color=id_no)+
	geom_point(aes(color=id_no), size=1.2)+
	scale_color_manual(values=mypal)+
	labs(title = i, x = "Circuitscape", y = "Euclidean",colour="Species ID")+
	coord_cartesian(xlim = c(0, 5),ylim=c(0,210000 ))+
	theme(plot.title=element_text(face = "bold"), legend.title=element_text(face="italic"),
	legend.key = element_rect(fill = "white"))+
	guides(colour = guide_legend(override.aes = list(size=4))))
	
	
	file_name = paste0(out_path,"/", i, ".tiff", sep="")
	print(b,tiff(file_name, width= 3000, height=2000, units="px", res=300))
	dev.off()
	}
	
	
	
	
#uber
	
out_path= "C:/Users/Konstantina/Desktop/Distance/Comparison/plots/Uber"

for (i in unique(Compl$uber)){

	a<- subset(Compl, uber==i)
	
	cols = colorRampPalette(brewer.pal(12, "Paired"))
	mypal = cols(length(unique(a$id_no)))
	
	b<- print(ggplot(a, aes(x=Dist_CS, y=Dist_E), color=id_no)+
	geom_point(aes(color=id_no), size=1.2)+
	scale_color_manual(values=mypal)+
	labs(title = i, x = "Circuitscape", y = "Euclidean",colour="Species ID")+
	coord_cartesian(xlim = c(0, 5),ylim=c(0,210000 ))+
	theme(plot.title=element_text(face = "bold"), legend.title=element_text(face="italic"),
	legend.key = element_rect(fill = "white"))+
	guides(colour = guide_legend(override.aes = list(size=4))))
	
	
	file_name = paste0(out_path,"/", i, ".tiff", sep="")
	print(b,tiff(file_name, width= 3000, height=2000, units="px", res=300))
	dev.off()
	}

	

	
#Order

out_path= "C:/Users/Konstantina/Desktop/Distance/Comparison/plots/Order"

for (i in unique(Compl$Order)){

	a<- subset(Compl, Order==i)
	
	cols = colorRampPalette(brewer.pal(12, "Paired"))
	mypal = cols(length(unique(a$id_no)))
	
	b<- print(ggplot(a, aes(x=Dist_CS, y=Dist_E), color=id_no)+
	geom_point(aes(color=id_no), size=1.2)+
	scale_color_manual(values=mypal)+
	labs(title = i, x = "Circuitscape", y = "Euclidean",colour="Species ID")+
	coord_cartesian(xlim = c(0, 5),ylim=c(0,210000 ))+
	theme(plot.title=element_text(face = "bold"), legend.title=element_text(face="italic"),
	legend.key = element_rect(fill = "white"))+
	guides(colour = guide_legend(override.aes = list(size=4))))
	
	
	file_name = paste0(out_path,"/", i, ".tiff", sep="")
	print(b,tiff(file_name, width= 3000, height=2000, units="px", res=300))
	dev.off()
	}

	
	
#DistC

out_path= "C:/Users/Konstantina/Desktop/Distance/Comparison/plots/DistC"

for (i in unique(Compl$DistC)){

	a<- subset(Compl, DistC==i)
	
	cols = colorRampPalette(brewer.pal(12, "Paired"))
	mypal = cols(length(unique(a$id_no)))
	
	b<- print(ggplot(a, aes(x=Dist_CS, y=Dist_E), color=id_no)+
	geom_point(aes(color=id_no), size=1.2)+
	scale_color_manual(values=mypal)+
	labs(title = i, x = "Circuitscape", y = "Euclidean",colour="Species ID")+
	coord_cartesian(xlim = c(0, 5),ylim=c(0,210000 ))+
	theme(plot.title=element_text(face = "bold"), legend.title=element_text(face="italic"),
	legend.key = element_rect(fill = "white"))+
	guides(colour = guide_legend(override.aes = list(size=4))))
	
	
	file_name = paste0(out_path,"/", i, ".tiff", sep="")
	print(b,tiff(file_name, width= 3000, height=2000, units="px", res=300))
	dev.off()
	}






	
