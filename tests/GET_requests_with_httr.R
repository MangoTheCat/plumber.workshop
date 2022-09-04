library(httr)

# test the /greetings endpoint
response = httr::GET("http://localhost:80/greetings?name=Bob")

print(response$status)
print(httr::content(response))

# test the /add endpoint 
response = httr::GET("http://localhost:80/add?x=1&y=2")

print(response$status)
print(httr::content(response))

# test the /iris endpoint

# < Enter code to test iris endpoint >


