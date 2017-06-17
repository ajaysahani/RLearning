#--------------Types of Data----------------------
# 1_Quantitative data:measurment of quantity of something
# a:Discrete data= eg: no of arrivals ,no of success :: represented by integers
# b:Continious data= eg: height,weight,length,time :: represented by decimals

# example
# 1:Annual Precipitions in US Cities- avg amnt of rainfall for each 70 cities
# quantitative continious data
str(precip)
precip[1:4]

# 2:Lengths of Major North American Rivers
# quantitative continious data
str(rivers)

# 3:Yearly no. of important Discoveries
str(discoveries)
discoveries[1:4]



#--------------------Displaying Qunatitive Data--------------
# Strip Charts(Dot Plots)
stripchart(precip, xlab = "rainfall")
str(precip)
stripchart(rivers, method = "jitter",xlab = "length")
str(rivers)
stripchart(discoveries,method = "stack",xlab = "number")
str(discoveries)

# Histogram (typically used with continious data)
# Annual Precipitation in US Cities
hist(precip, main="Histogram of precip")
hist(precip, freq = FALSE, main = "Histogram of precip")
#change bins slightly (with break argument to hist)
hist(precip,breaks = 10,main="")
hist(precip,breaks = 200,main = "")

# Stemplots(stems and leaves)
#https://stackoverflow.com/questions/5567500/can-not-load-package-tcltk-in-r
# UKDriverDeath time series
install.packages("tcltk",dependencies = TRUE)
library(aplpack)
help(aplpack)
??aplpack
stem.leaf(UKDriverDeaths,depths = FALSE)
str(UKDriverDeaths)

# Index Plot
plot(LakeHuron, type="h")
str(LakeHuron)
plot(LakeHuron, type="p")


#Qualitative Data, Categorical Data, Factors
str(state.abb)
state.abb[1:50]
str(state.region)


#---------------Displaying Qualitaive Data--------------------
# table
tbl <- table(state.division)
tbl
#relative frequencies
tbl/sum(tbl)
#same thing
prop.table(tbl)


# Bar Graph
barplot(table(state.region),cex.names = 0.6)#cex.names label size
?state.region
str(state.region)
barplot(prop.table(table(state.region)), cex.names = 0.5)


# Pareto Diagrams
install.packages("qcc",dependencies = TRUE)
library(qcc)
pareto.chart(table(state.division), ylab = "Frequency")

# Dot Charts
x <- table(state.region)
dotchart(as.vector(x),labels = names(x))


# Clusters and Gaps
library(aplpack)
stem.leaf(faithful$eruptions)

#----------------Outliers-----------------------------
boxplot.stats(rivers)$out
boxplot.stats(rivers,coef = 3)$out
str(rivers)



#-------------Multivariate Data and Data Frames---------------
x <- 5:8
y <- letters[3:6]
A <- data.frame(v1=x, v2=y)
A
A[3,]
A[,2]
names(A)
A$v1


