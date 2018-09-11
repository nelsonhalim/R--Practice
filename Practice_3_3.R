# Question 3
library(readxl)
data <- read_excel("Purchase Orders.xlsx", 
                   skip = 2)
View(data)

# Section (a)
y = table(data$Supplier)
barplot(y, cex.names = 0.3, xlab = "Supplier", ylab = "Frequency")

# Section (b) --> Pareto Analysis
data$`Cost per order` = sort(data$`Cost per order`, decreasing = TRUE)
total = sum(data$`Cost per order`)
data["Relative Proportion"] = data$`Cost per order`/ total
data["Cummulative"] = cumsum(data$`Relative Proportion`)
View(data[c(7,11,12)])

# 51.8% of the purchases is fullfilled by the first 15 orders
# Since there are 94 orders, 15/94 or 16.0% of the orders cover 51.8% of the purchase proportion

# Less than 4-% orders account for more than 80% of the cost