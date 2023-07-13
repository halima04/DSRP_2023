install.packages("ggplot2")
library(ggplot2)

data<-read.csv("C:/Users/Liza/Documents/Salary_Data.csv")
print(data)


## Plot 1
ggplot(data = data, aes(x = Gender)) +
  geom_bar() + labs(title = "Distribution of Gender Among Employers", 
                    y = "Number of Employers",
                    x = "Gender")


ggplot(data = data, aes(x = Gender, y = Salary)) +
  geom_bar(stat = "summary",fun = "mean")


## Plot 2
ggplot(data = data, aes(x = Gender, y = Salary, fill = Gender )) +
  geom_boxplot()+ 
  labs(title = "Distribution of Salary by Gender", 
       y = "Gender",
       x = "Salary")

data$Gender <- factor(data$Species, levels = ("versicolor", "setosa", "virginica"))

ggplot(data = data, aes(x = Age, y = Years.of.Experience)) +
  geom_point()+
  geom_smooth(se = F)

ggplot(data = data, aes(x = Age, y = Years.of.Experience)) +
  geom_jitter(width = 0.5)


## Plot 3
ggplot(data = data, aes(x = Age, y = Years.of.Experience)) +
  geom_line(stat="summary", fun = "mean")+
  labs(title = "Average Years of Experience per Age", 
       y = "Years of Experience",
       x = "Age")


