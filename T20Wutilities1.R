library(dplyr)


# Get the team indices of T20 womwn's teams for which the bowler as played
getT20WTeamIndex <- function(batsman,dir="."){  
  teams <-c("Australia","India","Pakistan","West Indies", 'Sri Lanka',
            "England", "Bangladesh","Netherlands","Scotland",
            "Zimbabwe","Ireland","New Zealand","South Africa","Canada",
            "Kenya","Hong Kong","Nepal","Oman","Papua New Guinea",
            "United Arab Emirates","Namibia","Singapore",
            "United States of America","Maldives","Botswana","Nigeria",
            "Germany","Malaysia","Vanuatu",
            "Thailand")
  
  
  cwd=getwd()
  
  cat("Entering  Women teamWIndex",getwd(),"\n")
  cat("cwd=",cwd,"\n")
  cat(getwd(),"\n")
  
  for(team in teams){
    # Set the name of the data frame
    val <- paste(team,"-batsmen",sep="")
    batsmen <- paste(cwd,'/',dir,"/",team,"-batsmen.rds",sep="")
    cat("tiwbat=",batsmen,"\n")
    df <-readRDS(batsmen)
    #Assign a name to the dataframe
    m <-assign(val,df)
    
  } 
  
  #Load add dataframes

             
  
  teamsBatsmen = list(`Australia-batsmen`,`India-batsmen`,`Pakistan-batsmen`,
                      `West Indies-batsmen`,`Sri Lanka-batsmen`,`England-batsmen`,
                      `Bangladesh-batsmen`,`Netherlands-batsmen`,`Scotland-batsmen`,
                      `Zimbabwe-batsmen`,`Ireland-batsmen`,
                      `New Zealand-batsmen`,`South Africa-batsmen`,
                      `Canada-batsmen`,`Kenya-batsmen`,
                      `Hong Kong-batsmen`,`Nepal-batsmen`,`Oman-batsmen`,
                      `Papua New Guinea-batsmen`,`United Arab Emirates-batsmen`,`Namibia-batsmen`,
                      `Singapore-batsmen`,                     
                      `United States of America-batsmen`,`Maldives-batsmen`,
                      `Botswana-batsmen`,`Nigeria-batsmen`,
                      `Germany-batsmen`,
                      `Malaysia-batsmen`,                       
                      `Vanuatu-batsmen`,`Thailand-batsmen`
                      ) 
  
}


