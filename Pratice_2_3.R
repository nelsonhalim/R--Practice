library(readxl)
BD <- read_excel("R/Credit Risk Data.xlsx", 
                 sheet = "Base Data", skip = 2)
View(BD)

# Section (a)
a = subset(BD, BD$`Loan Purpose` == 'New Car' & BD$Checking<500)
nrow(a)
write.csv(a, "customers.csv", col.names=TRUE)

# Section (b)
BD$`Total Balance` <- NA
BD$`Total Balance` = BD$Checking + BD$Savings

# Classifying in another column called Class
BD$`Class` <- NA
BD$`Class`[BD$`Total Balance`<250] = "low"
BD$`Class`[BD$`Total Balance`>=250 & BD$`Total Balance`<2000] = "medium"
BD$`Class`[BD$`Total Balance`>=2000] = "high"

# Section (c)
c1 = subset(BD, BD$Class == "low")
c2 = c1[c("Checking","Savings","Total Balance")]
c2
write.csv(c2, "balance.csv")

