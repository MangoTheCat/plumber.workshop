#' Authorizes incoming request (demonstration purposes only)
#'
#' @param req HTTP request object (plumber)
#' @param res HTTP response object (plumber)
#' 
#' @export
authorizer = function(req, res){

  # if the incoming request is for swagger documentation - skip authorization
  # demonstration purposes only
  if(is_swagger_request(req$PATH_INFO)){

    plumber::forward()

  } else {

    # get the authorization key, this will need to be saved earlier using 
    # Sys.setenv(plumber_auth_key=[password])
    auth_key = Sys.getenv("plumber_auth_key")

    # get the authorization key from the header of the HTTP request 
    # it is not possible to add this using the swagger UI so will need 
    # to send the request using R or Postman 
    key = req$HTTP_AUTHORIZATION
    
    # Here the response is updated with custom error messages depending on whether 
    # the key is missing or incorrect
    # If the key is correct, the filter forwards without error
    if(is.null(key) || key == ""){
      res$status = 401
      list(error = "No authorization key provided")
    } else if(key!=auth_key){
      res$status = 401
      list(error = "Authorization key incorrect")
    } else {
      plumber::forward()
    }

  }

}