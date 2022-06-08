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


#################################################################
##                          endpoints                          ##
#################################################################


#* CVD risk calculator 
#* Returns risk of CVD event in the next 10-years 
#* 
#* @param gender:str male or female
#* @param age:int age years (30-74)
#* @param bmi:dbl body-mass index kg/m2 (average ~= 22)
#* @param sbp:dbl Systolic blood pressure mmHg (average ~= 120)
#* @param bp_med:int On blood pressure medication 1=Yes, 0=No
#* @param smoker:int Are you a smoker 1=Yes, 0=No
#* @param diabetes:int Do you have diabetes 1=Yes, 0=No
#* 
#* @post /heart_disease_risk
#* @serializer unboxedJSON
plumber.workshop::cvd_event_risk