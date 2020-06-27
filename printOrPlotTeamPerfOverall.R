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
    } else if (t20type == "T20W"){
        output$RankT20W = renderUI({
            selectInput('rankT20W', 'Choose the rank',choices=rankValues,selected=input$rankT20W)
        })
        print(input$teamMatchesT20W)
        n <- strsplit(as.character(input$teamMatchesT20W),"-")
        analyzeTeamPerfOverall(input$teamMatchesT20W,input$overallperfFuncT20W,n[[1]][2],input$rankT20W,
                               input$plotOrTable2T20W,
                               input$repType2T20W,t20type)
    }  else if (t20type == "BBL"){
        output$RankBBL = renderUI({
            selectInput('rankBBL', 'Choose the rank',choices=rankValues,selected=input$rankBBL)
        })
        print(input$teamMatchesBBL)
        n <- strsplit(as.character(input$teamMatchesBBL),"-")
        analyzeTeamPerfOverall(input$teamMatchesBBL,input$overallperfFuncBBL,n[[1]][2],input$rankBBL,
                               input$plotOrTable2BBL,
                               input$repType2BBL,t20type)
    
    } else if (t20type == "NTB"){
        output$RankNTB = renderUI({
            selectInput('rankNTB', 'Choose the rank',choices=rankValues,selected=input$rankNTB)
        })
        print(input$teamMatchesNTB)
        n <- strsplit(as.character(input$teamMatchesNTB),"-")
        analyzeTeamPerfOverall(input$teamMatchesNTB,input$overallperfFuncNTB,n[[1]][2],input$rankNTB,
                               input$plotOrTable2NTB,
                               input$repType2NTB,t20type)
        
    } else if (t20type == "PSL"){
        output$RankPSL = renderUI({
            selectInput('rankPSL', 'Choose the rank',choices=rankValues,selected=input$rankPSL)
        })
        print(input$teamMatchesPSL)
        n <- strsplit(as.character(input$teamMatchesPSL),"-")
        analyzeTeamPerfOverall(input$teamMatchesPSL,input$overallperfFuncPSL,n[[1]][2],input$rankPSL,
                               input$plotOrTable2PSL,
                               input$repType2PSL,t20type)
        
    } else if (t20type == "WBB"){
        output$RankWBB = renderUI({
            selectInput('rankWBB', 'Choose the rank',choices=rankValues,selected=input$rankWBB)
        })
        print(input$teamMatchesWBB)
        n <- strsplit(as.character(input$teamMatchesWBB),"-")
        analyzeTeamPerfOverall(input$teamMatchesWBB,input$overallperfFuncWBB,n[[1]][2],input$rankWBB,
                               input$plotOrTable2WBB,
                               input$repType2WBB,t20type)
        
    }

}