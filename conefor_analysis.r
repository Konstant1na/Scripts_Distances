
#############################################
##########    Conefor_analysis   ############
#############################################

setwd("C:/Users/Konstantina/Desktop/Distance/Conefor_analysis/results/all_linear_fitted_groups")#change folder to compare

CS<- read.table("results_all_overall_indices_CS.txt", h=F)
colnames(CS) [1]<- "id_no"
colnames(CS) [2]<- "Disp_mean"
colnames(CS) [3]<- "ConfProb"
colnames(CS) [4]<- "Index"
colnames(CS) [5]<- "Value_CS"

E<- read.table("results_all_overall_indices_E.txt", h=F)
colnames(E) [1]<- "id_no"
colnames(E) [2]<- "Disp_mean"
colnames(E) [3]<- "ConfProb"
colnames(E) [4]<- "Index"
colnames(E) [5]<- "Value_E"

E<- subset(E, E[,4]=="PCnum")
CS<- subset(CS, CS[,4]=="PCnum")

CS_E<- merge(CS, E, by= "id_no")




### Paired t-test
t.test(CS_E$Value_CS,CS_E$Value_E,paired=TRUE)
plot(CS_E$Value_CS,CS_E$Value_E)












