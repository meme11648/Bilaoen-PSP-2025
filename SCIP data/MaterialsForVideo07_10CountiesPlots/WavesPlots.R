#Read data
#Set working directory 
setwd("/Users/pleunipennings/Documents/R_class_2022/Project3_Rochelle_Covid")

#Load libraries
library(dplyr) 
library(ggplot2) 
library(RColorBrewer)

#Read data and create California dataframe
COVIDHigh <- read.csv("CovidNewCasesHighest10Counties.csv")
COVIDHigh$date <- as.Date(COVIDHigh$date)

ggplot(data = COVIDHigh) + 
  geom_point(aes(x = date, y = newcases, color = county))+
  scale_x_date(date_labels = "%b %y", date_breaks = "2 month") +
  ylab("new covid cases") + 
  labs(title = "Covid cases in 10 counties", color = "county")

##Issue 1
#below 0 numbers of cases? Let's fix that. 
#change the limits of the y axis


##Issue 2
#A lot of noise. Let's plot the rolling average (already in the data frame)


##Issue 3
# a lot of points. Do lines look better? 


#Issue 4
#LA has most cases, but maybe that's just because it is such a big county? Let's divide by pop size


#data from another source


#for each row, get the pop size and add it in the pop size colum


#add pop size for new york city (not officially a county) NYC has 18867000 people


#calculate number of cases per 100,000

#Now plot again!


#Issue 5
#It's a mess! Let's use facet_wrap


###Issue 6: need in longer format. Let's wrte to a long and skinny PDF

