# Day 2 lecture

MY COPY - MY COPY - MY COPY

# Review
# - pulling down changes from the class repo
# - setting up your own repo
# - other questions?

# Topics:
# - calculator and simple interactive use in the console
# - syntax/formatting basics
# - interface: scripts
# - workbench analogy
# - object basics
# - functions as "tools"
# - function structure
# - help
# - packages
# - environments
# - saving environments and objects
# - naming objects
# - reading data from files

####################################################################

# Console
# - most "bare bones" interface with R
# - type commands at the command line, hit Enter after each command
# - code run and evaluated every time you hit Enter
# - can (usually) use up/down arrows to scroll through previous commands
^ = power
remainder = "%%"
Use console as a test board, just trying things out

# Basic calculator examples (type along!)


# Some syntax basics
whitespace "mostly" doesnt matter
ctrl shift c - auto comment
# - no "line end" character
# - "plus" sign instead of ">" prompt when a line is "incomplete"
#    can hit Esc (or equivalent) to bail out

# Scripts
End with .R
written *entirely* in R
this document is a script!
# - the "comment" symbol is #
#   anything to the right of a # symbol is ignored when running code
#   (exception: if the # is part of a string, as indicated by quotes,
#   it's treated as part of that string and not as a comment character)

you can run entire scripts using `source()` function
RUNS ENTIRE DATASET

#############################
# Workbench analogy for R use

Think of R as a workbench, workspace. Not a program for opening and reading files. Its about pulling data out of a file and putting it into your workbench.


############################## Workbench
# Objects: creating and naming

ExampleObject <- 10
ExampleObject

ExampleObjectTwo <- 20
ExampleObjectTwo

# assignment: creating something in your workspace


# checking the workspace contents
objects()
ls()

# removing things from the workspace
rm()
rm("ExampleObject") #Now no object
objects() #nothing

rm(list - objects()) #remove everything from the workspace

mean(ExampleObject, ExampleObjectTwo) 


# object naming conventions
# cannot start with a number
 
1Example <- 1 #Does not Work
Example1 <- 1 #This does work

Example*1 <- 1 #Does not Work (No) Meaningful Symbols


# Tab Completion
Press tab and will automatically fill out for you
ExampleObjectTwo "Start writing Exam, scroll down then hit tab"


# some different "style" options
camelCase <- 10
dot.delimited <- 10
underscore_delimited <- 10

"Want to name things so you can easily reference things and understand from before"

# other style examples:
# https://google.github.io/styleguide/Rguide.xml
# http://adv-r.had.co.nz/Style.html



# case matters
i.e. Capitals Matter!!!

######################

Save Workspace image
- When R tells you to Quit R session & Save Workplace Image then it saves the workspace (global environment)
- Bad habit to save, you want it to be easily reproducible to others.

######################
# Structure of objects

"Simple structure: vectors"
- 1 DIMENSIONAL THING - 
  
# c()
myVector <- c(1,2,3,4,5)
myVector
# seq() for sequences
myVector1 <- seq(1:5)
myVector1
# x:y as a shortcut for seq(from = x, to = y, by = 1)
myVector2 <- seq(from = 1, to = 5, by = 1)
myVector2


"[] for subsetting"
myVector[4] ---- This draws the 4th item in the myVector Vector

myVectorWeird <- c(2,45,21,4000,82)
myVectorWeird[c(2,4)]
       # this draws both the second and fourth item from the myVectorWeird Vector




# syntax note: [square brackets] are used ONLY for "extraction"/subsetting
#              (parentheses) are used in math, and in functions (more below)


# vectors:
- all a single data type
- always one-dimensional



############
# - multi-dimentional things are other types of objects
#   - data frames
#   - lists
#   - matrices
#   - arrays
############


#############
Data frames

two dimensional
columns act as vectors (all same data type)

# - ideal standard format for (most) data

***columns = variables, rows = cases***
  
?sleep

SleepDataFrame <- sleep

# [ , ]
[Rows, Columns]

SleepDataFrame[2,2] #Second Item in Column 2
SleepDataFrame[1:5, 1:2] #1st-5th Items in Columns 1 & 2
SleepDataFrame[1:4,c(1,3)] #1st-4th Items in Columns 1 & 3

View(SleepDataFrame)

# names
# $

Good habit to just name columns
SleepDataFrame[1:5, "extra"] --- #Items 1-5 in Column Extra

  
#How to order things
my.order <- c(2,1,3)
my.order

SleepDataFrame[1:5, 1:3] #This gives item 1-5 in Columns 1, 2, 3
SleepDataFrame[1:5, my.order] #This gives item 1-5 in Columns 2, 1, 3
  
  *Order is a shortcut, can make it easy to identify datasets for certain columns*
  
SleepDataFrame$extra[4] # this gives the 4th item in the Extra Column

# Some handy functions for inspecting data frames
# head(), tail()
head(SleepDataFrame)
tail(SleepDataFrame)
head(SleepDataFrame, 3) #First 3 Rows
tail(SleepDataFrame, 2) #Last 2 Rows

# nrow(), ncol()
nrow()
ncol()


#colnames
colnames()  # Will just give you the names

# summary()
summary(SleepDataFrame)
       - If R gives you all the data (see: extra) then it thinks these values are meaningful
       - If R gives you just factors (see: Group) then it thinks these are groups
       - If R gives you just number (see: ID) then it thinks these are just names

###########
# Functions
# - everything in R is an object!
# - some objects function as "tools" -- they *do* stuff
# - these are "functions"
# - functions are still objects, too!

# syntax: FUNCTIONNAME(arg1, arg2, arg3...)

# functions return a single value, but may have other "side effects"
# the returned value may be complex, but it is still a single *object*

# example: t.test()
# with made-up vectors


################
# Quick practice

# using [ ] and <-, pull out some numbers from the sleep data, and compare with t.test



###################
# More on arguments
# - names
# - order
# - optional vs. required

# getting help()

# finding help
# Google
# "fuzzy matching"

# sometimes hints from tab-completion in RStudio

# can be sloppy with argument names

# return to t-test (options)

rm("summary")
summary(sleep)


########################################
# PRACTICE TIME!
# Complete items 1-3 in day02_practice.R
########################################

##########
# Packages

library(MASS)
install.packages("dplyr")
library(dplyr)
install.packages(c("ggplot2", "tidyr"))
library(ggplot2)
install.packages("tidyverse") # https://www.tidyverse.org/

# update.packages()

##############
# Environments

# workspaces

# naming conflicts

# MASS::select(x)
# select(x)

# saving workspaces & objects

########################################
# PRACTICE TIME!
# Complete items 4-7 in day02_practice.R
########################################


#########################
# Reading data from files

# read.table() family
?read.table
# for SPSS
# old package: `foreign`
# new package: `haven`

# for Excel: `readxl`
# install.packages("readxl")
# library(readxl)

# Others?

####################################
# PRACTICE: Try to read in your data
####################################