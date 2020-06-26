source("IPLutilities.R")

# Setup data for IPL
getIPLBatsmen("./ipl/iplBattingBowlingDetails")
getIPLBowlers("./ipl/iplBattingBowlingDetails")

source("T20Mutilities.R")
getT20MBatsmen("./t20/t20BattingBowlingDetails")
getT20MBowlers("./t20/t20BattingBowlingDetails")


source("T20Wutilities.R")
getT20WBatsmen("./t20/t20WomenBattingBowlingDetails")
getT20WBowlers("./t20/t20WomenBattingBowlingDetails")

source("BBLutilities.R")
getBBLBatsmen("./bbl/bblBattingBowlingDetails")
getBBLBowlers("./bbl/bblBattingBowlingDetails")

source("NTButilities.R")
getNTBBatsmen("./ntb/ntbBattingBowlingDetails")
getNTBBowlers("./ntb/ntbBattingBowlingDetails")

source("PSLutilities.R")
getPSLBatsmen("./psl/pslBattingBowlingDetails")
getPSLBowlers("./psl/pslBattingBowlingDetails")

source("WBButilities.R")
getWBBBatsmen("./wbb/wbbBattingBowlingDetails")
getWBBBowlers("./wbb/wbbBattingBowlingDetails")

source("ODIMutilities.R")
getODIMBatsmen("./odi/odiBattingBowlingDetails")
getODIMBowlers("./odi/odiBattingBowlingDetails")

source("ODIWutilities.R")
getODIWBatsmen("./odi/odiWomenBattingBowlingDetails")
getODIWBowlers("./odi/odiWomenBattingBowlingDetails")
