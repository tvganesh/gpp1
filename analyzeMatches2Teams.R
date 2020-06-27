#########################################################################################################
#
# Title :  GooglyPlus - An interactive app to analyze IPL Players, teams and matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 25 Dec 2016
# File: analyzeIPLMatches2Teams.R
# More details: https://gigadom.wordpress.com/
#
#########################################################################################################
#Analyze all IPL matches between 2 IPL teams
analyzeMatches2Teams <- function(match2,matchFunc,plotOrTable1,repType, team,opposition,t20type) {
    
    
    # Check and get the team indices of IPL teams in which the bowler has played
    print("Entering matches 2 analyze..........")
    cat("match2=",match2,"matchFunc=",matchFunc,"plotTbl=",plotOrTable1,"rep=",repType, 
        "team=",team,"oppn=",opposition,"type=",t20type,"\n")
    if(t20type == "IPL"){
        IPLmatch <- paste("./ipl/iplMatches2Teams/", match2,".RData",sep="")
        cat("IPL2=",getwd(),"\n")
        load(IPLmatch)
        matchesDF <- matches
    } else if (t20type == "T20M"){
        T20Mmatch <- paste("./t20/t20Matches2Teams/", match2,".RData",sep="")
        cat("t20m2=",getwd(),"\n")
        load(T20Mmatch)
        matchesDF <- matches
        
    } else if (t20type == "T20W"){
        T20Wmatch <- paste("./t20/t20WomenMatches2Teams/", match2,".RData",sep="")
        cat("T20W2=",getwd(),"\n")
        load(T20Wmatch)
        matchesDF <- matches
        
    } else if (t20type == "BBL"){
        BBLmatch <- paste("./bbl/bblMatches2Teams/", match2,".RData",sep="")
        cat("BBL2=",getwd(),"\n")
        load(BBLmatch)
        matchesDF <- matches
        
    } else if (t20type == "NTB"){
        NTBmatch <- paste("./ntb/ntbMatches2Teams/", match2,".RData",sep="")
        cat("NTB2=",getwd(),"\n")
        load(NTBmatch)
        matchesDF <- matches
        
    }
    
    cat("dim1=",dim(matchesDF),"\n")
    
    if(plotOrTable1 == 1){
        val1=TRUE
    } else {
        val1= FALSE
    }
    
    cat("reptype=",repType,"\n")
    if(repType == 1){
        val2="summary"
    } else {
        val2= "detailed"
    }
    
    # Call the correct function
    if(matchFunc == "Team Batting Scorecard All Matches"){
        cat("dim2=",dim(matchesDF),"team=",team,"oppn=",opposition,"\n")
        teamBattingScorecardOppnAllMatches(matchesDF,team, opposition)
    } else if (matchFunc == "Team Batsmen Batting Partnerships All Matches"){
        cat("dim3=",dim(matchesDF),"team=",team,"oppn=",opposition,"\n")
        if(val1 == TRUE){
            teamBatsmenPartnershipOppnAllMatchesChart(matchesDF,team,opposition,plot=val1)
        } else if(val1 == FALSE){
            if(repType ==1){
                teamBatsmenPartnershiOppnAllMatches(matchesDF,team,report="summary")
            } else if(repType ==2){
                teamBatsmenPartnershiOppnAllMatches(matchesDF,team,report="detailed")
            }
        }
    } else if (matchFunc == "Team Batsmen vs Bowlers all Matches"){
        teamBatsmenVsBowlersOppnAllMatches(matchesDF,team,opposition,plot=val1)
    }  else if (matchFunc == "Team Bowling Scorecard All Matches"){
        teamBowlingPerfOppnAllMatches(matchesDF,team, opposition)    
    } else if (matchFunc == "Team Wickets Opposition All Matches"){
        teamBowlersWicketsOppnAllMatches(matchesDF,team,opposition,plot=val1)
    } else if (matchFunc == "Team Bowler vs Batsmen All Matches"){
        teamBowlersVsBatsmenOppnAllMatches(matchesDF,team,opposition,plot=val1)
    } else if (matchFunc == "Team Bowlers Wicket Kind All Matches"){
        teamBowlersWicketKindOppnAllMatches(matchesDF,team,opposition,plot=val1)
    } else if (matchFunc == "Team Bowler Wicket Runs All Matches"){
        teamBowlersWicketRunsOppnAllMatches(matchesDF,team,opposition,plot=val1)
    } else if (matchFunc == "Win Loss All Matches"){
        plotWinLossBetweenTeams(team,opposition,"./IPLmatches")
    }
    
   
    
}

