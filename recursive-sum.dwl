%dw 2.0
output application/json

fun recursiveSum(n: Number) =
    if ( n > 0) n + recursiveSum(n-1) else 0
---
recursiveSum(10)
