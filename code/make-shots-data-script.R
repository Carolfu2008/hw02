# Title: hw02 GSW Shot Charts
# Description: 
# purpose of hw02 assignment:
# 1. using the packages dplyr and ggplot2 to work with data frame
# 2. visualizing shot data of NBA players.
# 3. producing so-called "shot charts" for a handful of players from the Golden State Warriors, as well as other summaries and visualizations.
# Input(s): data file "nba2017-players.csv"
# Output(s): Shot Charts
# Author(s): Huiqing Fu
# Date: 03-01-2018

# packages
library(readr)    # importing data
library(dplyr)    # data wrangling
library(ggplot2)  # graphics

## 1) File Structure (10 pts)
## 2) Data (10 pts)
####2.1) Download the data
####2.2) Data Dictionary (10 pts)
## 3) Data Preparation (20 pts)
iguodala <- read.csv("../data/andre-iguodala.csv")
draymond<- read.csv("../data/draymond-green.csv")
curry<- read.csv("../data/stephen-curry.csv")
thompson<- read.csv("../data/klay-thompson.csv",stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv",stringsAsFactors = FALSE)


shots-data.csv
## 4) Shot Charts (20 pts)
####4.1) Shot charts of each player (10 pts)
####4.2) Facetted Shot Chart (10 pts)
## 5) Summary Tables (20 pts)
####5.1) Total Shots by Player (10 pts)
####5.2) Effective Shooting Percentage (10 pts)
## 6) Shooting Distance (20 pts)
####6.1) dplyr table (10 pts)
####6.2) ggplot (10 pts)
## 7) Total number of shots by minute of occurrence (10 pts)
