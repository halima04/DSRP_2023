library(dplyr)
library(ggplot2)

data<-read.csv("C:/Users/Liza/Documents/Salary_Data.csv")
print(data)


#filter
filter(data, Education.Level == "Master's", Years.of.Experience > 20)


#arrange
arrange(data, Age, Salary)


#select
select(data, Age, Education.Level, Salary)


#mutate
data_edit <- select(data, Age, Education.Level, Salary)
data_edit

mutate(data_edit,
       age_m = Age/12,
       salary_w = Salary/4)

transmute(data_edit,
          age_m = Age/12,
          salary_w = Salary/4)
    

#summarize
summarize(data_edit, 
          mean_age = mean(Salary, na.rm = T),
          .by = Education.Level)
      

