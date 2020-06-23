source("IPLutilities.R")

# Setup data for IPL
getIPLBatsmen("./ipl/iplBattingBowlingDetails")
getIPLBowlers("./ipl/iplBattingBowlingDetails")

source("T20Mutilities.R")
getT20MBatsmen("./t20/t20BattingBowlingDetails")
getT20MBowlers("./t20/t20BattingBowlingDetails")
