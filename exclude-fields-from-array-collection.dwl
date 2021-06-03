%dw 2.0
output application/json
---
payload map ( index, value ) -> 
    index filterObject ((value, key, index) -> ( value != "NULL" ) and ( value != " ") and ( value != "") )
