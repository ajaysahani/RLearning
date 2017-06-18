
alerting <- c("ajay","scrum master","thakur","ovais","ankita")
alerting

numbers <- c(1:10)
numbers

numbers <- c(11:20)
numbers

sm <- nchar(alerting)
sm

sm==12

alerting[sm==12]


#-------built in data--------------
names(mtcars)
?mtcars
mtcars
str(mtcars)
?str
dim(mtcars)

?row.names
row.names(mtcars)<-c(1:32)
mtcars

data(mtcars)
head(mtcars,10)
#head() print 1st 6 rows
head(mtcars)
tail(mtcars,3)

mtcars$mpg



#--------------------Reading data from file-----------------
getwd()
#stateData.csv
stateInfo <- read.csv(file.choose())
View(stateInfo)
?subset
subset(stateInfo,state.region==1)
stateSubsetBracket <- stateInfo[stateInfo$state.region==1,]


#reddit data
getwd()
reddit <- read.csv("~/R/workspace/RLearning/data/reddit.csv")
View(reddit)
table(reddit$employment.status)

#---------------------ggplot2-----------------------
install.packages("ggplot2",dependencies = T)
library(ggplot2)
attach(reddit)
qplot(data = reddit, x = reddit$age.range, xlab = "age")
age.range
qplot(data = reddit, x= income.range, xlab = "income")

#setting levels of order factor solution
age.range <- ordered(age.range, levels=c("Under 18","18-24","25-34","35-44","45-54","55-64","65 or Above"))
qplot(data = reddit, x = age.range, xlab = "age")













