#########################################################################################################
#
# Title :  GooglyPlusPlus - An interactive app to analyze T20 Players, teams and matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 16 Jun 2020
# File: analyzeBatsmen.R
# More details: https://gigadom.wordpress.com/
#
#########################################################################################################

# Analyze IPL batsmen
analyzeBatsmen <- function(batsman,func) {
   #print(batsman)
    
    # Return when name is NULL at start
    if(is.null(batsman))
        return()
    
    # Check and get the team indices of IPL teams in which the batsman has played
    i <- getTeamIndex(batsman,"./ipl/iplBattingBowlingDetails/")
    cat("i=",i,"\n")
    cat("analyze=",getwd())
    # Get the team names
    teamNames <- getTeams(i)
    # Check if file exists in the directory. This check is necessary when moving between matchType
    
    batsmanDF <- NULL
    # Create a consolidated Data frame of batsman for all IPL teams played
    for (i in seq_along(teamNames)){
          df <- getBatsmanDetails(team=teamNames[i],name=batsman,dir="./ipl/iplBattingBowlingDetails")
          batsmanDF <- rbind(batsmanDF,df) 
    }
    print(dim(batsmanDF))
    # Call the approporiate function
    if(func == "Batsman Runs vs. Deliveries"){
        batsmanRunsVsDeliveries(batsmanDF,batsman)
    } else if (func == "Predict runs of batsman"){
        batsmanRunsPredict(batsmanDF,batsman)
    }     else if (func == "Dismissals of batsman"){
        batsmanDismissals(batsmanDF,batsman)
    } else if (func == "Batsman's Runs vs Strike Rate"){
        batsmanRunsVsStrikeRate(batsmanDF,batsman)
    } else if (func == "Batsman's Moving Average"){
        batsmanMovingAverage(batsmanDF,batsman)
    } else if (func == "Batsman's Cumulative Average Runs"){
        batsmanCumulativeAverageRuns(batsmanDF,batsman)
    } else if (func == "Batsman's Cumulative Strike Rate"){
        batsmanCumulativeStrikeRate(batsmanDF,batsman)
    } else if (func == "Batsman's Runs against Opposition"){
        batsmanRunsAgainstOpposition(batsmanDF,batsman)
    } else if (func == "Batsman's  Runs at Venue"){
        batsmanRunsVenue(batsmanDF,batsman)
    } else if (func == "Predict Runs of batsman"){
        batsmanRunsPredict(batsmanDF,batsman)
    } 
   
}

