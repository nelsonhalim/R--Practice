# Question 1
library(readxl)
BD <- read_excel("Credit Risk Data.xlsx", 
                 sheet = "Base Data", skip = 2)
View(BD)

# Section (a)
BD["Frequency"] = 1
x = tapply(BD$Frequency, BD$`Loan Purpose`,FUN=sum)
x
pie(x, radius=1)

# Section (b)
BD["Total Balance"] = BD$Checking + BD$Savings
plot(BD$`Months Employed`,BD$`Total Balance`)

# Section (c)
hist(BD$`Months Customer`)