#' Logs some information about the incoming HTTP request
#'
#' @param req HTTP request object (plumber)
#' 
#' @export
logger = function(req){
  
  # anything printed to standard output is captured in the logs
  # this is a common logging paradigm and compatible with most 
  # depoyment environments 
  cat(as.character(Sys.time()), "-",
      req$REQUEST_METHOD, req$PATH_INFO, "-",
      req$HTTP_USER_AGENT, "@", req$REMOTE_ADDR, "\n")
  
  plumber::forward() # forwards to next filter or endpoint
  
}