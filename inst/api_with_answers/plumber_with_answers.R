#* @apiTitle EARL Plumber workshop 
#* @apiDescription An API with demo filters and endpoints


#################################################################
##                          libraries                          ##
#################################################################

if(!require(CVrisk)){
  install.packages("CVrisk")
}
library(CVrisk)

#################################################################
##                         global data                         ##
#################################################################

lifespan_path = system.file("extdata", "lifespan_data_UK.tsv", package = "plumber.workshop")
lifespan = read.table(lifespan_path, sep="\t", h=T)


#################################################################
##                           filters                           ##
#################################################################

#* @filter log
plumber.workshop::logger

#* @filter auth
plumber.workshop::authorizer


#################################################################
##                          endpoints                          ##
#################################################################


#* CVD risk calculator 
#* Returns risk of CVD event in the next 10-years 
#* 
#* @param sex:string "male" or "female"
#* @param age:int age in years
#* @param bmi:dbl body-mass index
#* @param sbp:dbl Systolic blood pressure
#* @param bp_med:int On blood pressure medication 1=Yes, 0=No
#* @param smoker:int Are you a smoker 1=Yes, 0=No
#* @param diabetes:int Do you have diabetes 1=Yes, 0=No
#* 
#* @post /heart_disease_risk
#* @serializer unboxedJSON
plumber.workshop::cvd_event_risk


#* Check the API is working
#* 
#* @preempt auth
#* @get /ok
\() "OK" 


#* Greetings {name}
#* 
#* @param name:string User name
#* 
#* @preempt auth
#* @get /greetings
\(name) paste0("Hello ", name, "!")


#* Returns the sum of two numbers 
#* 
#* @param x:int 
#* @param y:int 
#* 
#* @preempt auth
#* @serializer unboxedJSON
#* @get /add
\(x, y) as.numeric(x) + as.numeric(y)


#* Returns a random normal histogram 
#* 
#* @preempt auth
#* @serializer png
#* @get /histogram
\() hist(rnorm(1000))


#* Returns a random TSV
#*  
#* @preempt auth
#* @serializer tsv
#* @get /iris
\() iris


#* Returns expected lifespan given age and sex
#* 
#* @param age:int age in years (0-100)
#* @param sex:string "male" or "female"
#* 
#* @serializer unboxedJSON
#* @post /average_lifespan
\(age, sex){
  
  plumber.workshop::average_lifespan(age, sex, lifespan)
  
}

#* Debugging endpoint
#* @preempt auth
#* @post /browser
\(req, res){
  browser()
}

