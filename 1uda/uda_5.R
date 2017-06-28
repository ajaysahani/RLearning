#Explore Many Variables
library(ggplot2)
pf <- read.csv("/home/ajay/R/workspace/RLearning/data/pseudo_facebook.tsv",sep = "\t")
View(pf)
attach(pf)
names(pf)

#male female friend count with age
#third qualitative variables
ggplot(aes(x = gender, y = age),
       data = subset(pf , !is.na(gender)))+
  geom_boxplot()+
  stat_summary(fun.y = mean, geom = "point", shape = 4)

ggplot(aes(x = age, y = friend_count),
       data = subset(pf , !is.na(gender)))+
  geom_line(aes(color = gender), stat = "summary", fun.y = median)


library(dplyr)
#chain function together %>%
pf.fc_by_age_gender <- pf %>%
  filter(!is.na(gender)) %>%
  group_by(age, gender) %>%
  summarise(mean_friend_count = mean(friend_count),
            median_friend_count = median(friend_count),
            n = n())%>%
  ungroup()%>%
  arrange(age)

head(pf.fc_by_age_gender)

# Create a line graph showing the
# median friend count over the ages
# for each gender.
ggplot(aes(x = age, y = median_friend_count),
       data = pf.fc_by_age_gender)+
  geom_line(aes(color = gender))


#female has x time friends than male
#Reshaping Data
install.packages("reshape2")
library(reshape2)

pf.fc_by_age_gender.wide <- dcast()





