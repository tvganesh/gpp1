# ############################################################################################333333
# Title :  GooglyPlus - An interactive app to analyze IPL Players, teams and matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 5 Jan 2016
# File: printOrPlotIPLTeamPerfOverall
# More details: https://gigadom.wordpress.com/
#
#########################################################################################################
printOrPlotTeamPerfOverall <- function(input,output,t20type="IPL"){
    # Set the rank of player
    rankValues <- c(1,2,3,4,5,6)
    
    if( t20type == "IPL"){
        output$Rank = renderUI({
            selectInput('rank', 'Choose the rank',choices=rankValues,selected=input$rank)
        })
        print(input$teamMatches)
        n <- strsplit(as.character(input$teamMatches),"-")
        analyzeTeamPerfOverall(input$teamMatches,input$overallperfFunc,n[[1]][2],input$rank,
                               input$plotOrTable2,
                               input$repType2,t20type)
        
    } else if (t20type == "T20M"){
        output$RankT20M = renderUI({
            selectInput('rankT20M', 'Choose the rank',choices=rankValues,selected=input$rankT20M)
        })
        print(input$teamMatchesT20M)
        n <- strsplit(as.character(input$teamMatchesT20M),"-")
        analyzeTeamPerfOverall(input$teamMatchesT20M,input$overallperfFuncT20M,n[[1]][2],input$rankT20M,
                               input$plotOrTable2T20M,
                               input$repType2T20M,t20type)
    }  


}