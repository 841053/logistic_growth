#Question 3: Graphs comparing exponential and logistic growth curves:
#Paramaters:
N0<-exp(7.5907133)
r<-0.029902
K<-1.000e+09

#Logistic growth model:
logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

#Exponential growth model:
exponential_growth<-function(t){
  N<- (N0*exp(r*t))
  return(N)
}


# Plot combined models
ggplot(growth_data, aes(t,N))+
  geom_function(fun=logistic_fun, 
                aes(colour="Logistic"))+
  geom_function(fun=exponential_growth, 
                aes(colour="Exponential"))+
  scale_y_continuous(limits = c(7.5, 1e+15))+
  scale_x_continuous(limits = c(0.1, 1000))+
  scale_colour_manual(values = c("Logistic"="blue", "Exponential"="red"))+
  xlab("Time (min)")+
  ylab("N (# cells)")+
  ggtitle("Comparison of Logistic and Exponential Growth Models")+
  theme_bw()+
  theme(plot.title = element_text(size = 10))

# Plot log scale combined models
ggplot(growth_data, aes(t,N))+
  geom_function(fun=logistic_fun, 
                aes(colour="Logistic"))+
  geom_function(fun=exponential_growth, 
                aes(colour="Exponential"))+
  scale_y_continuous(trans='log10', limits = c(7.5, 1e+15))+
  scale_x_continuous(limits = c(0.1, 1000))+
  scale_colour_manual(values = c("Logistic"="blue", "Exponential"="red"))+
  xlab("Time (min)")+
  ylab("Log10(N)")+
  ggtitle("Comparison of Logistic and Exponential Growth Models (log scale)")+
  theme_bw()+
  theme(plot.title = element_text(size = 10))

sink(file = "package-versions.txt")
sessionInfo()
sink()

