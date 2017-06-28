
library(ggplot2)
pf <- read.csv("/home/ajay/R/workspace/RLearning/data/pseudo_facebook.tsv",sep = "\t")
View(pf)
attach(pf)
names(pf)

#age vs frnds
qplot(x = age, y = friend_count, data = pf)
qplot(age,friend_count, data = pf)

#syntax for ggplot
ggplot(aes(x = age , y = friend_count), data = pf)+
  geom_point()
summary(pf$age)

#provide limit to x-axis
ggplot(aes(x = age , y = friend_count), data = pf)+
  geom_point()+#indicate scatter plot
  xlim(13,90)


#overplotting
ggplot(aes(x = age, y = friend_count),data = pf)+
  geom_point(alpha = 1/20)+ #1 black point = 20 points
  xlim(13,90)

#using jitter (add some noise for clear view)
ggplot(aes(x = age, y = friend_count), data = pf)+
  geom_jitter(alpha=1/20)+
  xlim(13,90)

#change scaling for Y-axis
ggplot(aes(x = age, y = friend_count), data = pf)+
  geom_point(alpha = 1/20)+
  xlim(13,90)+
  coord_trans( y = "sqrt")

ggplot(aes(x = age, y = friend_count), data = pf)+
  geom_point(alpha = 1/20, position = position_jitter(h=0))+
  xlim(13,90)+
  coord_trans( y = "sqrt")




#Alpha and Jitter
#Explore the relationship between friends initiated vs age
ggplot(aes(x = age, y = friendships_initiated), data = pf)+
  geom_point()

ggplot(aes(x =age, y =friendships_initiated), data = pf)+
  geom_point(alpha =1/10)

ggplot(aes(x = age, y = friendships_initiated),data = pf)+
  geom_point(alpha = 1/10,position = "jitter")

ggplot(aes(x = age, y = friendships_initiated), data = pf)+
  geom_point(alpha = 1/10 , position = position_jitter(h = 0))+
  coord_trans( y = "sqrt")

ggplot(aes(x = age, y = friendships_initiated), data = pf)+
  geom_point(alpha = 1/10 , position = position_jitter(h = 0))+
  coord_trans(y = "sqrt")+
  xlim(13,90)



#Conditional means
#https://github.com/tidyverse/dplyr
# http://rstudio-pubs-static.s3.amazonaws.com/11068_8bc42d6df61341b2bed45e9a9a3bf9f4.html
install.packages("tidyverse")
library(dplyr)
?dplyr

age_group <- group_by(pf,age)

pf.fc_by_age <-summarise(age_group,
          friend_count_mean = mean(friend_count),
          friend_count_median = median(friend_count),
          n = n())
head(pf.fc_by_age)

pf.fc_by_age <- arrange(pf.fc_by_age)
head(pf.fc_by_age)

# Plot mean friend count vs. age using a line graph.
ggplot(aes(age,friend_count_mean),data = pf.fc_by_age)+
  geom_point()

ggplot(aes(age, friend_count_mean), data = pf.fc_by_age)+
  geom_line()


#overlaying summarise with raw data
ggplot(aes(x = age, y = friend_count), data = pf)+
  xlim(13,90)+
  geom_point(alpha = 1/20, position = position_jitter(h =0))+
  coord_trans(y = "sqrt")

ggplot(aes(x = age, y = friend_count), data = pf)+
  xlim(13,90)+
  geom_point(alpha = 1/20,
             position = position_jitter(h = 0),
             color = "orange")+ #color graph
  coord_trans(y = "sqrt")


ggplot(aes(x = age, y = friend_count), data = pf)+
  xlim(13,90)+
  geom_point(alpha = 1/20,
             position = position_jitter(h = 0),
             color = "orange")+
  coord_trans(y = "sqrt")+
  geom_line(stat = "summary", fun.y = mean)


#10% quantille & 90% quantile
ggplot(aes(x = age, y = friend_count), data = pf)+
  xlim(13,90)+
  geom_point(alpha = 1/20,
             position = position_jitter(h = 0),
             color = "orange")+
  coord_trans(y = "sqrt")+
  geom_line(stat = "summary", fun.y = mean)+
  #10% user have friend count below this line
  geom_line(stat = "summary", fun.y = quantile,
            fun.args=list(probs=0.1) ,linetype = 2,
            color ="blue")+
  #50% user have friend count below this line
  geom_line(stat = "summary", fun.y = quantile,
            fun.args = list(probs = 0.5),
            color = "blue")+
  #90% user have friend count below this line
  geom_line(stat = "summary", fun.y = quantile,
            fun.args = list(probs=0.9) ,linetype = 2,
            color = "blue")

#zoom data by using code cartisan layer
ggplot(aes(x = age, y = friend_count), data = pf)+
  coord_cartesian(xlim = c(13,70), ylim = c(0,1000))+
  geom_point(alpha = 1/20,
             position = position_jitter(h=0),
             color = "orange")+
  geom_line(stat = "summary", fun.y =mean)+
  #10% user have friend count below this line
  geom_line(stat = "summary", fun.y = quantile,
            fun.args = list(probs = 0.1),
            linetype = 2 , color = "blue")+
  #50% user have friend count below this line
  geom_line(stat = "summary", fun.y = quantile,
            fun.args = list(probs = 0.5),
            color = "blue")+
  #90% user have friend count below this line
  geom_line(stat = "summary", fun.y = quantile,
            fun.args = list(probs = 0.9),
            linetype= 2,color = "blue")



#correlation solutions
?cor.test
#we get correlation coefficient 0.02740737. This indicate there's no
#relationship between the two variables. A good rule of thumb is that correlation 
#greater than 0.3 or less than minus 0.3 is meaningful but small. Around 0.5 is moderate
#and 0.7 or greater is pretty large
cor.test(age, friend_count, method = "pearson")

#other way
with(pf, cor.test(age,friend_count,method = "pearson"))

#correlation on subset data
with(subset(pf,age<70),cor.test(age, friend_count))#by default pearson method



#create scatter plot
# Create a scatterplot of likes_received (y)
# vs. www_likes_received (x)
ggplot(aes(x = www_likes_received, y = likes_received),data = pf)+
  geom_point()

#remove outliers 
#strong correlation
ggplot(aes(x = www_likes_received, y = likes_received), data = pf)+
  geom_point()+
  xlim(0, quantile(www_likes_received, 0.95))+
  ylim(0, quantile(likes_received, 0.95))+
  geom_smooth(method = "lm", color = "red")

cor.test(www_likes_received,likes_received)


#More caution with correlation
install.packages("alr3")
library(alr3)
data("Mitchell")
?Mitchell
names(Mitchell)
attach(Mitchell)

# Create a scatterplot of temperature (Temp)
# vs. months (Month).
ggplot(aes(x = Month, y = Temp), data = Mitchell)+
  geom_point()

#accepted correlation -0.2 to +0.2
cor.test(Month,Temp)

#making sence of data
ggplot(aes(x = Month, y = Temp), data = Mitchell)+
  geom_point()
#convert month to year bcse it is getting repeated
range(Month)
ggplot(aes(x = Month, y = Temp),data = Mitchell)+
  geom_point()+
  scale_x_continuous(breaks = seq(0,203,12))
#Now strech out graph, will see cosine function


#Understanding Age to Age Months
ggplot(aes(x = age, y = friend_count_mean), data = pf.fc_by_age)+
  geom_line()


#create an age with months variable
pf$age_with_months <- pf$age + (12 - dob_month)/12

#age with months mean
# Create a new variable, 'age_with_months', in the 'pf' data frame.






