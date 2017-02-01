
###############################
########### PLOTS #############
###############################


library(plyr)
library(Hmisc)
library(base)
library(ggplot2)
library(RColorBrewer)
library(reshape2)
library(gridExtra)
library(ggpmisc)

library(mgcv)

setwd("C:/Users/Konstantina/Desktop/Distance/Comparison/merged_tables")


CSnE<- read.table("CSnE.txt", h=T)

#Plot all
plot(CSnE$Dist_CS, CSnE$Dist_E)

CSnE$id_no<- as.factor(CSnE$id_no)
cols = colorRampPalette(brewer.pal(12, "Paired"))
	mypal = cols(length(unique(CSnE$id_no)))
	
	ggplot(CSnE, aes(x=Dist_CS, y=Dist_E), color=id_no)+
	geom_point(aes(color=id_no), size=1.35)+
	scale_color_manual(values=mypal)+
	scale_x_continuous(breaks = seq(0,5,0.1))+
	scale_y_continuous(breaks = seq(0, 200000,10000))
	#labs(title = i, x = "Circuitscape", y = "Euclidean",colour="Species ID")+
	#coord_cartesian(xlim = c(0, 5),ylim=c(0,210000 ))+
	#theme(plot.title=element_text(face = "bold"), legend.title=element_text(face="italic"),
	#legend.key = element_rect(fill = "white"))+
	#guides(colour = guide_legend(override.aes = list(size=4)))
	
	
#Merge with species info
	#Uber<- read.table("Uber_54Species_list.txt", h=T)
	#Compl<- merge(CSnE, Uber, by.x= "id_no", by.y= "num")
	#write.table(Compl, "CSnE_info.txt")

Compl<- read.table("CSnE_info2.txt", h=T)
Compl$id_no<- as.factor(Compl$id_no)





	
	
#IUCNhab
out_path= "C:/Users/Konstantina/Desktop/Distance/Comparison/plots/lowRes"

for (i in unique(Compl$IUCNhab)){

	a<- subset(Compl, IUCNhab==i)
	
	cols = colorRampPalette(brewer.pal(12, "Paired"))
	mypal = cols(length(unique(a$id_no)))
	
	b<- print(ggplot(a, aes(x=Dist_CS, y=Dist_E), color=id_no)+
	geom_point(aes(color=id_no), size=1.35)+
	scale_color_manual(values=mypal)+
	labs(title = i, x = "Circuitscape", y = "Euclidean",colour="Species ID")+
	coord_cartesian(xlim = c(0, 5),ylim=c(0,210000 ))+
	theme(plot.title=element_text(face = "bold"), legend.title=element_text(face="italic"),
	legend.key = element_rect(fill = "white"))+
	guides(colour = guide_legend(override.aes = list(size=4))))
	
	
	file_name = paste0(out_path,"/", i, ".png", sep="")
	print(b,png(file_name, width= 750, height=550))
	dev.off()
	}

##for .tiff##
#width= 1200, height=800, units="px", res=200

	
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



#############################
########  Fit lines  ########
#############################

setwd("C:/Users/Konstantina/Desktop/Distance/Comparison/merged_tables")

CSnE<- read.table("CSnE.txt", h=T)


cols = colorRampPalette(brewer.pal(12, "Paired"))
	mypal = cols(length(unique(CSnE$id_no))+1)

p<- ggplot(CSnE, aes(x=Dist_CS, y=Dist_E))
	
#coef(lm(Dist_CS ~ Dist_E, data = CSnE))
#(Intercept)       Dist_E 
#1.0222632476    0.0000107601 


## Histogram
ggplot(CSnE, aes(x= CSnE$Dist_CS))+  geom_histogram(binwidth=.1, colour="red", fill="black")

ggplot(CSnE, aes(x= CSnE$Dist_E))+  geom_histogram(binwidth=.1, colour="red", fill="grey")
hist(CSnE$Dist_E)





	
plot(CSnE$Dist_CS, CSnE$Dist_E)
mod <- nls(CSnE$Dist_E ~ exp(a + b * CSnE$Dist_CS), data = CSnE, start = list(a = 0, b = 0))
lines(CSnE$Dist_CS, predict(mod, list(x = CSnE$Dist_CS)))	
	

	geom_curve(stat = "identity", position = "identity", curvature = 0.5, angle = 90, ncp = 5, 
			arrow = NULL, lineend = "butt", na.rm = FALSE, inherit.aes = TRUE, ...)

my.formula <- y ~poly(x, 2)
p+ geom_point(aes(color = factor(id_no)), size=1.2)+ stat_smooth(method = "lm", formula = my.formula, size = 1)+
	stat_poly_eq(formula = my.formula,aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~"), color="black"), parse = TRUE)

library(mgcv)	

my.formula <- y ~ s(x)
p+ geom_point(aes(color = factor(id_no)), size=1.2)+geom_smooth(method = "glm",
              family = gaussian(link="log"), 
              aes(colour = "Exponential"))+
	stat_poly_eq(formula = my.formula,aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~"), color="black"), parse = TRUE)
			
			
