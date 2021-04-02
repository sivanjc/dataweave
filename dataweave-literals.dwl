%dw 2.0
import fail from dw::Runtime
output json
//Same function without using literal types.
fun weatherMessage(todayWeather: String) =
   if (["sunny", "rainy", "cloudy", "stormy"] contains todayWeather)
       "The weather for today is: " ++ todayWeather
   else
       fail("Weather not supported")
---
weatherMessage("cloudy")
