# Question 2
library(readxl)
dataset <- read_excel("Store and Regional Sales Database.xlsx", 
                      skip = 2)
View(dataset)

# Section (a)
dataset["Frequency"] = 1
n = nrow(dataset)
x = tapply(dataset$Frequency, dataset$`Sales Region`,FUN=sum)
lbls = c("East","North","South")
pct = x/n *100
lbls <- paste(lbls, pct)
lbls <- paste(lbls,"%",sep="")
pie(x, labels = lbls ,radius=1)

# Section (b)
monitor_24 = subset(dataset, dataset$`Item Description` == '24" Monitor')
#data = monitor_24[["Units Sold"]]
#colnames(data)=monitor_24[["Weeks Ending"]]
#barplot(data, col=colors()[c(40,90,120)], border="white", space=0.04, font.axis=2, beside=T)

#x = aggregate(monitor_24$`Units Sold`, by=list(monitor_24$`Store No.`, monitor_24$`Week Ending`), FUN=sum)
#x
#data = x$x
#colnames(data) = x$Group.2
#rownames(data) = x$Group.1
#barplot(data, col=colors()[c(23,89,12)] , space=1, border="white", font.axis=2, beside=T, legend=rownames(data), xlab="group", font.lab=2)

