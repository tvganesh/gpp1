#########################################################################################################
#
# Title :  GooglyPlusPlus - An interactive app to analyze Players, teams and matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 17 Jun 2020
# File: analyzeBowlers.R
# More details: https://gigadom.wordpress.com/
#
#########################################################################################################
# Analyze IPL bowlers
analyzeBowlers <- function(bowler,func) {
  
    # Check and get the team indices of IPL teams in which the bowler has played
    cat("analBow=",getwd())
    i <- getTeamIndex_bowler(bowler,"./ipl/iplBattingBowlingDetails")
    cat("analBow1=",getwd())
    # Get the team names
    teamNames <- getTeams(i)
    # Check if file exists in the directory. This check is necessary when moving between matchType
    
    bowlerDF <- NULL
    
    # Create a consolidated Data frame of batsman for all IPL teams played
    for (i in seq_along(teamNames)){
          df <- getBowlerWicketDetails(team=teamNames[i],name=bowler,dir="./ipl/iplBattingBowlingDetails")
          bowlerDF <- rbind(bowlerDF,df) 
        
    }
 
    # Call the necessary function
    if(func == "Mean Economy Rate of bowler"){
        bowlerMeanEconomyRate(bowlerDF,bowler)
    } else if (func == "Mean runs conceded by bowler"){
        bowlerMeanRunsConceded(bowlerDF,bowler)
    }     else if (func == "Bowler's Moving Average"){
        bowlerMovingAverage(bowlerDF,bowler)
    } else if (func == "Bowler's Cumulative Avg. Wickets"){
        bowlerCumulativeAvgWickets(bowlerDF,bowler)
    } else if (func == "Bowler's Cumulative Avg. Economy Rate"){
        bowlerCumulativeAvgEconRate(bowlerDF,bowler)
    } else if (func == "Bowler's Wicket Plot"){
        bowlerWicketPlot(bowlerDF,bowler)
    } else if (func == "Bowler's Wickets against opposition"){
        bowlerWicketsAgainstOpposition(bowlerDF,bowler)
    } else if (func == "Bowler's Wickets at Venues"){
        bowlerWicketsVenue(bowlerDF,bowler)
    } else if (func == "Bowler's wickets prediction"){
        # This is for the function wicket predict
        bowlerDF1 <- NULL
        # Create a consolidated Data frame of batsman for all IPL teams played
        for (i in seq_along(teamNames)){    
            # The below 2 lines for Bowler's wicket prediction
            df1 <- getDeliveryWickets(team=teamNames[i],dir="./IPLmatches",name=bowler,save=FALSE)
            bowlerDF1 <- rbind(bowlerDF1,df1)
        }
        bowlerWktsPredict(bowlerDF1,bowler)
        
    }

}

