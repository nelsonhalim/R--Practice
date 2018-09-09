library(readxl)
dataset <- read_excel("R/Store and Regional Sales Database.xlsx", 
                      skip = 2)
View(dataset)

monitor_24 = subset(dataset, dataset$`Item Description` == '24" Monitor')
monitor_24

write.csv(monitor_24, "Monitor_sale.csv")

