library(shiny)
library(datasets)

shinyUI(fluidPage(
  
  ## Title and headings
  titlePanel("Demo navlist panel navigation layout in shiny"),
  h5(
    "'navlistPanel' gives ability to have tab like pages. 
It is kind of sidebar Panel but with tab like navigation through tab links on left and corresponding pages on right side. 
Helpful in cases when the tabsets at top of page gets cluttered with multiple pages.
    "
  ),
  
  ## Beginning of navlistPanel
  navlistPanel(
    widths = c(2, 10),
    "Data", 
    tabPanel("About", navbarPage("GooglyPlus : yorkr analyzes IPL with plots and tables!",
                                 # Batsman tab
                                 tabPanel("IPL batsman",
                                          h4('Analyze IPL batsman performances'),
                                          sidebarPanel(
                                            selectInput('batsmanFunc', 'Select function', IPLBatsmanFuncs),
                                            selectInput('batsman', 'Select batsman', IPLBatsmen,selectize=FALSE, size=20)
                                          ),
                                          mainPanel(
                                            plotOutput('batsmanPlot'),
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
                                            selectInput('bowlerFunc', 'Select function', IPLBowlerFuncs),
                                            selectInput('bowler', 'Select IPL bowler', IPLBowlers,selectize=FALSE, size=20)
                                            
                                            
                                          ),
                                          mainPanel(
                                            plotOutput('bowlerPlot'),
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
                                            selectInput('matchFunc', 'Select match function', IPLMatchFuncs),
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
                                            selectInput('matches2TeamFunc', 'Select function', IPLMatches2TeamsFuncs),
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
                                            selectInput('overallperfFunc', 'Select function', IPLTeamOverallPerfFunc),
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
                                 ))),
    tabPanel("Data Table",
             tableOutput("table1"),
             h3("This is the first tab or page")),
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