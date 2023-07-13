data<-read.csv("C:/Users/Liza/Documents/Salary_Data.csv")
print(data)


first100 <- data$Age [1:100]
mean(first100)
median(first100)
range(first100)
max(first100) - min(first100)
var(first100)
sd(first100)


IQR(first100) 
quantile(first100, 0.25) #Q1
quantile(first100, 0.75) #Q3

sl<- data$Years.of.Experience
mean(first100) - 3*sd(first100)
mean(first100) + 3*sd(first100)

as.numeric(quantile(sl,0.25) - 1.5*IQR(sl))
quantile(sl,0.75)+ 1.5*IQR(sl)


#outlier thresholds
numbers <- 1:100
lower <- -11.37118
upper <- 31.63118

numbers[numbers < lower]
numbers[numbers > upper]

numbers[numbers >= lower & numbers <= upper]
mean(numbers[numbers >= lower & numbers <= upper])

num <-numbers[numbers >= lower & numbers <= upper]
median(num)

