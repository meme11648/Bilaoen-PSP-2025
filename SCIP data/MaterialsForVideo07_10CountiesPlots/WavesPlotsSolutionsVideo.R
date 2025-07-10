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
ggplot(data = COVIDHigh) +  
  geom_point(aes(x = date, y = newcases, color = county))+
  scale_x_date(date_labels = "%b %y", date_breaks = "2 month") +
  ylab("new covid cases") + 
  labs(title = "Covid cases in 10 counties", color = "county") +
  coord_cartesian(ylim = c(0, max(COVIDHigh$newcases)))


##Issue 2
#A lot of noise. Let's plot the rolling average (already in the data frame)
ggplot(data = COVIDHigh) +  
  geom_point(aes(x = date, y = cases_07da, color = county))+
  scale_x_date(date_labels = "%b %y", date_breaks = "2 month") +
  ylab("new covid cases") + 
  labs(title = "Covid cases in 10 counties", color = "county") +
  coord_cartesian(ylim = c(0, max(COVIDHigh$cases_07da)))


##Issue 3
# a lot of points. Do lines look better? 
ggplot(data = COVIDHigh) +  
  geom_line(aes(x = date, y = cases_07da, color = county))+
  scale_x_date(date_labels = "%b %y", date_breaks = "2 month") +
  ylab("new covid cases") + 
  labs(title = "Covid cases in 10 counties", color = "county") +
  coord_cartesian(ylim = c(0, max(COVIDHigh$cases_07da)))


#Issue 4
#LA has most cases, but maybe that's just because it is such a big county? Let's divide by pop size
COVIDHigh$popsize = 0 

#data from another source
PopSizes <- read.csv("PopSizeCounties.csv")

#for each row, get the pop size and add it in the pop size colum
for (i in 1:nrow(COVIDHigh)){
  fips <- COVIDHigh$fips[i]
  if (length(which(PopSizes$FIPStxt==fips))==1){ #only do next steps if we have a match
    popsize = PopSizes$Population.2020[PopSizes$FIPStxt==fips]
    COVIDHigh$popsize[i]<-popsize
  }
}

#add pop size for new york city (not officially a county) NYC has 18867000 people
COVIDHigh$popsize[COVIDHigh$county=="New York City"]<-18867000

#calculate number of cases per 100,000
COVIDHigh$casesper100000<-COVIDHigh$cases_07da/COVIDHigh$popsize*100000

#Now plot again!
ggplot(data = COVIDHigh) +  
  geom_line(aes(x = date, y = casesper100000, color = county))+
  scale_x_date(date_labels = "%b %y", date_breaks = "2 month") +
  ylab("covid cases per 100000 people") + 
  labs(title = "Covid cases in 10 counties", color = "county") +
  coord_cartesian(ylim = c(0, max(COVIDHigh$casesper100000)))


#Issue 5
#It's a mess! Let's use facet_wrap
ggplot(data = COVIDHigh) +  
  geom_line(aes(x = date, y = casesper100000, color = county))+
  scale_x_date(date_labels = "%b %y", date_breaks = "2 month") +
  ylab("covid cases per 100000 people") + 
  labs(title = "Covid cases in 10 counties", color = "county") +
  coord_cartesian(ylim = c(0, max(COVIDHigh$casesper100000)))+
  facet_wrap(~county, ncol = 1)


###Issue 6: need in longer format. Let's wrte to a long and skinny PDF
pdf(file = "PDF_10Counties_CovidWaves.pdf", width = 8, height = 14)
ggplot(data = COVIDHigh) +  
  geom_line(aes(x = date, y = casesper100000, color = county))+
  scale_x_date(date_labels = "%b %y", date_breaks = "2 month") +
  ylab("covid cases per 100000 people") + 
  labs(title = "Covid cases in 10 counties", color = "county") +
  coord_cartesian(ylim = c(0, max(COVIDHigh$casesper100000)))+
  facet_wrap(~county, ncol = 1)
dev.off()

