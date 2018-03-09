---
title: "data_dictionary_hw02"
author: "Huiqing Fu"
date: "3/1/2018"
output: html_document
---

##variable names
From hw02. NBA player data.  


|var_name|	var_desc|	var_type|
|-------------|-----------------------------|----------|
|player|	 name of the player          | character|
|team_name|	 team of the player          | character|
|game_date| data of a certain game|factor|
|season| season names|integer|
|period| An NBA game is divided in 4 periods of 12 mins each. For example, a value for period = 1 refers to the first period (the first 12 mins of the game).|integer|
|minutes_remaining|  minutes_remaining and seconds_remaining have to do with the amount of time in minutes and seconds, respectively, that remained to be played in a given period.|integer|
|seconds_remaining| how many minutes are remaining.|integer|
|shot_made_flag|  shot_made_flag indicates whether a shot was made (y) or missed (n).|character|
|action_type| action_type has to do with the basketball moves used by players, either to pass by defenders to gain access to the basket, or to get a clean pass to a teammate to score a two pointer or three pointer.|factor|
|shot_type| shot_type indicates whether a shot is a 2-point field goal, or a 3-point field goal.|factor|
|shot_distance|distance to the basket (measured in feet).|NA|
|opponent| data of a certain game|integer|
|x| x refer to the court x coordinate (measured in inches) where a shot occurred .|integer|
|y| y refer to the court y coordinate (measured in inches) where a shot occurred .|integer|
|minute|value of minutes. minutes=period*12-minutes_remaining|double|

ref:
https://cran.r-project.org/web/packages/dataMeta/vignettes/dataMeta_Vignette.html


