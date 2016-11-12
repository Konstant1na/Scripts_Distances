
setwd("C:/Users/Konstantina/Desktop/conefor_analysis")
a <-shell("C:/Users/Konstantina/Desktop/conefor_analysis/coneforWin64.exe -nodeFile Nodes-*.txt -conFile Distances1.txt -t dist all -confProb 200 0.36788 -PC -prefix 1")

###################################################################
###################################################################
######################## Conefor Data #############################
###################################################################
###################################################################



setwd("C:/Users/Konstantina/Desktop/Distance/Comparison/merged_tables")

Compl<- read.table("CSnE_info.txt", h=T)

Compl<- Compl[,c(1,3,4,6,10)]




###################
##Euclidean files##
###################

#Distances#

out_path= "C:/Users/Konstantina/Desktop/Distance/Conefor_analysis/euclidean"

for (i in unique(Compl$id_no)){

	dt<- subset(Compl, id_no==i)
	dt<- dt[, c(2,3,5)]
	head(dt)
	
	#a<- unique(dt$Dist)
	#print(a)
	write.table(dt, paste0(out_path,"/","Distances_", i,".txt"), col.names= F)
	
	}


	
	
######################
##Circuitscape files##
######################

#Distances#

out_path= "C:/Users/Konstantina/Desktop/Distance/Conefor_analysis/circuitscape"

for (i in unique(Compl$id_no)){

	dt<- subset(Compl, id_no==i)
	dt<- dt[, c(2,3,4)]
	head(dt)
	
	write.table(dt, paste0(out_path,"/","Distances_", i,".txt"), col.names=F)
	
	}



	
#####################	
####### Nodes #######	
#####################



	
	
	
	
	

#####################
### Command lines ###
#####################

setwd("C:/Users/Konstantina/Desktop/Distance/merged_tables")

Compl<- read.table("CSnE_info.txt", h=T)
Compl<- Compl[,c(1,3,4,6,10)]

Dist<- read.csv("Dispersal_estimates.csv", h=T)
Dist<- Dist[,c(5,20)]
colnames(Dist) [1]<- "id_no"
colnames(Dist) [2]<- "Disp_mean"

Com<- merge(Compl, Dist, by="id_no")


out_path= "C:/Users/Konstantina/Desktop/Distance/Conefor_analysis/command"


for (i in unique(Com$id_no)){

	dt<- subset(Com, id_no==i)
	print(dt)
	
	a<- unique(dt$Disp_mean)
	print(a)
	
	write.table(dt, paste0(out_path,"/", i, "_",a))
	
	}



	
setwd(out_path)

file_list <- list.files()
file_list


dt<- strsplit(file_list, "_")
a<- lapply(dt, function(x) {paste0("shell('C:/Users/Konstantina/Desktop/conefor_analysis/coneforWin64.exe -nodeFile Nodes",x[1],".txt -conFile Distances", x[1],".txt -t dist all -confProb ",x[2]," 0.36788 -PC -prefix", x[1],"')")} )
a<- (unlist(lapply(a, paste, collapse=" ")))

write.csv(a, "command_line.csv")

	
	

