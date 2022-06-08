#' Returns expected lifespan (UK) given age and sex
#'
#' @param age age in years
#' @param sex "male" or "female"
#' 
#' @export
average_lifespan = function(age, sex, lifespan){

  # conversion to allow requests via query arguments 
  age = as.numeric(age)
  
  lifespan[lifespan$age == age & lifespan$sex == sex, 3]
  
}