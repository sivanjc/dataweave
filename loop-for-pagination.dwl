%dw 2.0
output application/json
var loopCount = 1000
---
((1 to loopCount) as Array<Number>)
              map ((item) -> {
                  iteration : $$
                })
