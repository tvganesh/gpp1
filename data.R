#########################################################################################################
#
# Title :  GooglyPlus - An interactive app to analyze IPL Players, teams and matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 25 Dec 2016
# File: data.R
# More details: https://gigadom.wordpress.com/
#
#########################################################################################################
load("./ipl/iplBattingBowlingDetails/IPLbatsmen.RData")
IPLBatsmen <-iplBatsmen
cat("lengthbatsIPL=",length(IPLBatsmen),"\n")

load("./ipl/iplBattingBowlingDetails/IPLbowlers.RData")
IPLBowlers <-iplBowlers

a <-list.files("./ipl/iplMatches/")
IPLMatches <- gsub(".RData","",a)
cat("length=",length(IPLMatches),"\n")

a1 <-list.files("./ipl/iplMatches2Teams/")
IPLMatches2Teams <- gsub(".RData","",a1)

a2 <-list.files("./ipl/iplAllMatchesAllTeams/")
IPLTeamsAll <- gsub(".RData","",a2)

# IPL Team names
IPLTeamNames <- list("Chennai Super Kings","Deccan Chargers","Delhi Daredevils",
                     "Kings XI Punjab", 'Kochi Tuskers Kerala',"Kolkata Knight Riders",
                     "Mumbai Indians", "Pune Warriors","Rajasthan Royals",
                     "Royal Challengers Bangalore","Sunrisers Hyderabad","Gujarat Lions",
                     "Rising Pune Supergiants")   

############################################
#T20 Men

load("./t20/t20BattingBowlingDetails/T20Mbatsmen.RData")
T20MBatsmen <-t20mBatsmen
cat("lengthbatsm=",length(T20MBatsmen),"\n")

load("./t20/t20BattingBowlingDetails/T20Mbowlers.RData")
T20MBowlers <-t20mBowlers

a <-list.files("./t20/t20MenMatches/")
T20MMatches <- gsub(".RData","",a)
cat("length=",length(T20MMatches),"\n")

a1 <-list.files("./t20/t20Matches2Teams/")
T20MMatches2Teams <- gsub(".RData","",a1)

a2 <-list.files("./t20/t20AllMatchesAllTeams/")
T20MTeamsAll <- gsub(".RData","",a2)

# T20 Men Team names
T20MTeamNames <- list("Australia","India","Pakistan","West Indies", 'Sri Lanka',
                     "England", "Bangladesh","Netherlands","Scotland", "Afghanistan",
                     "Zimbabwe","Ireland","New Zealand","South Africa","Canada",
                     "Bermuda","Kenya","Hong Kong","Nepal","Oman","Papua New Guinea",
                     "United Arab Emirates","Namibia","Cayman Islands","Singapore",
                     "United States of America","Bhutan","Maldives","Botswana","Nigeria",
                     "Denmark","Germany","Jersey","Norway","Qatar","Malaysia","Vanuatu",
                     "Thailand")   


############################################
#T20 Women


load("./t20/t20WomenBattingBowlingDetails/T20Wbatsmen.RData")
T20WBatsmen <-t20wBatsmen
cat("lengthWbatsm=",length(T20WBatsmen),"\n")

load("./t20/t20WomenBattingBowlingDetails/T20Wbowlers.RData")
T20WBowlers <-t20wBowlers

a <-list.files("./t20/t20WomenMatches/")
T20WMatches <- gsub(".RData","",a)
cat("length=",length(T20WMatches),"\n")

a1 <-list.files("./t20/t20WomenMatches2Teams/")
T20WMatches2Teams <- gsub(".RData","",a1)

a2 <-list.files("./t20/t20WomenAllMatchesAllTeams/")
T20WTeamsAll <- gsub(".RData","",a2)

# T20 Women Team names
T20WTeamNames <- list("Australia","India","Pakistan","West Indies", 'Sri Lanka',
                      "England", "Bangladesh","Netherlands","Scotland",
                      "Zimbabwe","Ireland","New Zealand","South Africa","Canada",
                      "Kenya","Hong Kong","Nepal","Oman","Papua New Guinea",
                      "United Arab Emirates","Namibia","Singapore",
                      "United States of America","Maldives","Botswana","Nigeria",
                      "Germany","Malaysia","Vanuatu",
                      "Thailand")   



###############################################################
## BBL
load("./bbl/bblBattingBowlingDetails/BBLbatsmen.RData")
BBLBatsmen <-bblBatsmen
cat("lengthbatsBBL=",length(BBLBatsmen),"\n")

load("./bbl/bblBattingBowlingDetails/BBLbowlers.RData")
BBLBowlers <-bblBowlers

a <-list.files("./bbl/bblMatches/")
BBLMatches <- gsub(".RData","",a)
cat("length BBL match=",length(BBLMatches),"\n")

a1 <-list.files("./bbl/bblMatches2Teams/")
BBLMatches2Teams <- gsub(".RData","",a1)

a2 <-list.files("./bbl/bblAllMatchesAllTeams/")
BBLTeamsAll <- gsub(".RData","",a2)

# BBL Team names
BBLTeamNames <- list(`Adelaide Strikers-bowlers`,`Brisbane Heat-bowlers`,`Hobart Hurricanes-bowlers`,
                     `Melbourne Renegades-bowlers`,`Melbourne Stars-bowlers`,`Perth Scorchers-bowlers`,
                     `Sydney Sixers-bowlers`,`Sydney Thunder-bowlers`)  


##############################################
#NTB
load("./ntb/ntbBattingBowlingDetails/NTBbatsmen.RData")
NTBBatsmen <-ntbBatsmen
cat("lengthbatsNTB=",length(NTBBatsmen),"\n")

load("./ntb/ntbBattingBowlingDetails/NTBbowlers.RData")
NTBBowlers <-ntbBowlers

a <-list.files("./ntb/ntbMatches/")
NTBMatches <- gsub(".RData","",a)
cat("length NTB match=",length(NTBMatches),"\n")

a1 <-list.files("./ntb/ntbMatches2Teams/")
NTBMatches2Teams <- gsub(".RData","",a1)

a2 <-list.files("./ntb/ntbAllMatchesAllTeams/")
NTBTeamsAll <- gsub(".RData","",a2)

# NTB Team names
NTBTeamNames <- list(`Adelaide Strikers-bowlers`,`Brisbane Heat-bowlers`,`Hobart Hurricanes-bowlers`,
                     `Melbourne Renegades-bowlers`,`Melbourne Stars-bowlers`,`Perth Scorchers-bowlers`,
                     `Sydney Sixers-bowlers`,`Sydney Thunder-bowlers`) 

