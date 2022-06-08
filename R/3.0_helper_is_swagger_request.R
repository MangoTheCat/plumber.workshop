#' Checks if HTTP request is from Swagger 
#'
#' @param path_info Path info from a HTTP request object (plumber)
#' 
#' @export
is_swagger_request = function(path_info){
  
  # typical swagger paths
  swagger_urls = c("/__docs__/", "/__swagger__/", "/openapi.json")
  
  any(sapply(swagger_urls, function(x) grepl(x, path_info)))
  
} 
