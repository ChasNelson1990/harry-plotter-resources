data <- read.csv(file="../data/commodityprices.csv",head=TRUE,sep=",")
colnames(data)  <- c("Year","Week","Butter","Cheese","Potatoes (maincrop)","Potatoes (earlies)")#Fix for text importing
library(reshape2)
data <- melt(data[3:6],variable.name="Commodity",value.name="Cost")
data <- data[!is.na(data$Cost),]

## Load library
library(ggplot2)

## Box Plot - Cost vs. Commodity
# Initialise plot
ggplot(data=data) +
# Plot boxes using cost and commodity
geom_boxplot(aes(x=Commodity,y=Cost))