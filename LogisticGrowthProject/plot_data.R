#Script to plot the logistic growth data

growth_data <- read.csv("/cloud/project/LogisticGrowthProject/experiment2.csv")

install.packages("ggplot2")
library(ggplot2)

ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("Time (min)") +
  
  ylab("N (# cells)") +
  
  theme_bw()

ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("Time(min)") +
  
  ylab("Log10(N)") +
  
  scale_y_continuous(trans='log10')+
  
  theme_bw()

