library(httr)
library(jsonlite)

# test the /heart_disease_risk endpoint
data = list(sex="female", age=50, bmi=26, sbp=126, bp_med=0, smoker=1, diabetes=0)

response = httr::POST(url = "http://localhost:80/heart_disease_risk", 
                      body = jsonlite::toJSON(data))

print(response$status)
print(httr::content(response))



