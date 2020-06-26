#########################################################################################################
#
# Title :  GooglyPlus - An interactive app to analyze IPL Players, teams and matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 25 Dec 2016
# File: ui.R
# More details: https://gigadom.wordpress.com/
#
#########################################################################################################
source("data.R")
source("definitions.R")
source("IPLutilities.R")
source("T20Mutilities.R")

shinyUI(fluidPage(
  
  ## Title and headings
  titlePanel("GooglyPlusPlus takes wing!!!"),
  h5(
    "GooglyPlusPlus
    "
  ),
  
  ## Beginning of navlistPanel
  navlistPanel(
    widths = c(2, 10),
    "Data", 
    tabPanel("IPL", navbarPage("GooglyPlusPlus - Indian Premier League (IPL)",
                                 # Batsman tab
                               tabsetPanel(id = "tabs",
                                 tabPanel("IPL batsman", value = "IPL",
                                          h4('Analyze IPL batsman performances'),
                                          sidebarPanel(
                                            selectInput('batsmanFuncIPL', 'Select function', batsmanFuncs),
                                            selectInput('batsmanIPL', 'Select batsman', IPLBatsmen,selectize=FALSE, size=20),
                                          ),
                                          mainPanel(
                                            plotOutput('batsmanPlotIPL'),
                                            column(7, offset=4,
                                                   tags$h5((tags$i("Designed and developed by Tinniam V Ganesh"))),
                                                   tags$h5((tags$i("Dec 25,2016"))),
                                                   tags$h6("Data source Cricsheet: http://cricsheet.org/")
                                            )
                                          )
                                          
                                 ),
                                 # Bowlers tab
                                 tabPanel("IPL bowlers",
                                          
                                          h4('Analyze IPL bowler performances'),
                                          
                                          sidebarPanel(
                                            selectInput('bowlerFuncIPL', 'Select function', bowlerFuncs),
                                            selectInput('bowlerIPL', 'Select IPL bowler', IPLBowlers,selectize=FALSE, size=20)
                                            
                                            
                                          ),
                                          mainPanel(
                                            plotOutput('bowlerPlotIPL'),
                                            column(7, offset=4,
                                                   tags$h5((tags$i("Designed and developed by Tinniam V Ganesh"))),
                                                   tags$h5((tags$i("Dec 25,2016"))),
                                                   tags$h6("Data source Cricsheet: http://cricsheet.org/")
                                            )
                                          )
                                          
                                 ),
                                 # Analyze IPL matches
                                 tabPanel("IPL Match",
                                          h4('Analyze an IPL match'),
                                          sidebarPanel(
                                            selectInput('matchFunc', 'Select match function', matchFuncs),
                                            selectInput('match', 'Select IPL match ', IPLMatches,selectize=FALSE, size=15),
                                            uiOutput("selectTeam"),
                                            radioButtons("plotOrTable", label = h4("Plot or table"),
                                                         choices = c("Plot" = 1, "Table" = 2), 
                                                         selected = 1,inline=T)
                                            
                                          ),
                                          mainPanel(
                                            uiOutput("plotOrPrintIPLMatch"),
                                            column(7, offset=4,
                                                   tags$h5((tags$i("Designed and developed by Tinniam V Ganesh"))),
                                                   tags$h5((tags$i("Dec 25,2016"))),
                                                   tags$h6("Data source Cricsheet: http://cricsheet.org/")
                                            )
                                          )
                                          
                                 ),
                                 # Analyze 2 Teams IPL matches
                                 tabPanel("Head to head",
                                          h4('Head-to-head between 2 IPL teams'),
                                          sidebarPanel(
                                            selectInput('matches2TeamFunc', 'Select function', matches2TeamsFuncs),
                                            selectInput('match2', 'Select matches', IPLMatches2Teams,selectize=FALSE, size=13),                                
                                            uiOutput("selectTeam2"),
                                            radioButtons("plotOrTable1", label = h4("Plot or table"),
                                                         choices = c("Plot" = 1, "Table" = 2), 
                                                         selected = 1,inline=T),
                                            radioButtons("repType", label = h4("Report Type"),
                                                         choices = c("Summary" = 1, "Detailed" = 2), 
                                                         selected = 1,inline=T)
                                            
                                          ),
                                          mainPanel(
                                            uiOutput("plotOrPrintIPLMatch2teams"),
                                            column(7, offset=4,
                                                   tags$h5((tags$i("Designed and developed by Tinniam V Ganesh"))),
                                                   tags$h5((tags$i("Dec 25,2016"))),
                                                   tags$h6("Data source Cricsheet: http://cricsheet.org/")
                                            )
                                          ) 
                                          
                                 ),
                                 # Analyze IPL Team Overall Perf
                                 tabPanel("Overall Performance",
                                          h4("Analyze IPL team's overall performance"),
                                          sidebarPanel(
                                            selectInput('overallperfFunc', 'Select function', teamOverallPerfFunc),
                                            selectInput('teamMatches', 'Select the team', IPLTeamsAll,selectize=FALSE, size=13),
                                            uiOutput("Rank"),
                                            radioButtons("plotOrTable2", label = h4("Plot or table"),
                                                         choices = c("Plot" = 1, "Table" = 2), 
                                                         selected = 1,inline=T),
                                            radioButtons("repType2", label = h4("Report Type"),
                                                         choices = c("Summary" = 1, "Detailed" = 2), 
                                                         selected = 1,inline=T)
                                          ),
                                          mainPanel(
                                            uiOutput('printOrPlotIPLTeamPerfoverall'),
                                            column(7, offset=4,
                                                   tags$h5((tags$i("Designed and developed by Tinniam V Ganesh"))),
                                                   tags$h5((tags$i("Dec 25,2016"))),
                                                   tags$h6("Data source Cricsheet: http://cricsheet.org/")
                                            )
                                          ) 
                                          
                                 ),
                                 
                                 tabPanel("About",
                                          h3("GooglyPlus - Analyzing IPL Players, teams and matches with plots and tables"),
                                          p("This Shiny app is based on my R package 'yorkr'. In this Shiny app, I use  the
                    yorkr package to analyze the performances of IPL cricketers,teams, matches."),
                                          p("The R package 'yorkr' has been authored by Tinniam V Ganesh for analyzing  performances of IPL cricketers
                    teams, individudal IPL match, head-to-head and IPL teamds"),
                                          p("This Shiny app 'GooglyPlus' has been designed and developed by  Tinniam V Ganesh, Dec 25 2016"),
                                          p("The data for this Shiny app has been taken from Cricsheet - http://http://cricsheet.org/"),
                                          p("More details about this app and for other posts, see my blog
                    http://gigadom.wordpress.com/")
                                 )))),
    
    ############################# International T20 (Men) ################################
    tabPanel("Intl. T20(men)",navbarPage("GooglyPlusPlus - Intl. T20 (men)",
                                         # Batsman tab
                                         tabPanel("Intl T20 batsman",
                                                  h4('Analyze Intl T20 batsman performances'),
                                                  sidebarPanel(
                                                    selectInput('batsmanFuncT20M', 'Select function', batsmanFuncs),
                                                    selectInput('batsmanT20M', 'Select batsman', T20MBatsmen,selectize=FALSE, size=20),
                                                  ),
                                                  mainPanel(
                                                    plotOutput('batsmanPlotT20M'),
                                                    column(7, offset=4,
                                                           tags$h5((tags$i("Designed and developed by Tinniam V Ganesh"))),
                                                           tags$h5((tags$i("Dec 25,2016"))),
                                                           tags$h6("Data source Cricsheet: http://cricsheet.org/")
                                                    )
                                                  )
                                         ),
                                         # Bowlers tab
                                         tabPanel("Intl. T20 bowlers",
                                                  
                                                  h4('Analyze Intl. T20 bowler performances'),
                                                  
                                                  sidebarPanel(
                                                    selectInput('bowlerFuncT20M', 'Select function', bowlerFuncs),
                                                    selectInput('bowlerT20M', 'Select bowler', T20MBowlers,selectize=FALSE, size=20)
                                                    
                                                    
                                                  ),
                                                  mainPanel(
                                                    plotOutput('bowlerPlotT20M'),
                                                    column(7, offset=4,
                                                           tags$h5((tags$i("Designed and developed by Tinniam V Ganesh"))),
                                                           tags$h5((tags$i("Dec 25,2016"))),
                                                           tags$h6("Data source Cricsheet: http://cricsheet.org/")
                                                    )
                                                  )

                                              ),
                                         tabPanel("Intl T20 Match",
                                                  h4('Analyze an Intl T20 match'),                                                        
                                                  sidebarPanel(
                                                    selectInput('matchFuncT20M', 'Select match function', matchFuncs),                      
                                                    selectInput('matchT20M', 'Select IPL match ', T20MMatches,selectize=FALSE, size=15),    
                                                    uiOutput("selectTeamT20M"),
                                                    radioButtons("plotOrTableT20M", label = h4("Plot or table"),                                
                                                                 choices = c("Plot" = 1, "Table" = 2),                                                   
                                                                 selected = 1,inline=T)                                                                  
                                                    
                                                  ),
                                                  mainPanel(
                                                    uiOutput("plotOrPrintT20MMatch"),                                                       
                                                    column(7, offset=4,
                                                           tags$h5((tags$i("Designed and developed by Tinniam V Ganesh"))),                        
                                                           tags$h5((tags$i("Dec 25,2016"))),                                                       
                                                           tags$h6("Data source Cricsheet: http://cricsheet.org/")                                 
                                                    )
                                                  ) 
                                            ),

                                         # Analyze 2 T20 Teams men's  matches
                                         tabPanel("Head to head",
                                                  h4('Head-to-head between 2 T20 (mens) teams'),
                                                  sidebarPanel(
                                                    selectInput('matches2TeamFuncT20M', 'Select function', matches2TeamsFuncs),
                                                    selectInput('match2T20M', 'Select matches', T20MMatches2Teams,selectize=FALSE, size=13),                                
                                                    uiOutput("selectTeam2T20M"),
                                                    radioButtons("plotOrTable1T20M", label = h4("Plot or table"),
                                                                 choices = c("Plot" = 1, "Table" = 2), 
                                                                 selected = 1,inline=T),
                                                    radioButtons("repTypeT20M", label = h4("Report Type"),
                                                                 choices = c("Summary" = 1, "Detailed" = 2), 
                                                                 selected = 1,inline=T)
                                                    
                                                  ),
                                                  mainPanel(
                                                    uiOutput("plotOrPrintT20MMatch2teams"),
                                                    column(7, offset=4,
                                                           tags$h5((tags$i("Designed and developed by Tinniam V Ganesh"))),
                                                           tags$h5((tags$i("Dec 25,2016"))),
                                                           tags$h6("Data source Cricsheet: http://cricsheet.org/")
                                                    )
                                                  ) 
                                                  
                                         ),
                                         # Analyze T20Mens Team Overall Perf
                                         tabPanel("Overall Performance",
                                                  h4("Analyze T20M team's overall performance"),
                                                  sidebarPanel(
                                                    selectInput('overallperfFuncT20M', 'Select function', teamOverallPerfFunc),
                                                    selectInput('teamMatchesT20M', 'Select the team', T20MTeamsAll,selectize=FALSE, size=13),
                                                    uiOutput("RankT20M"),
                                                    radioButtons("plotOrTable2T20M", label = h4("Plot or table"),
                                                                 choices = c("Plot" = 1, "Table" = 2), 
                                                                 selected = 1,inline=T),
                                                    radioButtons("repType2T20M", label = h4("Report Type"),
                                                                 choices = c("Summary" = 1, "Detailed" = 2), 
                                                                 selected = 1,inline=T)
                                                  ),
                                                  mainPanel(
                                                    uiOutput('printOrPlotT20MTeamPerfoverall'),
                                                    column(7, offset=4,
                                                           tags$h5((tags$i("Designed and developed by Tinniam V Ganesh"))),
                                                           tags$h5((tags$i("Dec 25,2016"))),
                                                           tags$h6("Data source Cricsheet: http://cricsheet.org/")
                                                    )
                                                  ) 
                                                  
                                         )
                                         
                                      )),
    ############################# International T20 (Women) ################################
    tabPanel("Intl. T20(women)",navbarPage("GooglyPlusPlus - Intl. T20 (women)",
                                         # Batsman tab
                                         tabPanel("Intl T20 batsman",
                                                  h4('Analyze Intl T20 batsman performances'),
                                                  sidebarPanel(
                                                    selectInput('batsmanFuncT20W', 'Select function', batsmanFuncs),
                                                    selectInput('batsmanT20W', 'Select batsman', T20WBatsmen,selectize=FALSE, size=20),
                                                  ),
                                                  mainPanel(
                                                    plotOutput('batsmanPlotT20W'),
                                                    column(7, offset=4,
                                                           tags$h5((tags$i("Designed and developed by Tinniam V Ganesh"))),
                                                           tags$h5((tags$i("Dec 25,2016"))),
                                                           tags$h6("Data source Cricsheet: http://cricsheet.org/")
                                                    )
                                                  )
                                         )
                                         
                               )),
    #############################Big Bash League T20 ################################
    tabPanel("BBL T20",navbarPage("GooglyPlusPlus - Big Bash League T20",
                                           # Batsman tab
                                           tabPanel("BBL T20 batsman",
                                                    h4('Analyze BBL T20 batsman performances'),
                                                    sidebarPanel(
                                                      selectInput('batsmanFuncBBL', 'Select function', batsmanFuncs),
                                                      selectInput('batsmanBBL', 'Select batsman', BBLBatsmen,selectize=FALSE, size=20),
                                                    ),
                                                    mainPanel(
                                                      plotOutput('batsmanPlotBBL'),
                                                      column(7, offset=4,
                                                             tags$h5((tags$i("Designed and developed by Tinniam V Ganesh"))),
                                                             tags$h5((tags$i("Dec 25,2016"))),
                                                             tags$h6("Data source Cricsheet: http://cricsheet.org/")
                                                      )
                                                    )
                                           )
                                           
                  )),
    ############################# Natwest T20 ################################
    tabPanel("NTB T20",navbarPage("GooglyPlusPlus - Natwest T20",
                                  # Batsman tab
                                  tabPanel("NTB T20 batsman",
                                           h4('Analyze NTB T20 batsman performances'),
                                           sidebarPanel(
                                             selectInput('batsmanFuncNTB', 'Select function', batsmanFuncs),
                                             selectInput('batsmanNTB', 'Select batsman', NTBBatsmen,selectize=FALSE, size=20),
                                           ),
                                           mainPanel(
                                             plotOutput('batsmanPlotNTB'),
                                             column(7, offset=4,
                                                    tags$h5((tags$i("Designed and developed by Tinniam V Ganesh"))),
                                                    tags$h5((tags$i("Dec 25,2016"))),
                                                    tags$h6("Data source Cricsheet: http://cricsheet.org/")
                                             )
                                           )
                                  )
                                  
    )),
                                       
    tabPanel("Data Summary", verbatimTextOutput("summary1"))
    ,
    "Plots",
    tabPanel(title = "Scatter Plot", h3("Can have widgets and plots")), 
    tabPanel(title = "Histogram",
             sliderInput(
               "n",
               "Breaks",
               min = 5,
               value = 15,
               max = 25
             ),
             plotOutput("plot"))
    
  )))