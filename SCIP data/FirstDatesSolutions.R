
#Set working directory 
setwd("/Users/pleunipennings/Documents/R_class_2022/Project3_Rochelle_Covid")

#Load libraries
library(dplyr) 
library(ggplot2) 
library(RColorBrewer)

#Read data and create California dataframe
COVIDraw <- read.csv("us-counties.csv")
COVIDraw$date <- as.Date(COVIDraw$date)

##########
# Number 1 Find the row number of the first date for one county
##########

county = "San Mateo"
RowNumberForCounty = which (COVIDraw$county ==  county) [1]

##########
# Number 2 Add that row number to a vector
##########

RowNumberFirstDates <- c()
RowNumberFirstDates <- c(RowNumberFirstDates, RowNumberForCounty)

##########
# Number 3 Create a vector of all counties
##########

ListCounties <- unique(COVIDraw$county)

##########
# Number 4 Collect the first dates for all counties
##########

RowNumberFirstDates <- c()

for (specificcounty in ListCounties){
  RowNumberForCounty = which (COVIDraw$county ==  specificcounty) [1]
  RowNumberFirstDates <- c(RowNumberFirstDates, RowNumberForCounty)
}


##########
# Number 5 Use the vector with row numbers to select all first dates
##########

FirstDates <- COVIDraw[RowNumberFirstDates,  ]


##########
# Number 6 Plot the first dates!
##########

c = ggplot(data = FirstDates, aes(date, fill = state))

c + geom_bar(position = "stack") +
  theme(panel.grid.minor.x = element_blank(), 
      axis.title.x = element_blank(), legend.position = "bottom", 
      legend.title = element_text(face = "bold"))+
  scale_x_date(date_labels = "%d %b %Y", 
               date_breaks = "2 weeks", 
               limits = as.Date(c("2020-01-01", "2020-05-01")))


MyStates <- c("Washington", "California", "Illinois", 
"New York")

MyFirstCase<-FirstDates[FirstDates$state %in% MyStates,]

c = ggplot(data = MyFirstCase, aes(date, fill = state))

c + geom_bar(position = "stack") +
  theme(panel.grid.minor.x = element_blank(), 
        axis.title.x = element_blank(), legend.position = "bottom", 
        legend.title = element_text(face = "bold"))+
  scale_x_date(date_labels = "%d %b %y", 
               date_breaks = "1 month", 
               limits = as.Date(c("2020-01-01", "2020-05-01")))+
  facet_wrap(~state)




c + geom_bar(position = "stack") +
  #scale_fill_brewer(palette = "Set1")+
  theme(panel.grid.minor.x = element_blank(), 
        axis.title.x = element_blank(), legend.position = "bottom", 
        legend.title = element_text(face = "bold"))+
  scale_x_date(date_labels = "%b %y", 
               date_breaks = "1 month", 
               limits = as.Date(c("2020-01-20", "2020-04-01")))+
  facet_wrap(~state)
