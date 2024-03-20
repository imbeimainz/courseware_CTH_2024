# CTHKurs Correlation and Regression
# P. Mildenberger
# 2024-03-20


#################################################
# run this script before working on the tutorials
#################################################


### install the required packages (libraries)
add.packages <- c("carData","irr","knitr","MASS","pwr","rgl","TH.data","vcdExtra")
new.packages <- add.packages[!(add.packages%in%installed.packages()[,"Package"])]
install.packages(new.packages)


### load the required libraries
library(MASS)
library(TH.data)
library(knitr)
library(irr)
library(tidyr)
library(carData)
library(pwr)
library(rgl)
library(vcdExtra)



### correlations tutorial

# delete some variables from the bodyfat data
bodyfat.tutorial <- bodyfat[, -(7:10)]

# create artificial data - nonlinear correlation
set.seed(42)
var.1 <- rnorm(n = 100, mean = 20, sd = 5)
set.seed(43)
var.2 <- (var.1^5 + rnorm(n = 100, sd = 1e+6)) / 1e+6

# plot(var.1, var.2)
data.nl <- data.frame(var.1, var.2)
rm(var.1); rm(var.2)


# create artificial data - repeated measures
set.seed(44)
weights.mean <- rnorm(20, mean = 70, sd = 10)
data.bodyweights <- data.frame(ID = rep(1:20, times = 5), 
                               bodyweight = rep(weights.mean, times = 5),
                               measurement.no = rep(1:5, each = 20))

set.seed(45)
data.bodyweights$bodyweight <- data.bodyweights$bodyweight + rnorm(100, mean = 0, sd = 2.5)
data.bodyweights.wide <- spread(data.bodyweights, key = measurement.no, value = bodyweight, sep = ".")
rm(weights.mean)



### logistic regression tutorial


### linear regression 

################################################################################

### visualization of multiple regression

# 
# cholesteroldata <- read.csv2("cholesterol.csv")
# lm2 <- lm(chol~bmi+age,data=cholesteroldata)
# attach(cholesteroldata)
# 
# rglplot <- plot3d(bmi,age,chol,size = 0.8,type = "s")
# 
# coefs <- coef(lm2)
# a <- coefs["bmi"]
# b <- coefs["age"]
# c <- -1
# d <- coefs["(Intercept)"]
# rglplanes <- planes3d(a, b, c, d, alpha = 0.5,col = 3)
# 
# 
# AA <- cholesteroldata
# BB <- cbind(AA[,1:2],chol=lm2$fitted.values)
# CC <- rbind.data.frame(AA,BB)
# CC <- CC[sort.list(CC$bmi),]
# rglsegments <- segments3d(CC,col=2,lwd=2.5,alpha=0.6)
# 
# detach(cholesteroldata)

################################################################################

#### create artificial data - sample size estimation
set.seed(21)
N   <- 200
age <- runif (N,25,70) 
sex <- rbinom(N,1,0.5)
Dos <- 1+ rbeta(N,3,3) + 0.2*sex - 0.001 * age
Bio <- 50 + 25*Dos + age + 20*sex +  rnorm(N,0,25)  

Dosis <- data.frame(Dos,age,sex,Bio)


#### create artificial data - prospective study
set.seed(8)
N   <- 270
age <- runif (N,25,70) 
sex <- rbinom(N,1,0.5)
Dos <- 1+ rbeta(N,3,3) + 0.2*sex - 0.001 * age
Bio <- 50 + 25*Dos + age + 20*sex +  rnorm(N,0,25)  

Dosis.prospective270 <- data.frame(Dos,age,sex,Bio)
Dosis.prospective150 <- Dosis.prospective270[1:150,]

rm(N,age,sex,Dos,Bio)
