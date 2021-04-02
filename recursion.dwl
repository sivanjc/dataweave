%dw 2.0
output application/json

fun recursiveChange(a: Array) = 
    a map if($ is Number) ($ +2 ) else recursiveChange($)
---
recursiveChange(payload)

/**
 * input payload
[
    1,2, [
        3, [
            4,5, [
                6,[7,8,
                [
                    9
                ]]
            ]
        ]
    ]
]
 */
