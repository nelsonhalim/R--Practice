# Question 2
library(readxl)
dataset <- read_excel("Store and Regional Sales Database.xlsx", 
                      skip = 2)
View(dataset)

# Section (a)
n = nrow(dataset)
x = table(dataset$`Sales Region`)
lbls = names(x)
pct = x/n *100
lbls <- paste(lbls, pct)
lbls <- paste(lbls,"%",sep="")
pie(x, labels = lbls ,radius=1)

# Section (b)
monitor_24 = subset(dataset, dataset$`Item Description` == '24" Monitor')
monitor_24 = monitor_24[c("Store No.","Units Sold","Week Ending")]
monitor_24 = as.data.frame(monitor_24)
monitor_24 = reshape(monitor_24, idvar="Store No.", timevar="Week Ending", direction = "wide")
monitor_24 = as.matrix(monitor_24[2:4])
labels = c("Oct","Nov","Dec")
barplot(monitor_24, beside=T, col=colors()[c(23,89,12,45,56,98,34,22)], names.arg =labels)

# Alternatively ... 
library(reshape2)
monitor = subset(dataset, dataset$`Item Description` == '24" Monitor')
wsu = monitor[c("Store No.","Units Sold","Week Ending")]
wsu.wide = dcast(wsu, `Store No.` ~`Week Ending`, value.var="Units Sold")
value = as.matrix(wsu.wide[, c(4,3,2)])
barplot(value, main = "Clustered Bar Chart", beside=T, col=colors()[c(23,89,12,45,56,98,34,22)], names.arg =labels)

# Section (c)
hist(dataset$`Units Sold`,xlab="Units Sold")