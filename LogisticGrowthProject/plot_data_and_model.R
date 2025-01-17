#Script to plot data and model

growth_data <- read.csv("experiment2.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- exp(7.5907133)
  
r <- 0.029902
  
K <- 1.000e+09

#Plot Linear Model:
ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()+
  
  xlab("Time (min)")+
  
  ylab("N (# cells)")+
  
  theme_bw()

#Plot linear model on log scale
ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()+
  
  scale_y_continuous(trans='log10')+
  
  xlab("Time (min)")+
  
  ylab("Log10(N)")+
  
  theme_bw()


