# Complete all of the items below
# Use comments where you're having trouble or questions

### 1. Read your data set into R

library(readxl) 

FantasyFootball2014 <- read_excel("C:/Users/Jordan/Desktop/R Studio Crash Course/Fantasy Football 2014.xlsx", skip = 2)
FantasyFootball2015 <- read_excel("C:/Users/Jordan/Desktop/R Studio Crash Course/Fantasy Football 2015.xlsx", skip = 2)

FantasyFootball2014_Copy <- read_excel("../Fantasy Football 2014.xlsx")
FantasyFootball2015_Copy <- read_excel("../Fantasy Football 2015.xlsx")

"Put quotation mark press TAB then shift to go forward"
"Put quotation mark press TAB then ../ to go backward"

"View(FantasyFootball2014)"
"View(FantasyFootball2015)"


### 2. Peek at the top few rows

head(FantasyFootball2014)
head(FantasyFootball2015)
"ctrl + enter auto runs the line"


### 3. Peek at the top few rows for only a few columns

tail(FantasyFootball2014)
tail(FantasyFootball2015)


### 4. How many rows does your data have?

nrow(FantasyFootball2014)
nrow(FantasyFootball2015)


### 5. Get a summary for every column

summary(FantasyFootball2014)
summary(FantasyFootball2015)


### 6. Get a summary for one column

summary(FantasyFootball2014$PPG)
summary(FantasyFootball2015$PPG)


### 7. Are any of the columns giving you unexpected values?

"The columns looked good overall, the only unexpected values could be the position and team columns. These columns should be considered factors instead of character."


### 8. Select a few key columns, make a vector of the column names

WideRecievers2014 <- FantasyFootball2014$Player[FantasyFootball2014$Pos == "WR"]
RecievingTargets2014 <- FantasyFootball2014$Tgt[FantasyFootball2014$Pos == "WR"]
Receptions2014 <- FantasyFootball2014$Rec[FantasyFootball2014$Pos == "WR"]
RecievingYards2014 <- FantasyFootball2014$Yds__1[FantasyFootball2014$Pos == "WR"]
RecievingTouchdowns2014 <- FantasyFootball2014$TD__1[FantasyFootball2014$Pos == "WR"]
RecievingFirstDowns2014 <- FantasyFootball2014$`1st__1`[FantasyFootball2014$Pos == "WR"]

FantasyPoints2014 <- FantasyFootball2014$PPG[FantasyFootball2014$Pos == "WR"]
FantasyPoints2015 <- FantasyFootball2015$PPG[FantasyFootball2014$Pos == "WR"]



### 9. Create a new data.frame with just that subset of columns

WideRecieverDataFrame <- data.frame(WideRecievers2014,RecievingTargets2014,Receptions2014,RecievingYards2014,RecievingTouchdowns2014,RecievingFirstDowns2014,FantasyPoints2014,FantasyPoints2015)
View(WideRecieverDataFrame)



### 10. Create a new data.frame that is just the first 10 rows
#     and the last 10 rows of the data from the previous step

WideRecieverDataFrame[1:10,]
WideRecieverDataFrame[51:61,]



### 11. Create a new data.frame that is a random sample of half of the rows.
# HINT: ?sample

?sample()
WideRecieverDataFrame_RandomSample <- WideRecieverDataFrame[sample(nrow(WideRecieverDataFrame), 30), ]
View(WideRecieverDataFrame_RandomSample)
"Please go over this one in class, looked up on Google but don't really understand what's going on..."


### 12. Find a comparison in your data that is interesting to make
#     (comparing two sets of numbers)
#     - run a t.test for that comparison
#     - decide whether you need a non-default test
#       (e.g., Student's, paired)
#     - run the t.test with BOTH the formula and "vector"
#       formats, if possible
#     - if one is NOT possible, say why you can't do it

summary(WideRecieverDataFrame$RecievingFirstDowns2014)

t.test(WideRecieverDataFrame$RecievingTouchdowns2014[WideRecieverDataFrame$RecievingFirstDowns2014 > 42],WideRecieverDataFrame$RecievingTouchdowns2014[WideRecieverDataFrame$RecievingFirstDowns2014 < 42], paired = FALSE)
"There is a significant difference between recieving touchdowns for recievers with over 42 first downs and recievers with less than 42 first downs. More touchdown's with more Recieving First Downs."


summary(WideRecieverDataFrame$RecievingTargets2014)

t.test(WideRecieverDataFrame$RecievingTouchdowns2014[WideRecieverDataFrame$RecievingTargets2014 > 108],WideRecieverDataFrame$RecievingTouchdowns2014[WideRecieverDataFrame$RecievingTargets2014 < 108], paired = FALSE)
"There is a significant difference between recieving touchdowns for recievers with over 108 targets and recievers with less than 108 targets. More touchdown's with more Recieving targets."

-------------
WR_Top50_FirstDowns_Touchdowns <- WideRecieverDataFrame$RecievingTouchdowns2014[WideRecieverDataFrame$RecievingFirstDowns2014 > 42]
WR_Bot50_FirstDowns_Touchdowns <- WideRecieverDataFrame$RecievingTouchdowns2014[WideRecieverDataFrame$RecievingFirstDowns2014 < 42]
  
ttest1 <- t.test(WR_Top50_FirstDowns_Touchdowns,WR_Bot50_FirstDowns_Touchdowns, paired = FALSE)
ttest1

WR_Top50_Targets_Touchdowns <- WideRecieverDataFrame$RecievingTouchdowns2014[WideRecieverDataFrame$RecievingTargets2014 > 108]
WR_Bot50_Targets_Touchdowns <- WideRecieverDataFrame$RecievingTouchdowns2014[WideRecieverDataFrame$RecievingTargets2014 < 108]

ttest2 <- t.test(WR_Top50_Targets_Touchdowns,WR_Bot50_Targets_Touchdowns, paired = FALSE)
ttest2



### 13. Repeat #12 for TWO more comparisons
#     - ALTERNATIVELY, if correlations are more interesting,
#       do those instead of t-tests (and try both Spearman and
#       Pearson correlations)
#     - Tip: it's okay if the comparisons are kind of nonsensical, this is 
#       just a programming exercise

Correlation_Target14_Fantasy15 <- cor(WideRecieverDataFrame$RecievingTargets2014,WideRecieverDataFrame$FantasyPoints2015)
Correlation_Target14_Fantasy15
cor.test(WideRecieverDataFrame$RecievingTargets2014,WideRecieverDataFrame$FantasyPoints2015)
"Correlation between past year # targets and upcoming year Fantasy Points is significant and moderately correlated"

Correlation_Reception14_Fantasy15 <- cor(WideRecieverDataFrame$Receptions2014,WideRecieverDataFrame$FantasyPoints2015)
Correlation_Reception14_Fantasy15
cor.test(WideRecieverDataFrame$Receptions2014,WideRecieverDataFrame$FantasyPoints2015)
"Correlation between past year # receptions and upcoming year Fantasy Points is significant and moderately correlated. This is stronger than correltaion with targets and points."

### 14. Save all results from #12 and #13 in an .RData file

save(ttest1, ttest2, file = "Question12.RData")
save(Correlation_Target14_Fantasy15, Correlation_Reception14_Fantasy15, file = "Question13.RData")


### 15. Email me your version of this script, PLUS the .RData
#     file from #14
#     - ALTERNATIVELY, push your version of this script and your .RData results
#       to a repo on GitHub, and send me the link


