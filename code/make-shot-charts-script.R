## title: make-shot-charts
## description:
## inputs: 
## outputs:

library(ggplot2)
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)

curry$shot_made_flag[curry$shot_made_flag=="n"]<-"shot_no"
curry$shot_made_flag[curry$shot_made_flag=="y"]<-"shot_yes"

thompson$shot_made_flag[thompson$shot_made_flag=="n"]<-"shot_no"
thompson$shot_made_flag[thompson$shot_made_flag=="y"]<-"shot_yes"

durant$shot_made_flag[durant$shot_made_flag=="n"]<-"shot_no"
durant$shot_made_flag[durant$shot_made_flag=="y"]<-"shot_yes"

iguodala$shot_made_flag[iguodala$shot_made_flag=="n"]<-"shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag=="y"]<-"shot_yes"

green$shot_made_flag[green$shot_made_flag=="n"]<-"shot_no"
green$shot_made_flag[green$shot_made_flag=="y"]<-"shot_yes"

#court image( to be used as background of plot)
court_file<- "../images/nba-court.jpg"

#create raste object
court_image<- rasterGrob(
  readJPEG(court_file),
  width = unit(1,"npc"),
  height = unit(1,"npc")
)


#shot chart with court background of each player

setwd("~/Desktop/workout01/images")

pdf("klay-thompson-shot-chart.pdf", width=6.5, height=5)
ggplot(data=thompson)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x=x,y=y,color= shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Chart: Klay Thompson (2016 season)')+
  theme_minimal()
dev.off()

pdf("stephen-curry-shot-chart.pdf", width=6.5, height=5)
ggplot(data=curry)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x=x,y=y,color= shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Chart: Stephen Curry (2016 season)')+
  theme_minimal()
dev.off()

pdf("kevin-durant-shot-chart.pdf", width=6.5, height=5)
durant_shot_chart<-ggplot(data=durant)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x=x,y=y,color= shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Chart: Kevin Durant (2016 season)')+
  theme_minimal()
dev.off()

pdf("draymond-green-shot-chart.pdf", width=6.5, height=5)
ggplot(data=green)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x=x,y=y,color= shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Chart: Draymond Green (2016 season)')+
  theme_minimal()
dev.off()

pdf("andre-iguodala-shot-chart.pdf", width=6.5, height=5)
ggplot(data=iguodala)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x=x,y=y,color= shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Chart: Andre Iguodala (2016 season)')+
  theme_minimal()
dev.off()

#facetted shot chart
pdf("gsw-shot-charts.pdf", width=8, height=7)
shots_data <- read.csv("../data/shots-data.csv", stringsAsFactors = FALSE)
sdfig<-ggplot(data=shots_data)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x=x,y=y,color= shot_made_flag),size=0.5)+
  ylim(-50,420)+
  ggtitle('Shot Chart: GSW (2016 season)')+
  theme_minimal()
sdfig+facet_wrap(.~ name,ncol=3)
dev.off()


shots_data <- read.csv("../data/shots-data.csv", stringsAsFactors = FALSE)

ggsave("gsw-shot-charts.png", width=8, height=7)
sdfig<-ggplot(data=shots_data)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x=x,y=y,color= shot_made_flag),size=0.5)+
  ylim(-50,420)+
  ggtitle('Shot Chart: GSW (2016 season)')+
  theme_minimal()
sdfig+facet_wrap(.~ name,ncol=3)
dev.off()

