# !source mlflow::mlflow_run(entry_point = .file)

library(mlflow)
library(glmnet)

args <- commandArgs()
cat(args, sep = "\n")

wine_file <- pins::pin("https://raw.githubusercontent.com/rstudio/mlflow-example/master/wine-quality.csv")

train <- read.csv(wine_file)

train_x <- as.matrix(train[, !(names(train) == "quality")])
train_y <- train[, "quality"]

with(mlflow_start_run(), {
  alpha <- mlflow_log_param("alpha", mlflow_param("alpha", 0.7))
  lambda <- mlflow_log_param("lambda", mlflow_param("lambda", 0.4))
  
  model <- glmnet(train_x, train_y, alpha = alpha, lambda = lambda, family = "gaussian")
  predicted <- glmnet::predict.glmnet(model, train_x)
  
  rmse <- sqrt(mean((predicted - train_y)^2))
  mae <- mean(abs(predicted - train_y))
  
  mlflow_log_metric("rmse", rmse)
  mlflow_log_metric("mae", mae)
})
