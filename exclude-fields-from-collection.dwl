%dw 2.0
output application/json
---
payload filterObject ((value, key, index) -> ( value != "NULL" ) and ( value != " ") and ( value != "") )
