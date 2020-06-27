# ############################################################################################333333
# Title :  GooglyPlus - An interactive app to analyze IPL Players, teams and matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 5 Jan 2016
# File: printOrPlotIPLMatch
# More details: https://gigadom.wordpress.com/
#
#########################################################################################################
printOrPlotMatch <- function(input,output,t20type="IPL"){
   cat("match dir=",getwd(),"\n")
  
    print("Entering print plot")
    cat("t20=",t20type,"\n")
    # Get the match
    if( t20type == "IPL")
          m <- strsplit(as.character(input$match),"-")
    else if (t20type == "T20M")  
          m <- strsplit(as.character(input$matchT20M),"-")
    else if (t20type == "T20W")  
      m <- strsplit(as.character(input$matchT20W),"-")
    else if (t20type == "BBL")  
      m <- strsplit(as.character(input$matchBBL),"-")
    # Get the teams
    teams <- c(m[[1]][1],m[[1]][2])
  
    cat("team=",teams,"\n")
    # Set the IPL teams
    if( t20type == "IPL"){
      output$selectTeam <- renderUI({ 
          selectInput('team', 'Choose team',choices=teams,selected=input$team)
      })

      otherTeam = setdiff(teams,input$team)
      cat("IPL team=",input$team,"other team=",otherTeam)
    } else if (t20type == "T20M"){
      output$selectTeamT20M <- renderUI({ 
        selectInput('teamT20M', 'Choose team',choices=teams,selected=input$teamT20M)
      })
      otherTeam = setdiff(teams,input$teamT20M)
      cat("T20 team=",input$teamT20M,"other team=",otherTeam)
    } else if (t20type == "T20W"){
      output$selectTeamT20W <- renderUI({ 
        selectInput('teamT20W', 'Choose team',choices=teams,selected=input$teamT20W)
      })
      otherTeam = setdiff(teams,input$teamT20W)
      cat("T20 team=",input$teamT20W,"other team=",otherTeam)
    } else if (t20type == "BBL"){
      output$selectTeamBBL <- renderUI({ 
        selectInput('teamBBL', 'Choose team',choices=teams,selected=input$teamBBL)
      })
      otherTeam = setdiff(teams,input$teamBBL)
      cat("T20 team=",input$teamBBL,"other team=",otherTeam)
    }
    
    print(otherTeam)
 

    if(t20type == "IPL")
          a <- analyzeMatches(input$match,input$matchFunc,input$plotOrTable,input$team,otherTeam,t20type)
    else if (t20type == "T20M")
          a <- analyzeMatches(input$matchT20M,input$matchFuncT20M,input$plotOrTableT20M,input$teamT20M,otherTeam,t20type)
    else if (t20type == "T20W")
      a <- analyzeMatches(input$matchT20W,input$matchFuncT20W,input$plotOrTableT20W,input$teamT20W,otherTeam,t20type)
    else if (t20type == "BBL")
      a <- analyzeMatches(input$matchBBL,input$matchFuncBBL,input$plotOrTableBBL,input$teamBBL,otherTeam,t20type)
    head(a)
    a
    
}