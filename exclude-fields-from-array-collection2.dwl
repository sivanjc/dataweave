%dw 2.0
output application/json
---
payload map ( index, value ) -> 
    index filterObject ((valuex, key, index) -> ( valuex != "NULL" ) and ( valuex != " ") and ( valuex != "") )
