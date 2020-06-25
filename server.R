#########################################################################################################
#
# Title :  GooglyPlus - An interactive app to analyze IPL Players, teams and matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 25 Dec 2016
# File: server.R
# More details: https://gigadom.wordpress.com/
#
#########################################################################################################
library(shiny)
library(yorkr)
library(rpart)
library(dplyr)
library(ggplot2)
library(rpart.plot)

# Source files

source("definitions.R")
source("IPLutilities.R")
source("T20Mutilities.R")
source("analyzeBatsmen.R")
source("analyzeBowlers.R")
source("analyzeMatches.R")
source("analyzeMatches2Teams.R")
source("analyzeTeamPerfOverall.R")
source("printOrPlotMatch.R")
source('printOrPlotMatch2Teams.R')
source('printOrPlotTeamPerfOverall.R')
shinyServer(function(input, output,session) {
    
    # Analyze and display batsmen plots
    output$batsmanPlotIPL <- renderPlot({  
        analyzeBatsmen(input$batsmanIPL,input$batsmanFuncIPL, "IPL")
        
    })
    
    # Analyze and display bowler plots
    output$bowlerPlotIPL <- renderPlot({  
        analyzeBowlers(input$bowlerIPL,input$bowlerFuncIPL)
        
    })
    
    ######################################## IPL Match  #############################################
    # Analyze and display IPL Match plot
    output$IPLMatchPlot <- renderPlot({ 
        printOrPlotMatch(input, output,"IPL")
     
    })
    
    # Analyze and display IPL Match table
    output$IPLMatchPrint <- renderTable({ 
        a <- printOrPlotMatch(input, output,"IPL")
        a 
        
    })
    # Output either a table or a plot 
    output$plotOrPrintIPLMatch <-  renderUI({ 
        # Check if output is a dataframe. If so, print
        if(is.data.frame(scorecard <- printOrPlotMatch(input, output,"IPL"))){
            tableOutput("IPLMatchPrint")
        }
        else{ #Else plot
            plotOutput("IPLMatchPlot")
        }
      
    })
   
    #################################### IPL Matches between 2 teams ######################
    # Analyze Head to head confrontation of IPL teams
    
    # Analyze and display IPL Matches between 2 teams plot
    output$IPLMatch2TeamsPlot <- renderPlot({ 
        printOrPlotMatch2Teams(input, output)
        
    })
    
    # Analyze and display IPL Match table
    output$IPLMatch2TeamsPrint <- renderTable({ 
        a <- printOrPlotMatch2Teams(input, output)
        a
        #a
    })
    # Output either a table or a plot 
    output$plotOrPrintIPLMatch2teams <-  renderUI({ 
        # Check if output is a dataframe. If so, print
        if(is.data.frame(scorecard <- printOrPlotMatch2Teams(input, output))){
            tableOutput("IPLMatch2TeamsPrint")
        }
        else{ #Else plot
            plotOutput("IPLMatch2TeamsPlot")
        }
        
    })
    

    
    ################################ IPL Teams's overall performance ##############################
    # Analyze overall IPL team performance plots
    output$IPLTeamPerfOverallPlot <- renderPlot({ 
        printOrPlotTeamPerfOverall(input, output)
        
    })
    
    # Analyze and display IPL Match table
    output$IPLTeamPerfOverallPrint <- renderTable({ 
        a <- printOrPlotTeamPerfOverall(input, output)
        a
        
    })
    # Output either a table or a plot 
    output$printOrPlotIPLTeamPerfoverall <-  renderUI({ 
        # Check if output is a dataframe. If so, print
        if(is.data.frame(scorecard <- printOrPlotTeamPerfOverall(input, output))){
            tableOutput("IPLTeamPerfOverallPrint")
        }
        else{ #Else plot
            plotOutput("IPLTeamPerfOverallPlot")
        }
    })   

    
##########################################################################################
# T20 Men
    
    # Analyze and display batsmen plots
    output$batsmanPlotT20M <- renderPlot({  
      analyzeBatsmen(input$batsmanT20M,input$batsmanFuncT20M, "T20M")
      
    })
    
    
    # Analyze and display bowler plots
    output$bowlerPlotT20M <- renderPlot({  
      analyzeBowlers(input$bowlerT20M,input$bowlerFuncT20M, "T20M")
      
    })
    
    
    ######################################## T20 Men's Match  #############################################
    # Analyze and display IPL Match plot
    output$T20MMatchPlot <- renderPlot({ 
      print("t20 plot")
      printOrPlotMatch(input, output,"T20M")
      
    })
    
    # Analyze and display IPL Match table
    output$T20MMatchPrint <- renderTable({ 
      print("t20 print")
      a <- printOrPlotMatch(input, output,"T20M")
      head(a)
      a 
      
    })
    # Output either a table or a plot 
    output$plotOrPrintT20MMatch <-  renderUI({ 
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotMatch(input, output,"T20M"))){
        print("Hello&&&&&&&&&&&&&&&")
        tableOutput("T20MMatchPrint")
      }
      else{ #Else plot
        plotOutput("T20MMatchPlot")
      }
      
    })
    
    #################################### T20 Men's Matches between 2 teams ######################
    # Analyze Head to head confrontation of T20 Mens teams
    
    # Analyze and display T20 Men Matches between 2 teams plot
    output$T20MMatch2TeamsPlot <- renderPlot({ 
      print("plot")
      printOrPlotMatch2Teams(input, output,"T20M")
      
    })
    
    # Analyze and display IPL Match table
    output$T20MMatch2TeamsPrint <- renderTable({ 
      print("table")
      a <- printOrPlotMatch2Teams(input, output,"T20M")
      a
      #a
    })
    
    # Output either a table or a plot 
    output$plotOrPrintT20MMatch2teams <-  renderUI({ 
      print("Server ")
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotMatch2Teams(input, output,"T20M"))){
        tableOutput("T20MMatch2TeamsPrint")
      }
      else{ #Else plot
        plotOutput("T20MMatch2TeamsPlot")
      }
      
    })
})
