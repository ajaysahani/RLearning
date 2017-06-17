#---------------Arithmetic Operation----------------
# add
2+3

# multiply and divide
4*5/6

# 7 to the 8th power
7^8

# see more digits
options(digits = 16)
10/3

# square root
sqrt(2)

# Euler's constants, e
exp(1)

# pi
pi

# back to default digit
options(digits = 7)


#------------Assignment, Object names, and Data types
x <- 7*4/pi
x
a <- numeric(10)
a
b <- TRUE
typeof(b)

# integer: the value 0,1,-1,2,-2,3,-3,........,n,-n
# double: real numbers
# character: element that wrapped with pairs of " or '
# logical: includes TRUE,FALSE,NA(not available)

# isn't define
sqrt(-1)
sqrt(-1 + 0i)
sqrt(as.complex(-1))
(0 + 1i)^2
typeof((0+1i)^2)


#--------------------Vector--------------------------
# c stands for combine
x <- c(74, 31, 95, 61, 76, 34, 23, 54,96)
x

# scan: entering empty line stop
x <- scan()
x

# repeated data; regular patterns
seq(from = 1, to =5)
seq(from =1, to = 10, by = 2)
1:5

# Indeing data vectors
x[1]
x[2:4]
x[c(1,3,4,8)]
x[-c(1,3,4,8)]

LETTERS[1:5]
letters[1:5]


#-------------Table-------------------------------
a <- factor(c("A","A","B","A","B","B","C","A","C"))
results <- table(a)
results

#-------------------Matrix---------------------------
m <- matrix(c(4,3,2),ncol=3,byrow=TRUE)
m
colnames(m) <- c("A","B","C")
m



#-----------Functions and Expressions-----------------
a = c(2,4,6,3,1,5)
b = sort(a)
c = sort(a,decreasing = TRUE)
c

x<- 1:5
sum(x)
length(x)
min(x)
mean(x)
#standard deviation
sd(x)

help(sd)
?sd
??sd

#type the name of fuction w/o any parameter or argument
intersect
# mutiple function associated with rev function
rev
#check no of methods with rev
methods(rev)
#check one of methods signature
rev.default
#some functions are hidden by a namespace and are not visible on first try
wilcox.test
#non-visible functions are asterisked 
#if we try to access will get not found error
methods(wilcox.test)
exp

#user define functions
new_function <- function(a){
  for (i in 1:a){
    b<-i^2
    print(b)
  }
}
new_function(6)

#installing and Loading Add-on Packages
getOption("defaultPackages")
install.packages("foo",dependencies = TRUE)

#---------------------Logical Data----------------------
x <- 5:9
y <- (x<7.3)
y
!y


#--------------------Missing Data------------------------
x <- c(3,7,NA,4,7) #NA (Not Applicable)
y <- c(5,NA,1,2,2)
x+y

sum(x)
sum(x, na.rm = TRUE) #ignore NA

is.na(x)
z <- x[!is.na(x)]
sum(z)


#-------------Data Frames---------------
x <- 5:8
y <- letters[3:6]
A <- data.frame(v1=x, v2=y)
A
A[3,]
A[,2]
names(A)
A$v1


#--------------Reading from csv file------------------
h <- read.csv(file.choose(), head=TRUE, sep = ",")
h
dir()
getwd()
h$trial
h$mass
h$velocity
names(h)







