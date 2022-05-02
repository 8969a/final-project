#necessary packages
library(sf)
library(dplyr)
#read census data
race=read.csv("NYC_race_demographics.csv")
income=read.csv("NYC_income_demographics.csv")
#clean up census data to only what we're using
race<-race[-c(1),]
race[,2:50]<-NULL
race[,3:26]<-NULL
race[,10:11]<-NULL
income[1:42]<-NULL
income[2:5]<-NULL
income[3:11]<-NULL
#revamp join fields to make joining possible and easy
race <- race %>% rename(GEOID=FIPS)
income <- income %>% rename(GEOID=FIPS)
income <- income %>% mutate(GEOID=as.character(GEOID))
#race <- race %>% mutate(GEOID=as.numeric(GEOID))
#shp <- shp %>% mutate(GEOID=as.numeric(GEOID))
#save
write.csv(race,"race_data.csv", row.names = TRUE)
write.csv(income,"income_data.csv", row.names = TRUE)