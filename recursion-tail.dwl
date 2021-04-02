%dw 2.0
output application/json

fun tailRecursiveSum(n: Number, r: Number = 0) = 
    if ( n > 0 ) tailRecursiveSum( n - 1, r + n ) else r  
    
---
result : tailRecursiveSum(5)
