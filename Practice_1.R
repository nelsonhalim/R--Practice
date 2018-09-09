# Set Working Directory
setwd("R")

# Importing dataset
library(readxl)
BD <- read_excel("Credit Risk Data.xlsx", 
                 sheet = "Base Data", skip = 2)
View(BD)

# Question (d) (i)
n_columns = ncol(BD)
n_columns
str(BD)

# Question (d) (ii)
n_rows = nrow(BD)
n_rows

# Question (e)
colvec_marital = BD[["Marital Status"]]
colvec_marital

# Question (f)
colvec_marital[40]

# Question (g) (i)
f_object = factor(colvec_marital)
f_object

# Question (g) (ii)
nlevels(f_object)

# Question (h)
Savings_40 = BD[["Savings"]][40]
Savings_25 = BD[["Savings"]][25]
if (Savings_40 < Savings_25){
  difference = Savings_25 - Savings_40
  print("25th applicant has more savings")
  print(difference)
} else {
  difference = Savings_40 - Savings_25
  print("40th applicant has more savings")
  print(difference)
}

# Question (i)
write.csv(BD, "credit_risk.csv")
