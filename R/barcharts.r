## Load commodities data
data <- read.csv(file="../data/commodityentries.csv",head=TRUE,sep=",")
colnames(data)  <- c("Year","Butter","Cheese","Potatoes (maincrop)","Potatoes (earlies)")#Fix for text importing
library(reshape2)
data <- melt(data,"Year",variable.name="Commodity",value.name="Number")

## Load library
library(ggplot2)

## Grouped Bar Chart
# Initialise plot with x,y and grouping (fill) defines
ggplot(data=data, aes(x=Year,y=Number,fill=Commodity)) +
# Plot bars using position_dodge to group rather than stack
geom_bar(stat="identity", position=position_dodge()) +
# Legend is added automatically
# Change colours & legend labels
scale_fill_brewer(palette = "Greens",labels=c("Spreadable","Chunkable","Mashable","Boilable")) +
# Add axis labels
xlab("Years") +
ylab("Number of Data Entries")

## Stacked Bar Chart
# Initialise plot with x,y and grouping (fill) defines
ggplot(data=data, aes(x=Year,y=Number,fill=Commodity)) +
# Plot stacked bars
geom_bar(stat="identity") +
# Change axis label font size
theme(axis.title=element_text(size=20)) +
# Add axis labels
xlab("Years") +
ylab("Number of Data Entries")

## Faceted Bar Chart
# Initialise plot with x,y and grouping (fill) defines
ggplot(data=data, aes(x=Year,y=Number,fill=Commodity)) +
# Plot bars
geom_bar(stat="identity") +
# Make faceted
facet_wrap(~Commodity) +
# Add axis labels of specific size
xlab("Years") +
ylab("Number of Data Entries") +
# Change the overall 'theme'
theme_grey()

# Horizontal Bar Chart
data <- read.csv(file="../data/commodityentries.csv",head=TRUE,sep=",")
# Initialise plot with x,y
ggplot(data=data, aes(x=Year,y=Butter)) +
# Plot bars
geom_bar(stat="identity") +
# Rotate coordinate system
coord_flip() +
# Legend is added automatically
# Add axis labels
xlab("Years") +
ylab("Number of Data Entries")