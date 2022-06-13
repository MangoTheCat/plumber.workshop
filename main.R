  library(plumber)
  
  r <- plumb("inst/api/plumber.R")
  r$run(port=80, host="0.0.0.0")
  
  
