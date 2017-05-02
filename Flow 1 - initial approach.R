#Obtained the accident from [fort lauderdale]{https://fortlauderdale.data.socrata.com/en/Government/Accident/gmea-gh9c}

#Import the data
library(readr)
AccidentsRaw <- read.csv("~/GitHub/CodeFortLdl/Accidents/Accident.csv")

accidents<-AccidentsRaw #create a working df
#pick the most relevant columns 

colnames<-names(accidents) #To show what is avaiable

colnames<-c("Day.of.Week",
            "Street",
            "Road.Surface.Conditions",
            "Weather.Description",
            "Trafficway.Flow.Description",
            "Road.construction",
            "fatality")

#keep only the selected columns
accidents<-colbyname(colnames,AccidentsRaw,"keep")
#convert columns to text
accidents<-lapply(accidents,as.character)
accidents<-lapply(accidents$fatality,as.numeric)

#define a sample size
samplerows<-sample(nrow(AccidentsRaw),700)
#Select a sample from the accicents DF
sample<-accidents[samplerows,]
rownames(sample)<-NULL
#define the streets names to maintain and trim down the sample
streetnames<-names(table(sample$Street)[table(sample$Street)>=1])
sample<-subsetbycollevels(streetnames,"Street",sample)

plot(as.numeric(sample$Road.Surface.Conditions),
     as.numeric(sample$Day.of.Week),type="p",
     )
