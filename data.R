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
cat("lebthbatsm=",length(IPLBatsmen),"\n")

load("./ipl/iplBattingBowlingDetails/IPLbowlers.RData")
IPLBowlers <-iplBowlers

a <-list.files("./ipl/iplMatches/")
IPLMatches <- gsub(".RData","",a)
cat("length=",length(IPLMatches),"\n")

a1 <-list.files("./ipl/iplMatches2Teams/")
IPLMatches2Teams <- gsub(".RData","",a1)

a2 <-list.files("./ipl/iplAllMatchesAllTeams/")
IPLTeamsAll <- gsub(".RData","",a2)
