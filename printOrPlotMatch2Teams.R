# ############################################################################################333333
# Title :  GooglyPlus - An interactive app to analyze IPL Players, teams and matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 5 Jan 2016
# File: printOrPlotIPLMatch2Teams
# More details: https://gigadom.wordpress.com/
#
#########################################################################################################
printOrPlotMatch2Teams <- function(input,output,t20type="IPL"){
    
    print("Entering print plot2 teams")
    cat("t20=",t20type,"\n")
    # Get the teams
    # Get the match
    if( t20type == "IPL")
        p <- strsplit(as.character(input$match2),"-")
    else if (t20type == "T20M")  
        p <- strsplit(as.character(input$match2T20M),"-")
    
    teams2 <- c(p[[1]][1],p[[1]][2])
    
    cat("team=",teams2,"\n")
 
    
    
    if( t20type == "IPL"){
        # Set the IPL teams
        output$selectTeam2 <- renderUI({ 
            selectInput('team2', 'Choose team',choices=teams2,selected=input$team2)
        })
        
        #Find the other team
        otherTeam = setdiff(teams2,input$team2)
        cat("IPL team=",input$team2,"other team=",otherTeam)
    } else if (t20type == "T20M"){
        output$selectTeamT20M <- renderUI({ 
            selectInput('team2T20M', 'Choose team',choices=teams2,selected=input$team2T20M)
        })
        otherTeam = setdiff(teams2,input$team2T20M)
        cat("T20 team=",input$team2T20M,"other team=",otherTeam)
    }   

    if(t20type == "IPL")
        a <- analyzeMatches2Teams(input$match2,input$matches2TeamFunc,input$plotOrTable1,
                              input$repType,input$team2,otherTeam)
    else if (t20type == "T20M")
        a <- analyzeMatches2Teams(input$match2T20M,input$matches2T20MTeamFunc,input$plotOrTable1T20M,
                                  input$repTypeT20M,input$team2T20M,otherTeam)
    
    
    head(a)    
  
    a
}