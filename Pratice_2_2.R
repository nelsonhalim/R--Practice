library(readxl)
dataset <- read_excel("Purchase Orders.xlsx", 
                      skip = 2)
View(dataset)

# Section a 
a = subset(dataset, dataset$`Order No.`=="Aug11008" | dataset$`Order No.`== "Sep11023" | dataset$`Order No.`=="Oct11020", select = c('Item Description', 'Cost per order'))
a

# Section b
write.csv(a,"outfile.csv", sep = " ", col.names = FALSE)

# Section c
dataset$`Delivery Time` = dataset$`Arrival Date` - dataset$`Order Date`

dataset$`Class` = NA
dataset$`Class`[dataset$`Delivery Time`<5] = "short"
dataset$`Class`[dataset$`Delivery Time`>=5 & dataset$`Delivery Time`<=9] = "medium"
dataset$`Class`[dataset$`Delivery Time`>9] = "long"

#dataset$Class<-ifelse(dataset$`Delivery Time`<5,"short",
#                    ifelse(dataset$`Delivery Time`>=5 & dataset$`Delivery Time`<=9,"medium","long"))
                          
sum(dataset$Class=="short")

# Section d 
d = dataset$`Cost per order`[dataset$`Item No.` == 1369]
d
write.csv(d, "PO1369s.csv")