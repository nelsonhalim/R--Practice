# Question 4
library(readxl)
dataset <- read_excel("Sales Transactions.xlsx", 
                      skip = 2)
View(dataset)

# Section (a)

# Part (i)
region = table(dataset$Region)

# Pie chart can show the relative proportion clearly
n = nrow(dataset)
lbls = names(region)
pct = round(region/n *100, digits = 2)
lbls <- paste(lbls, pct)
lbls <- paste(lbls,"%",sep="")
pie(region, labels = lbls, main = "Proportion of customers per region",
    radius=1, col = c("red", "blue", "yellow", "green")
    )

# Bar chart can show the comparison between different categories
barplot(region, main = "No. of customers per region",
        col = c("red", "blue", "yellow", "green"),
        xlab = "Region", ylab = "No. of customers",
        ylim = range(seq(0,200,10))
        )

# Part (ii)
payment = table(dataset$Payment)

# Pie chart can show the relative proportion clearly
n = nrow(dataset)
lbls = names(payment)
pct = round(payment/n *100, digits = 2)
lbls <- paste(lbls, pct)
lbls <- paste(lbls,"%",sep="")
pie(payment, labels = lbls, main = "Proportion of payment methods",
    radius=1, col = c("red", "blue")
)

# Bar chart can show the comparison between different categories
barplot(payment, main = "Comparison between payment methods",
        col = c("red", "blue"),
        xlab = "Payment", ylab = "No. of customers",
        ylim = range(seq(0,350,10))
)

# Part (iii)
source = table(dataset$Source)

# Pie chart can show the relative proportion clearly
n = nrow(dataset)
lbls = names(source)
pct = round(source/n *100, digits = 2)
lbls <- paste(lbls, pct)
lbls <- paste(lbls,"%",sep="")
pie(source, labels = lbls, main = "Proportion of Sources",
    radius=1, col = c("yellow", "green")
)

# Bar chart can show the comparison between different categories
barplot(source, main = "Comparison between sources",
        col = c("yellow", "green"),
        xlab = "Source", ylab = "No. of customers",
        ylim = range(seq(0,350,10))
)

# Part (iv)
product = table(dataset$Product)

# Pie chart can show the relative proportion clearly
n = nrow(dataset)
lbls = names(product)
pct = round(product/n *100, digits = 2)
lbls <- paste(lbls, pct)
lbls <- paste(lbls,"%",sep="")
pie(product, labels = lbls, main = "Proportion of Productss",
    radius=1, col = c("yellow", "green")
)

# Bar chart can show the comparison between different categories
barplot(product, main = "Comparison between products",
        col = c("yellow", "green"),
        xlab = "Products", ylab = "No. of customers",
        ylim = range(seq(0,300,10))
)

# Section (b)
north = subset(dataset, dataset$Region=="North")
east = subset(dataset, dataset$Region=="East")
south = subset(dataset, dataset$Region=="South")
west = subset(dataset, dataset$Region=="West")

# Part (i)
# Checking for north
prod_north = table(north$Product)
prod_north
# Book (43) is slightly more popular than DVD (42)

# Checking for east
prod_east = table(east$Product)
prod_east
# Book (56) is more popular than DVD (42)

# Checking for south
prod_south = table(south$Product)
prod_south
# Book (62) is more popular than DVD (37)

# Checking for west
prod_west = table(west$Product)
prod_west
# Book (100) is more popular than DVD (90)

# Part (ii)
# Checking for north
pay_north = table(north$Payment)
pay_north
# Credit (50) is  more popular than Paypal (35)

# Checking for east
pay_east = table(east$Payment)
pay_east
# Credit (74) is more popular than Paypal (24)

# Checking for south
pay_south = table(south$Payment)
pay_south
# Credit (61) is more popular than Paypal (38)

# Checking for west
pay_west = table(west$Payment)
pay_west
# Credit (114) is more popular than Paypal (76)

# Section (c)
dataset["No Customers"] = 1

library(reshape2)
x = dataset[c("Region","Source","No Customers")]
x.wide = dcast(x, `Region` ~`Source`, value.var="No Customers")
value = as.matrix(x.wide[, c(3,2)])
labels = c("Web", "Email")
barplot(value, main = "Clustered Bar Chart", 
        beside=T, col=colors()[c(23,89,12,45)], 
        names.arg =labels, legend.text = c("East","North","South","West")
        )
# The combination with most customers is Web and West region

# Section (d)
hist(dataset$Amount, breaks = 20, xlab = "Amount",
     xlim = range(seq(0,250,10)),
     ylim = range(seq(0,250,10))
     )
# The most frequent spending amount is between $20-$30

# Section (e) --> Pareto Analysis
dataset$Amount = sort(dataset$Amount, decreasing = T)
total = sum(dataset$Amount)
dataset["Relative Proportion"] = dataset$Amount/total
dataset["Cumulative"] = cumsum(dataset$`Relative Proportion`)
View(dataset[c(6,10,11)])

# More than 50% of the amount is accounted by less than 10% sales
# Less than 55% sales account for more than 80% of the amount

