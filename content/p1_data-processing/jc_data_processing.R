# Data Processing

# Import Dataset
ds = read.csv('data.csv')
# ds = ds[, 2:3]

# Taking care of missing data
# ds$Age = ifelse(is.na(ds$Age), ave(ds$Age,
#                                   FUN = function(x) mean(x, na.rm = TRUE)),
#                                   ds$Age)
#
# ds$Salary = ifelse(is.na(ds$Salary),
#                   ave(ds$Salary,
#                       FUN = function(x) mean(x, na.rm = TRUE)),
#                       ds$Salary)

# Encoding categorical data
# ds$Country = factor(ds$Country,
#                    levels = c('France', 'Spain', 'Germany'),
#                    labels = c(1, 2, 3))
#
# ds$Purchased = factor(ds$Purchased,
#                    levels = c('No', 'Yes'),
#                    labels = c(0, 1))
#
#

# Splitting the dataset into the Training set and Test set
library(caTools)
set.seed(123)
split = sample.split(ds$Purchased, SplitRatio = 0.8)
training_set = subset(ds, split == TRUE)
test_set = subset(ds, split == FALSE)


# Feature Scaling
training_set[, 2: 3] = scale(training_set[, 2: 3])
test_set[, 2: 3] = scale(test_set[, 2: 3])

