library(ggplot2)
library(reshape2)
library(scales)
library(plyr)

## Heat Map Using In-built data mtcars
# Load and melt data
data <- mtcars
data <- melt(data)
# Rescale all the values to between 0 and 1
data <- ddply(data, .(variable), transform, value = rescale(value))
# Add names
data$cars <- rownames(mtcars)
# Initialise plot
ggplot(data, aes(variable,cars)) +
# Plot tiles rescaled value as colour
geom_raster(aes(fill = value, colour="white")) +
scale_fill_gradient(low = "white", high = "steelblue",labels=percent_format()) + 
xlab("Factor") +
ylab("Car Model")