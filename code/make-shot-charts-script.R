# Title: hw02 GSW Shot Charts
# Description: Shot chart for NBA player
# 1. make shot chart for 5 NBA players
# 2. create facet chart for player
# 3. export charts.
# Input(s): data file "andre-iguodala.csv","draymond-green.csv", "kevin-durant.csv", "klay-thompson.csv", "stephen-curry.csv"
# Output(s):  "andre-iguodala-shot-chart.pdf","draymond-green-shot-chart.pdf","gsw-shot-charts.pdf","kevin-durant-shot-chart.pdf","klay-thompson-shot-chart.pdf","stephen-curry-shot-chart.pdf"
# Author(s): Huiqing Fu
# Date: 03-01-2018

# packages
library(readr)    # importing data
library(dplyr)    # data wrangling
library(ggplot2)  # graphics

## 4) Shot Charts (20 pts)
####4.1) Shot charts of each player (10 pts)

  # scatterplot
  thompson_scatterplot <- ggplot(data = thompson) +
    geom_point(aes(x = x, y = y, color = shot_made_flag))
  thompson_scatterplot


  #The JPG file with this image is available in the course github repository, inside the folder images/. You need to import the file nba-court.jpg to the images/ folder of your HW directory.
  # cd ../images
  #curl -O https://raw.githubusercontent.com/ucb-stat133/stat133-spring-2018/master/data/nba-court.jpg

  # court image (to be used as background of plot)
  court_file <- "../images/nba-court.jpg"
  # create raste object

  court_image <- rasterGrob(
    readJPEG(court_file),
    width = unit(1, "npc"),
    height = unit(1, "npc"))

  # shot chart with court background
  thompson_shot_chart <- ggplot(data = thompson) +
    annotation_custom(court_image, -250, 250, -50, 420) +
    geom_point(aes(x = x, y = y, color = shot_made_flag)) +
    ylim(-50, 420) +
    ggtitle('Shot Chart: Klay Thompson (2016 season)') +
    theme_minimal()
  thompson_shot_chart

  ####4.1) Shot charts of each player (10 pts)

 # ¡E stephen-curry-shot-chart.pdf

  #```{r iguodala_shot_chart}

  #court_file <- "../images/nba-court.jpg"
  court_image <- rasterGrob(readJPEG("../images/nba-court.jpg"),
                            width = unit(1,"npc"),
                            height = unit(1,"npc")

  )
  iguodala_shot_chart <- ggplot(data = iguodala, aes(x = x, y =y))+
    annotation_custom(court_image, -250,250, -50, 420)+
    geom_point(aes(color=shot_made_flag))+
    ylim(-50,420)+
    ggtitle('Shot Chart: Andre Iguodala (2016 Season)')+
    theme_minimal()
  iguodala_shot_chart


 # ```{r green_shot_chart}
  court_file <- "../images/nba-court.jpg"
  court_image <- rasterGrob(
    readJPEG(court_file),
    width = unit(1, "npc"),
    height = unit(1, "npc"))
  green_shot_chart <- ggplot(data = green, aes(x = x, y = y, color = shot_made_flag))+
    annotation_custom(court_image,  -250, 250, -50,420)+
    ylim(-50,420)+
    geom_point()+
    ggtitle('Shot Chart: Draymond Green (2016 Season)')+
    theme_minimal()
  green_shot_chart


  #```{r curry_shot_chart}
  curry_shot_chart <- ggplot(data = curry, aes(x = x, y = y, color = shot_made_flag))+
    annotation_custom(court_image, -250,250,-50,420)+
    geom_point()+
    ylim(-50,420)+
    ggtitle("Shot Chart: Stephen Curry (2016 Season)")+
    theme_minimal()
  curry_shot_chart

 # ```{r durant_shot_chart}
  durant_shot_chart <- ggplot(data = durant, aes(x = x, y = y, color = shot_made_flag))+
    annotation_custom(court_image, -250, 250, -50, 420)+
    geom_point()+
    ylim(-50,420)+
    ggtitle("Shot Chart: Kevin Durant (2016 Season)")+
    theme_minimal()
  durant_shot_chart

 # ```{r thompson_shot_chart}
  thompson_shot_chart <- ggplot(data = thompson, aes(x = x, y = y, color = shot_made_flag))+
    annotation_custom(court_image, -250, 250, -50, 420)+
    geom_point()+
    ylim(-50,420)+
    ggtitle("Shot Chart: Klay Thompson (2016 Season)")+
    theme_minimal()
  thompson_shot_chart

 # ```{r export}
  pdf(file = "../images/andre-iguodala-shot-chart.pdf", width = 7, height = 5)
  iguodala_shot_chart
  dev.off()

  pdf(file = "../images/draymond-green-shot-chart.pdf", width = 7, height = 5)
  green_shot_chart
  dev.off()

  pdf(file = "../images/kevin-durant-shot-chart.pdf", width = 7, height = 5)
  durant_shot_chart
  dev.off()

  pdf(file = "../images/klay-thompson-shot-chart.pdf", width = 7, height = 5)
  thompson_shot_chart
  dev.off()

  pdf(file = "../images/stephen-curry-shot-chart.pdf", width = 7, height = 5)
  curry_shot_chart
  dev.off()


  ####4.2) Facetted Shot Chart (10 pts)
  #Create one graph, using facetting, to show all the shot charts in one image, similar to the one
 # below. Save this image in PDF format as gsw-shot-charts.pdf, inside the folder images/.
  #Specify image dimensions width = 8 and height = 7 inches.

  gsw_shot_charts<- ggplot(data = dat, aes(x = x, y =y, color = shot_made_flag))+
    annotation_custom(court_image, -250, 250, -50, 420)+
    geom_point(size = 0.7)+
    ylim(-50, 420)+
    facet_wrap(~player)+
    ggtitle("Shot Charts: GSW (2016 season)")+
    theme_minimal()+
    theme(legend.position="top")+
    theme(legend.title = element_blank())+
    #theme(legend.position = c(0.8, 0.3))+
    theme(legend.text = element_text(size=8))
  gsw_shot_charts


  pdf("../images/gsw-shot-charts.pdf", width = 8, height = 7)
  gsw_shot_charts

  dev.off()

