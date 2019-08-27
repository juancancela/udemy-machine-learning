# Data Preprocessing
# Import Dataset
ds = read.csv('Salary_Data.csv')

# Splitting dataset into training and test sets
# install.packages(caTools)
library(caTools)
set.seed(123)
split = sample.split(ds$Salary, SplitRatio = 2/3)
training_set = subset(ds, split == TRUE)
test_set = subset(ds, split == FALSE)

# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

# Predict the Test set results
y_pred = predict(regressor, newdata = test_set)

# Visualising Training set results
# install.packages('ggplot2')
library(ggplot2)
ggplot() + 
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') + 
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Training set)') +
  xlab('Years of experience') + 
  ylab('Salary')


# Visualising Test set results
# install.packages('ggplot2')
library(ggplot2)
ggplot() + 
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') + 
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Test set)') +
  xlab('Years of experience') + 
  ylab('Salary')





