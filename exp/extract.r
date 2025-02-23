# R code
# Luis P. F. Garcia 2018
# Export the best model based on the accuracy

extract <- function(data, result, wtype, ftype, size) {

  result = do.call("rbind", lapply(result, "[", "acc",))
  clf = names(which.max(colMeans(result)))
  user = which.max(result[,clf])

  data = window(data$tran[[user]], wtype, ftype, size)
  model = eval(call(clf, data, data))
  return(model$model)
}
