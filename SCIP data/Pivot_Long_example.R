#Prepare
setwd("~/PINC 2025/Bilaoen-PSP-2025/SCIP data")

library("tidyr")
library("dplyr")
library("ggplot2")

#Read in data
read.csv("CovidEuropeData.csv") -> Covid

#See that data is not tidy
head(Covid)

#Make the data tidy (long format)
Covid_long = pivot_longer(data = Covid, !Cases_per_100000, names_to = "Week", values_to = "CasesPer100K")   
#Change the week to a numeric value
Covid_long = mutate(Covid_long, Week =  as.numeric(substr(Week,6,20))) 
#Change name of first column
names(Covid_long)[1]<-"Location"

Covid_long =  Covid_long[Covid_long$Location!="",]

#Make data tidy (longer) and make week a numeric in one go. 
Covid_long <- Covid %>% 
  pivot_longer(!Cases_per_100000, names_to = "Week", values_to = "CasesPer100k")%>%
  mutate(Week =  as.numeric(substr(Week,6,20)))


#Plot! 
ggplot(Covid_long, aes(x=Week, y = CasesPer100K)) +
  geom_line(aes(col="pink")) 

#Problem! Weeks 1-7 are in the new year! 
#Quick fix: add 52 to the small numbers
#Bonus queston: how to use mutate to do this? 
#Bonus question 2: can you think of (or look up) a more elegant solution, 
    #so that the week number is the actual week number? 

for (i in 1:length(Covid_long$Week)){
  if (Covid_long$Week[i]<10) Covid_long$Week[i] = Covid_long$Week[i]+52
}

#Plot again
ggplot(Covid_long, aes(x=Week, y = CasesPer100K)) +
  geom_line(aes(col= Location)) 

MeansByLocation <- Covid_long %>% 
  group_by(Location) %>%
  summarise(mean = mean(CasesPer100K))

MeansByLocation <- summarise(group_by(Covid_long, Location), mean = mean(CasesPer100K))

###Code for next video

MeansByCountry <- Covid_long%>%
  group_by(Location)%>%
  summarise(mean = mean(CasesPer100K))

#this does not work
MeansByWeek <- Covid_long%>%
  group_by(Week) %>%
  summarise(mean = mean(CasesPer100K)) 

MeansByWeek <- summarise(group_by(Covid_long, Week), mean = mean(CasesPer100K))

ggplot(Covid_long, aes(x=Week, y = CasesPer100K)) +
  geom_line(aes(col= Location)) + 
  geom_line(data = MeansByWeek, aes(x = Week, y = mean), col = "black", lwd = 2)

Countries <- read.csv("CountryPopSizes.csv")

#there must be a column that the two data frames have in common
Covid_Long_PopSize <- left_join(Covid_long, Countries, by = c("Location" = "Country"))


