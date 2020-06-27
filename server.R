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
source("T20Wutilities.R")
source("BBLutilities.R")
source("NTButilities.R")
source("PSLutilities.R")
source("WBButilities.R")
source("ODIMutilities.R")
source("ODIWutilities.R")
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
    # Analyze and display T20 Match plot
    output$T20MMatchPlot <- renderPlot({ 
      print("t20 plot")
      printOrPlotMatch(input, output,"T20M")
      
    })
    
    # Analyze and display T20 Match table
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
    
    
    
    ################################ T20 Men's Teams's overall performance ##############################
    # Analyze overall T20 Mens team performance plots
    output$T20MTeamPerfOverallPlot <- renderPlot({ 
      printOrPlotTeamPerfOverall(input, output,"T20M")
      
    })
    
    # Analyze and display IPL Match table
    output$T20MTeamPerfOverallPrint <- renderTable({ 
      a <- printOrPlotTeamPerfOverall(input, output,"T20M")
      a
      
    })
    # Output either a table or a plot 
    output$printOrPlotT20MTeamPerfoverall <-  renderUI({ 
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotTeamPerfOverall(input, output,"T20M"))){
        tableOutput("T20MTeamPerfOverallPrint")
      }
      else{ #Else plot
        plotOutput("T20MTeamPerfOverallPlot")
      }
    })   
    
    ##########################################################################################
    # T20 Women
    
    # Analyze and display batsmen plots
    output$batsmanPlotT20W <- renderPlot({  
      analyzeBatsmen(input$batsmanT20W,input$batsmanFuncT20W, "T20W")
      
    })   
    
    
    # Analyze and display bowler plots
    output$bowlerPlotT20W <- renderPlot({  
      analyzeBowlers(input$bowlerT20W,input$bowlerFuncT20W, "T20W")
      
    })
    
    ######################################## T20 Women's Match  #############################################
    # Analyze and display T20 Match plot
    output$T20WMatchPlot <- renderPlot({ 
      print("t20 plot")
      printOrPlotMatch(input, output,"T20W")
      
    })
    
    # Analyze and display T20 Match table
    output$T20WMatchPrint <- renderTable({ 
      print("t20 print")
      a <- printOrPlotMatch(input, output,"T20W")
      head(a)
      a 
      
    })
    # Output either a table or a plot 
    output$plotOrPrintT20WMatch <-  renderUI({ 
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotMatch(input, output,"T20W"))){
        print("Hello&&&&&&&&&&&&&&&")
        tableOutput("T20WMatchPrint")
      }
      else{ #Else plot
        plotOutput("T20WMatchPlot")
      }
      
    })
    
    #################################### T20 Women's Matches between 2 teams ######################
    # Analyze Head to head confrontation of T20 Womens teams
    
    # Analyze and display T20 Women Matches between 2 teams plot
    output$T20WMatch2TeamsPlot <- renderPlot({ 
      print("Women plot")
      printOrPlotMatch2Teams(input, output,"T20W")
      
    })
    
    # Analyze and display IPL Match table
    output$T20WMatch2TeamsPrint <- renderTable({ 
      print("Women table")
      a <- printOrPlotMatch2Teams(input, output,"T20W")
      a
    })
    
    # Output either a table or a plot 
    output$plotOrPrintT20WMatch2teams <-  renderUI({ 
      print("Women's match ")
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotMatch2Teams(input, output,"T20W"))){
        tableOutput("T20WMatch2TeamsPrint")
      }
      else{ #Else plot
        plotOutput("T20WMatch2TeamsPlot")
      }
      
    })
    
    ##########################################################################################
    # Big Bash League
    
    # Analyze and display batsmen plots
    output$batsmanPlotBBL <- renderPlot({  
      analyzeBatsmen(input$batsmanBBL,input$batsmanFuncBBL, "BBL")
      
    }) 
    
    # Analyze and display bowler plots
    output$bowlerPlotBBL <- renderPlot({  
      analyzeBowlers(input$bowlerBBL,input$bowlerFuncBBL, "BBL")
      
    })
    
    ########################################  BBL T20 Match  #############################################
    # Analyze and display T20 Match plot
    output$BBLMatchPlot <- renderPlot({ 
      print("t20 plot")
      printOrPlotMatch(input, output,"BBL")
      
    })
    
    # Analyze and display T20 Match table
    output$BBLMatchPrint <- renderTable({ 
      print("t20 print")
      a <- printOrPlotMatch(input, output,"BBL")
      head(a)
      a 
      
    })
    # Output either a table or a plot 
    output$plotOrPrintBBLMatch <-  renderUI({ 
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotMatch(input, output,"BBL"))){
        print("Hello&&&&&&&&&&&&&&&")
        tableOutput("BBLMatchPrint")
      }
      else{ #Else plot
        plotOutput("BBLMatchPlot")
      }
      
    })
    
    ##########################################################################################
    # Natwest T20
    
    # Analyze and display batsmen plots
    output$batsmanPlotNTB <- renderPlot({  
      analyzeBatsmen(input$batsmanNTB,input$batsmanFuncNTB, "NTB")
    })
    
    # Analyze and display bowler plots
    output$bowlerPlotNTB <- renderPlot({  
      analyzeBowlers(input$bowlerNTB,input$bowlerFuncNTB, "NTB")
    })
    
    ########################################  NTB T20 Match  #############################################
    # Analyze and display T20 Match plot
    output$NTBMatchPlot <- renderPlot({ 
      print("t20 plot")
      printOrPlotMatch(input, output,"NTB")
      
    })
    
    # Analyze and display T20 Match table
    output$NTBMatchPrint <- renderTable({ 
      print("t20 print")
      a <- printOrPlotMatch(input, output,"NTB")
      head(a)
      a 
      
    })
    # Output either a table or a plot 
    output$plotOrPrintNTBMatch <-  renderUI({ 
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotMatch(input, output,"NTB"))){
        print("Hello&&&&&&&&&&&&&&&")
        tableOutput("NTBMatchPrint")
      }
      else{ #Else plot
        plotOutput("NTBMatchPlot")
      }
      
    })
    
    ##########################################################################################
    # PSL T20
    
    # Analyze and display batsmen plots
    output$batsmanPlotPSL <- renderPlot({  
      analyzeBatsmen(input$batsmanPSL,input$batsmanFuncPSL, "PSL")
      
    }) 
    
    # Analyze and display bowler plots
    output$bowlerPlotPSL <- renderPlot({  
      analyzeBowlers(input$bowlerPSL,input$bowlerFuncPSL, "PSL")
    })
    
    ########################################  PSL T20 Match  #############################################
    # Analyze and display T20 Match plot
    output$PSLMatchPlot <- renderPlot({ 
      print("t20 plot")
      printOrPlotMatch(input, output,"PSL")
      
    })
    
    # Analyze and display T20 Match table
    output$PSLMatchPrint <- renderTable({ 
      print("t20 print")
      a <- printOrPlotMatch(input, output,"PSL")
      head(a)
      a 
      
    })
    # Output either a table or a plot 
    output$plotOrPrintPSLMatch <-  renderUI({ 
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotMatch(input, output,"PSL"))){
        print("Hello&&&&&&&&&&&&&&&")
        tableOutput("PSLMatchPrint")
      }
      else{ #Else plot
        plotOutput("PSLMatchPlot")
      }
      
    })
    
    ##########################################################################################
    # WBBL T20
    
    # Analyze and display batsmen plots
    output$batsmanPlotWBB <- renderPlot({  
      analyzeBatsmen(input$batsmanWBB,input$batsmanFuncWBB, "WBB")
      
    })
    
    # Analyze and display bowler plots
    output$bowlerPlotWBB <- renderPlot({  
      analyzeBowlers(input$bowlerWBB,input$bowlerFuncWBB, "WBB")
    })
    
    ########################################  WBBL T20 Match  #############################################
    # Analyze and display T20 Match plot
    output$WBBMatchPlot <- renderPlot({ 
      print("t20 plot")
      printOrPlotMatch(input, output,"WBB")
      
    })
    
    # Analyze and display T20 Match table
    output$WBBMatchPrint <- renderTable({ 
      print("t20 print")
      a <- printOrPlotMatch(input, output,"WBB")
      head(a)
      a 
      
    })
    # Output either a table or a plot 
    output$plotOrPrintWBBMatch <-  renderUI({ 
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotMatch(input, output,"WBB"))){
        print("Hello&&&&&&&&&&&&&&&")
        tableOutput("WBBMatchPrint")
      }
      else{ #Else plot
        plotOutput("WBBMatchPlot")
      }
      
    })
    
    ##########################################################################################
    
    ##########################################################################################
    # ODI Men
    
    # Analyze and display batsmen plots
    output$batsmanPlotODIM <- renderPlot({  
      analyzeBatsmen(input$batsmanODIM,input$batsmanFuncODIM, "ODIM")
      
    }) 
    
    # Analyze and display bowler plots
    output$bowlerPlotODIM <- renderPlot({  
      analyzeBowlers(input$bowlerODIM,input$bowlerFuncODIM, "ODIM")
    })
    
    ########################################  ODI Men Match  #############################################
    # Analyze and display ODI Men Match plot
    output$ODIMMatchPlot <- renderPlot({ 
      print("t20 plot")
      printOrPlotMatch(input, output,"ODIM")
      
    })
    
    # Analyze and display ODI Men Match table
    output$ODIMMatchPrint <- renderTable({ 
      print("t20 print")
      a <- printOrPlotMatch(input, output,"ODIM")
      head(a)
      a 
      
    })
    # Output either a table or a plot 
    output$plotOrPrintODIMMatch <-  renderUI({ 
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotMatch(input, output,"ODIM"))){
        print("Hello&&&&&&&&&&&&&&&")
        tableOutput("ODIMMatchPrint")
      }
      else{ #Else plot
        plotOutput("ODIMMatchPlot")
      }
      
    })
    
    ##########################################################################################
    # ODI Women
    
    # Analyze and display batsmen plots
    output$batsmanPlotODIW <- renderPlot({  
      analyzeBatsmen(input$batsmanODIW,input$batsmanFuncODIW, "ODIW")
      
    }) 
    
    # Analyze and display bowler plots
    output$bowlerPlotODIW <- renderPlot({  
      analyzeBowlers(input$bowlerODIW,input$bowlerFuncODIW, "ODIW")
    })
    
    ########################################  ODI Women Match  #############################################
    # Analyze and display ODI Women Match plot
    output$ODIWMatchPlot <- renderPlot({ 
      print("t20 plot")
      printOrPlotMatch(input, output,"ODIW")
      
    })
    
    # Analyze and display ODI Women Match table
    output$ODIWMatchPrint <- renderTable({ 
      print("t20 print")
      a <- printOrPlotMatch(input, output,"ODIW")
      head(a)
      a 
      
    })
    # Output either a table or a plot 
    output$plotOrPrintODIWMatch <-  renderUI({ 
      # Check if output is a dataframe. If so, print
      if(is.data.frame(scorecard <- printOrPlotMatch(input, output,"ODIW"))){
        print("Hello&&&&&&&&&&&&&&&")
        tableOutput("ODIWMatchPrint")
      }
      else{ #Else plot
        plotOutput("ODIWMatchPlot")
      }
      
    })
    
    ##########################################################################################
    
})




