#load sudo facebook data
install.packages("ggplot2",dependencies = T)
library(ggplot2)

pf <- read.csv("/home/ajay/R/workspace/RLearning/data/pseudo_facebook.tsv", sep = "\t")
View(pf)
names(pf)

#Histogram of user's birthdays
attach(pf)
qplot(data = pf, x = dob_day)

#change theme of plot
install.packages('ggthemes', dependencies = TRUE)
library(ggthemes)

ggplot(aes(x = dob_day), data = pf) +
  geom_histogram(binwidth = 1) +
  scale_x_continuous(breaks = 1:31)

qplot(x = dob_day, data = pf) +
 scale_x_continuous(breaks = 1:31) +
 facet_wrap(~dob_month, ncol = 4)  
