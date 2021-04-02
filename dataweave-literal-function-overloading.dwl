%dw 2.0
output application/json
 
type BadWeather = "stormy" | "rainy"
 
fun recommendation(actualWeather: "sunny") = "You should take your sunglasses!"
fun recommendation(actualWeather: "cloudy") = "Great day! It is cloudy out there"
fun recommendation(actualWeather: BadWeather) = "You should take your umbrella!"
---
recommendation(payload.weatherCondition)

/*
Sample payload

{
    "weatherCondition" : "stormy"
}
*/
