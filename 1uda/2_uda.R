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
 facet_wrap(~dob_month, ncol = 2)  


#create histogram
qplot(x = friend_count, data = pf)
#friend count < 1000 removed outlier
qplot(x = friend_count, data = pf, xlim = c(0,1000))
#other way to do same thing
qplot(x = friend_count, data = pf)+
  scale_x_continuous(limits = c(0,1000))
#setting bin width
qplot(x = friend_count, data = pf, binwidth = 25)+
  scale_x_continuous(limits = c(0,1000))
#setting up breaks
qplot(x = friend_count, data = pf, binwidth = 25)+
  scale_x_continuous(limits = c(0,1000), breaks = seq(0,1000,50))

#who has more friend men or women
#NA user who not labeled male or female
qplot(x = friend_count, data = pf, binwidth = 25)+
  scale_x_continuous(limits = c(0,1000), breaks = seq(0,1000,50))+
  facet_wrap(~gender)

#omitting NA observation
qplot(x = friend_count, data = subset(pf, !is.na(gender)), 
      binwidth = 10)+
  scale_x_continuous(limits = c(0,1000), breaks = seq(0,1000,50))+
  facet_wrap(~gender)


#statistics by gender
table(pf$gender)
by(pf$friend_count, pf$gender, summary)

#Tenure
#monthly
qplot(x = tenure, data = pf, binwidth =30,
      color = I("black"), fill = I("#099DD9"))
#yearly
qplot(x = tenure/365, data = pf, binwidth = 1,
      color = I("black"), fill = I("#f79420"))

qplot(x = tenure/365, data = pf, binwidth = 0.25,
      color = I("black"), fill = I("#f79420"))

#user up to 7 years
qplot(x = tenure/365, data = pf, binwidth = 0.25,
      color = I("black"), fill = I("#f79420"))+
  scale_x_continuous(breaks = seq(1,7,1), limits = c(0,7))

#Labeling plots
qplot(x = tenure/365, data = pf, binwidth = 0.25,
      xlab = "Numbers of Years using Facebook",
      ylab = "Numbers of Users in Sample",
      color = I("black"), fill = I("#f79420"))+
  scale_x_continuous(breaks = seq(1,7,1), limits = c(0,7))


#User's age
qplot(x = age, data = pf,
      color = I("black"), fill = I("#f79420"))

qplot(x = age, data = pf, binwidth=1,
      color = I("black"), fill = I("#f79420"))

qplot(x = age, data = pf, binwidth=1,
      fill = I("#f79420"))+
  scale_x_continuous(breaks = seq(0,113,5))

summary(pf$age)


#Transforming data set
qplot(x = friend_count, data = pf)
summary(pf$friend_count)
summary(log10(pf$friend_count))
#to avoid negative add +1 (calclus)
summary(log10(pf$friend_count + 1))


#To create multiple plot
install.packages("gridExtra")
library(gridExtra)

p1 <- qplot(x = friend_count, data = pf)
p2 <- qplot(x = log10(pf$friend_count + 1), data = pf)
p3 <- qplot(x = sqrt(pf$friend_count + 1), data = pf)

grid.arrange(p1, p2, p3, ncol = 1)
?grid.arrange


#Transforming data alternate solutions
##use scales
p1 <- ggplot(aes(x = pf$friend_count), data = pf) + geom_histogram()
p2 <- p1 + scale_x_log10()
p3 <- p1 + scale_x_sqrt()

grid.arrange(p1,p2,p3, ncol=1)

## adding scaling layer
logScale <- qplot(x = log10(friend_count), data = pf)
countScale <- ggplot(aes(x = friend_count), data = pf)+
  geom_histogram()+
  scale_x_log10()
grid.arrange(logScale,countScale,ncol=2)

qplot(x = pf$friend_count, data = pf)+
  scale_x_log10()


#frequency polygons (before we had histograms) 
qplot(x = friend_count, data = subset(pf , !is.na(gender)),
      binwidth=10)+
  scale_x_continuous(lim = c(0,1000), breaks = seq(0,1000,50))

qplot(x = friend_count, data = subset(pf, !is.na(gender)),
    binwidh=10)+
  scale_x_continuous(limits = c(0,1000), breaks = seq(0,1000,50))+
  facet_wrap(~gender)

qplot(x = friend_count, data = subset(pf, !is.na(gender)),
      binwidth= 10, geom = "freqpoly", color=gender)+
  scale_x_continuous(limits = c(0,1000), breaks = seq(0,1000,50))

#who has more no of friends male/female
qplot(x = friend_count, data = subset(pf, !is.na(gender)),
      xlab = "Friend Count",
      ylab = "Proportion of users with that friend count",
      binwidth = 10, geom = "freqpoly", color=gender)+
  scale_x_continuous(lim =c(0,1000), breaks = seq(0,1000,50))

#find who do more likes male/female (frequency polygon solution)
names(pf)
qplot(x = www_likes, data = subset(pf, !is.na(gender)),
      geom = "freqpoly", color= gender)+
  scale_x_continuous()+
  scale_x_log10()

#likes on the web solution
by(www_likes, gender, sum)




