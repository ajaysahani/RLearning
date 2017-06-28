#load lib
library(ggplot2)
data("diamonds")

summary(diamonds)
attach(diamonds)
View(diamonds)
names(diamonds)

# Create a histogram of the price of
# all the diamonds in the diamond data set.
qplot(x = price, data = diamonds)

qplot(x = price, data = diamonds, 
      binwidth=30, xlim = c(0,1000))

summary(price > 500)
summary(price < 250)
summary(price > 15000)

# Break out the histogram of diamond prices by cut.
# You should have five histograms in separate
# panels on your resulting plot.
qplot(x = price,data = diamonds)+
  facet_wrap(~cut, ncol = 2)

#which cut has highest price diamond
table(cut)
by(price,cut,summary)


?facet_wrap

qplot(x = price, data = diamonds)+
  facet_wrap(~cut, ncol = 2, scales = "free_y")


#Create a histogram of price per carat
# and facet it by cut.Adjust the bin width and transform the scale
# of the x-axis using log10.
qplot(x = price, data = diamonds)+
  facet_wrap(~cut, ncol = 2, scales = "free_y")+
  scale_x_continuous()+scale_x_log10()

# Investigate the price of diamonds using box plots,
# numerical summaries, and one of the following categorical
# variables: cut, clarity, or color.
qplot(x = cut, y = price, data = diamonds, geom = 'boxplot') + 
  coord_cartesian(ylim = c(0, 7000))

#Interquartile Range - IQR
IQR(subset(diamonds, price<1000)$price)



#Facebook friends data
bday <- read.csv("/home/ajay/R/workspace/RLearning/data/birthdaysExample.csv", sep = "\t")
View(bday)
names(bday)
bday$dtstart <- as.Date(bday$dates,"%dd/%mm/%Yy")





