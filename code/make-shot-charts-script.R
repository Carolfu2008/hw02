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

####4.1) Shot charts of each player (10 pts)
Create shot charts (with court backgrounds) for each player, and save the plots in PDF
format, with dimensions width = 6.5 and height = 5 inches, inside the folder images/:
  ¡E andre-iguodala-shot-chart.pdf
¡E draymond-green-shot-chart.pdf
¡E kevin-durant-shot-chart.pdf
¡E klay-thompson-shot-chart.pdf
¡E stephen-curry-shot-chart.pdf
```{r}

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

```
```{r}
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
```

```{r}
curry_shot_chart <- ggplot(data = curry, aes(x = x, y = y, color = shot_made_flag))+
  annotation_custom(court_image, -250,250,-50,420)+
  geom_point()+
  ylim(-50,420)+
  ggtitle("Shot Chart: Stephen Curry (2016 Season)")+
  theme_minimal()
curry_shot_chart
```
```{r}
durant_shot_chart <- ggplot(data = durant, aes(x = x, y = y, color = shot_made_flag))+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point()+
  ylim(-50,420)+
  ggtitle("Shot Chart: Kevin Durant (2016 Season)")+
  theme_minimal()
durant_shot_chart
```
```{r}
thompson_shot_chart <- ggplot(data = thompson, aes(x = x, y = y, color = shot_made_flag))+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point()+
  ylim(-50,420)+
  ggtitle("Shot Chart: Klay Thompson (2016 Season)")+
  theme_minimal()
thompson_shot_chart
```
```{r}
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
```

####4.2) Facetted Shot Chart (10 pts)
Create one graph, using facetting, to show all the shot charts in one image, similar to the one
below. Save this image in PDF format as gsw-shot-charts.pdf, inside the folder images/.
Specify image dimensions width = 8 and height = 7 inches.
```{r}
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
```
```{r}
pdf("../images/gsw-shot-charts.pdf", width = 8, height = 7)
gsw_shot_charts

dev.off()
```
