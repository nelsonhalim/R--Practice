# Question 1
library(readxl)
BD <- read_excel("Credit Risk Data.xlsx", 
                 sheet = "Base Data", skip = 2)
View(BD)

# Section (a)
x = table(BD$`Loan Purpose`)
pie(x, radius=1)

# Section (b)
BD["Total Balance"] = BD$Checking + BD$Savings
plot(BD$`Months Employed`,BD$`Total Balance`)

# Section (c)
histogram = hist(BD$`Months Customer`, breaks = 10, 
                 xlim = range(seq(0,80,10)), ylim = range(seq(0,100,10))
                 )
histogram

mon = BD$`Months Customer`
range(mon)
breaks = seq(0,80,10) # bins
mon.cut = cut(mon, breaks, right = T)
mon.freq = table(mon.cut) #compute frequency
mon.relfreq = mon.freq/nrow(BD) # computer relative frequency
mon.cumrelfreq = c(0, cumsum(mon.relfreq)) # compute cumulative relative frequency
cbind(mon.freq, mon.relfreq, cumsum(mon.relfreq))

plot(breaks, mon.cumrelfreq, main="Ogive", xlab = "Customer Months", ylab = "Cumulative Relative Frequency")
lines(breaks, mon.cumrelfreq)

# BD["Months_Customer"] = NA
# BD$Months_Customer[BD$`Months Customer`>0 & BD$`Months Customer`<=10] = "0 < x <= 10"
# BD$Months_Customer[BD$`Months Customer`>10 & BD$`Months Customer`<=20] = "10 < x <= 20"
# BD$Months_Customer[BD$`Months Customer`>20 & BD$`Months Customer`<=30] = "20 < x <= 30"
# BD$Months_Customer[BD$`Months Customer`>30 & BD$`Months Customer`<=40] = "30 < x <= 40"
# BD$Months_Customer[BD$`Months Customer`>40 & BD$`Months Customer`<=50] = "40 < x <= 50"
# BD$Months_Customer[BD$`Months Customer`>50 & BD$`Months Customer`<=60] = "50 < x <= 60"
# BD$Months_Customer[BD$`Months Customer`>60 & BD$`Months Customer`<=70] = "60 < x <= 70"
# BD$Months_Customer[BD$`Months Customer`>70 & BD$`Months Customer`<=80] = "70 < x <= 80"

# a = as.data.frame(table(BD$Months_Customer))
# a["CummFreq"] = cumsum(a["Freq"])

# plot(a[c(1,3)], type="o", xlab = "Months as customer", ylab="Cummulative Frequency")