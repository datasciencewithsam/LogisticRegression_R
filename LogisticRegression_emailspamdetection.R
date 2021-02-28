#LOAD KERNLAB FOR DATASET
library(kernlab)
data("spam")

#VIEW THE DATASET
View(spam)

#IGNORE VARIABLES THAT ARE NOT NECESSARY FOR BUILDING LOGISTIC REGRESSION MODEL
spam = spam[,c(49:58)]
str(spam)

# Make sure response variable is binary
spam$type <- ifelse(spam$type == "spam", 1, 0)
str(spam)

# Make sure categorical variables are factors
spam$type = as.factor(spam$type)
str(spam)

fit <- glm(type ~ ., data = spam, family = "binomial")
summary(fit)                                                                                                                                                                                                       

#Set the thresold value
decision_boundary = 0.5

#Predict the outcome based on probability value coming from the model and predetermined thresold value
pred <- ifelse(fitted(fit) > decision_boundary , 1, 0)

View(pred)

