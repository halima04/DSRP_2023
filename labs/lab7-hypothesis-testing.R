
library(tidyr)

library(janitor)

library(dplyr)

library(ggplot2)

library(corrplot)

data<-read.csv("C:/Users/Liza/Documents/Salary_Data.csv")
print(data)


# Part 1: Test for a significant difference between 2 groups


## null hypothesis: average salary of male and female employers with a Master's is the same
## alternative hypothesis: average salary of male and female employers with a Master's is different

avg_salary <- data |> filter(Education.Level == "Master's", Salary > 0)
male <- avg_salary |> filter(Gender == "Male")
female <- avg_salary |> filter(Gender == "Female")

t.test(male$Salary, female$Salary, paired = F,
       alternative = "two.sided")

## p-value = 0.08402
## not significant, failed to reject the null hypothesis

-----------------------------------------------------------------------------------------------------

# Part 2: Test for a significant difference between 3+ groups
  
  
## Which 3 jobs are the most common?  
top3jobs <- data |>
  summarize(.by = Job.Title,
            count = sum(!is.na(Job.Title))) |>
  slice_max(count, n = 3)

top3jobs


data_top3jobs <- data |>
  filter(Job.Title %in% top3jobs$Job.Title)

data_top3jobs


## null hypothesis: the salary of each of the 3 top jobs is the same
## alternative hypothesis: the salary of each of the 3 top jobs is different

a <- aov(Salary ~ Job.Title, data_top3jobs)
summary(a)
TukeyHSD(a)

## p-value = 0.0372984 
## there is significant difference in salary between Software Engineer Manager and Data Scientist so we can reject the null hypothesis

----------------------------------------------------------------------------------------------------------------------------------------

# Part 3: Test for a significant association between categorical variables


## null hypothesis: there is no relationship btw. gender and job title
## alternative hypothesis: there is a relationship btw. gender and job title
  
## clean data
data_clean <- data_top3jobs |>
  filter(!is.na(Gender),
         !is.na(Job.Title))

## plot the counts of gender and job title
ggplot(data_clean, aes(x = Gender, y = Job.Title)) +
  geom_count() +
  theme_minimal() 
  
## make contingency table
t <- table(data_clean$Job.Title, data_clean$Gender)
t

## chi squared test
chi <- chisq.test(t)
chi$p.value
chi$residuals

corrplot(chi$residuals, is.cor = F)

## p-value = 5.799167e-07
## there is an significant association between Gender and Job Title



