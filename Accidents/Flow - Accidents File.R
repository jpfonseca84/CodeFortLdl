accidents<-AccidentsRaw
#remove NA columns
accidents<-removeNAColumns(accidents,0.5)

columns<-21
names(accidents[columns])
accidents[,columns]

            #transform Unknown in NA on column 19 ("WIthin.Interchange")
accidents$Within.Interchange[accidents$Within.Interchange=="UNKNOWN"]<-NA

#remove the records below
accidents<-accidents[-c(as.vector(accidents$City=="OAKLAND PARK"),
                        ),]

      
droplevels(accidents$Within.Interchange)
#reading the columns fro DB, I'm keepting the following list of columns
keepcols<-c(4, #"Day .of.Week", a factor
            8, # "Street", a vector of street names,
            13, #"Number.of.Units.Involved", a vector,
            19, # factor within interchange)

