#' Calculates 10-year risk of cardiovascular disease
#'
#' @param sex "male" or "female"
#' @param age age in years
#' @param bmi body-mass index
#' @param sbp Systolic blood pressure
#' @param bp_med On blood pressure medication 1=Yes, 0=No
#' @param smoker Are you a smoker 1=Yes, 0=No
#' @param diabetes Do you have diabetes 1=Yes, 0=No
#' 
#' @export
cvd_event_risk = function(sex, age, bmi, sbp, bp_med, smoker, diabetes){
  
  an = as.numeric
  
  risk = CVrisk::ascvd_10y_frs_simple(sex, an(age), an(bmi), an(sbp), an(bp_med), an(smoker), an(diabetes))
  
  return(paste0("Your 10-year CVD risk is ", risk, "%"))
  
}