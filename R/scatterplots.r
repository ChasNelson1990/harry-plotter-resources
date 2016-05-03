data <- read.csv(file="../data/commodityprices.csv",head=TRUE,sep=",")
colnames(data)  <- c("Year","Week","Butter","Cheese","Potatoes (maincrop)","Potatoes (earlies)")#Fix for text importing
# Remove empty time points for Butter
data <- data[!is.na(data$Butter),]

## Load library
library(ggplot2)

## Scatter Plot - Butter: Week vs. Price (coloured by year)
# Initialise plot
ggplot(data=data) +
# Plot points using x and y with Year as colour
geom_point(aes(x=Week,y=Butter,color=Year)) +
# Legend is added automatically
# Set x limits
expand_limits(x = c(1,52)) +
# Add axis labels
xlab("Week Number") +
ylab("Cost of Butter, £/tonnes")

## Line Plot - Butter: Week vs. Price (one line per year)
# Initialise plot
ggplot() + 
# Plot line using x and y with Year as colour
geom_line(data=data[data$Year==2013,], aes(x=Week,y=Butter,color=Year)) +
geom_line(data=data[data$Year==2014,], aes(Week,Butter,color=Year)) +
geom_line(data=data[data$Year==2015,], aes(Week,Butter,color=Year)) +
# Specify line style for 2016
geom_line(data=data[data$Year==2016,], aes(Week,Butter,color=Year), linetype="dashed") +
# Legend is added automatically
# Set x limits
expand_limits(x = c(1,52)) +
# Add axis labels
xlab("Week Number") +
ylab("Cost of Butter, £/tonnes")

## Line Plot w/ Error Bars - Butter: Week vs. Price (one line per year)
# Note that we've used a random error here created with rand for illustration purposes, for different values at each point use a 
# Just 2013 data for this example
data13 = data[data$Year==2013,]
# Generate Random Errors
data13$se <- sample (1:100, nrow(data13), replace=TRUE)
#Initialise plot
ggplot() + 
# Plot line using x and y with Year as colour
geom_line(data=data13, aes(x=Week,y=Butter,color=Year)) +
# Add error bars
geom_errorbar(data=data13, aes(x=Week,y=Butter,ymin=Butter-se, ymax=Butter+se), width=0.5) +
# Legend is added automatically
# Set x limits
expand_limits(x = c(1,52)) +
# Add axis labels
xlab("Week Number") +
ylab("Cost of Butter, £/tonnes")
